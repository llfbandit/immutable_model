import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/nullability_suffix.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:im_model/im_model.dart';
import 'package:im_model_gen/src/class_hierarchy_info.dart';
import 'package:im_model_gen/src/gen_result.dart';
import 'package:im_model_gen/src/utils.dart';
import 'package:source_gen/source_gen.dart';

/// `true` if [classInfo] does not generate a copy proxy at all (abstract
/// class, or `ignoreCopy` at the class level with no per-field override).
bool copyFullyIgnored(ClassInfo classInfo) {
  return classInfo.isAbstract ||
      (classInfo.annotation.ignoreCopy &&
          classInfo.fields.every((f) => (f.annotation?.ignoreCopy ?? true)));
}

/// Inserts [newArg] as one more entry into a bracketed, comma-joined
/// type-parameter (or type-argument) list, e.g. `<G, T>` + `R` ->
/// `<G, T, R>`, and `''` + `R` -> `<R>`.
String _appendTypeArg(String typeArgs, String newArg) => typeArgs.isEmpty
    ? '<$newArg>'
    : '${typeArgs.substring(0, typeArgs.length - 1)}, $newArg>';

/// The import prefix (e.g. `c` for `import '...' as c;`) under which
/// [target]'s library is visible from [from], or `null` if it's imported
/// without a prefix (or declared in the same library).
String? _importPrefixFor(LibraryElement? from, InterfaceElement target) {
  if (from == null || from == target.library) return null;

  for (final import in from.firstFragment.libraryImports) {
    if (import.importedLibrary == target.library) {
      return import.prefix?.element.name;
    }
  }

  return null;
}

/// [type] rendered as valid source text from [from]'s perspective, with
/// every class reference — including ones nested in type arguments —
/// qualified with whatever import prefix makes it resolvable there.
String _qualifiedTypeString(DartType type, LibraryElement? from) {
  if (type is! InterfaceType) return type.getDisplayString();

  final element = type.element;
  final prefix = _importPrefixFor(from, element);
  final name = prefix == null ? element.name! : '$prefix.${element.name}';
  final args = type.typeArguments.isEmpty
      ? ''
      : '<${type.typeArguments.map((a) => _qualifiedTypeString(a, from)).join(', ')}>';
  final nullSuffix = type.nullabilitySuffix == NullabilitySuffix.question
      ? '?'
      : '';
  return '$name$args$nullSuffix';
}

/// The `implements $ISuperCopy<...>` clause needed when the superclass also
/// generates a copy proxy, so the subclass's `copyWith` getter is a valid
/// override of the inherited one. Safe: `super(...)` forwarding guarantees
/// the subclass's `call()` is always a superset of the superclass's.
/// Empty string if there's no such superclass.
String _superInterfaceClause(ClassInfo classInfo) {
  final superInfo = classInfo.superClass;
  final supertype = classInfo.element.supertype;
  if (superInfo == null || supertype == null || copyFullyIgnored(superInfo)) {
    return '';
  }

  final prefix = _importPrefixFor(classInfo.element.library, superInfo.element);
  final prefixStr = prefix == null ? '' : '$prefix.';

  final superArgs = supertype.typeArguments.map(
    (t) => _qualifiedTypeString(t, classInfo.element.library),
  );
  final rArgs = [...superArgs, '\$R'].join(', ');

  return ' implements $prefixStr\$I${superInfo.element.name}Copy<$rArgs>';
}

/// The chainable copy proxy for a nested `@ImModel` field.
class _NestedCopyInfo {
  const _NestedCopyInfo({
    required this.className,
    required this.rTypeArgs,
    required this.importPrefix,
  });

  /// The nested class's name.
  final String className;

  /// The nested proxy's type-argument list with `$R` appended,
  /// e.g. `<$R>` or `<String,int,$R>`.
  final String rTypeArgs;

  /// The import prefix (e.g. `c` for `import '...' as c;`) under which the
  /// nested class is visible from the field-declaring file, or `null` if
  /// it's imported without a prefix (or declared in the same library).
  final String? importPrefix;
}

class _CopyInterfaceTemplate {
  /// Generates a `Proxy` interface.
  String gen(
    ClassInfo classInfo,
    ClassHierarchyInfo hierarchy,
    String type,
    String typeParameters,
    String typeParameterNames,
    List<ConstructorParameterInfo> parameters,
  ) {
    final typeAnnotation = type + typeParameterNames;
    final impl = _CopyImplTemplate();

    final rTypeParameters = _withR(typeParameters);
    final rTypeParameterNames = _withR(typeParameterNames);

    final ignoreFlags = {
      for (final v in parameters) v: impl._ignoreCopy(classInfo, v),
    };

    final superClause = _superInterfaceClause(classInfo);

    return '''
      abstract interface class \$I${type}Copy$rTypeParameters$superClause {
        ${superClause.isEmpty ? '' : '@override'}
        ${impl.genCall(classInfo, ignoreFlags, typeAnnotation, parameters, true)};
        ${impl.genNestedGetters(ignoreFlags, hierarchy, parameters, true)}
      }

      class \$${type}Copy$rTypeParameters implements \$I${type}Copy$rTypeParameterNames {
        const \$${type}Copy(this._value, this._then);

        final $typeAnnotation _value;
        final \$R Function($typeAnnotation) _then;

        @override
        ${impl.genCall(classInfo, ignoreFlags, typeAnnotation, parameters, false)}

        ${impl.genNestedGetters(ignoreFlags, hierarchy, parameters, false)}
      }
    ''';
  }

  /// Appends a `$R` type parameter to a type-parameter (or type-argument)
  /// list, e.g. `<G, T extends Iterable<G>>` -> `<G, T extends Iterable<G>, $R>`
  /// and `''` -> `<$R>`.
  String _withR(String typeParams) => _appendTypeArg(typeParams, '\$R');
}

class _CopyImplTemplate {
  /// Generates the callable class function for copyWith(...).
  String genCall(
    ClassInfo classInfo,
    Map<ConstructorParameterInfo, bool> ignoreFlags,
    String typeAnnotation,
    List<ConstructorParameterInfo> sortedFields,
    bool isAbstract,
  ) {
    final constructorInput = sortedFields.fold<String>('', (r, v) {
      if (ignoreFlags[v]!) {
        return r;
      }

      if (isAbstract) {
        final type = v.type.endsWith('?')
            ? _convertToMutable(v)
            : '${_convertToMutable(v)}?';
        return '$r $type ${v.parameterName},';
      } else {
        return '$r Object? ${v.parameterName} = \$undefined,';
      }
    });

    final parameters = sortedFields.fold<String>('', (r, v) {
      final param = '$r ${v.isPositional ? '' : '${v.parameterName}:'}';

      if (ignoreFlags[v]!) {
        return '$param _value.${v.element.name},';
      }

      final nullCheck = v.nullable ? '' : '|| ${v.parameterName} == null';

      return '''$param
        \$undefined == ${v.parameterName} $nullCheck
        ? _value.${v.element.name}
        : ${_convertToImmutable(v)},''';
    });

    final constructorBody = isAbstract
        ? ''
        : '{ return _then(${_constructorFor(typeAnnotation, classInfo.annotation.copyConstructor)}($parameters)); }';

    return '\$R call({$constructorInput}) $constructorBody';
  }

  /// Generates one chaining getter per eligible nested-model field.
  String genNestedGetters(
    Map<ConstructorParameterInfo, bool> ignoreFlags,
    ClassHierarchyInfo hierarchy,
    List<ConstructorParameterInfo> sortedFields,
    bool isAbstract,
  ) {
    final buffer = StringBuffer();

    for (final field in sortedFields) {
      if (ignoreFlags[field]!) continue;

      final nested = _resolveNestedCopy(field, hierarchy);
      if (nested == null) continue;

      final prefix = nested.importPrefix == null
          ? ''
          : '${nested.importPrefix}.';
      final returnType = '$prefix\$I${nested.className}Copy${nested.rTypeArgs}';
      final nullSuffix = field.nullable ? '?' : '';

      if (isAbstract) {
        buffer.writeln('$returnType$nullSuffix get ${field.parameterName};');
        continue;
      }

      // No explicit type arguments: the enclosing getter's declared return
      // type ($returnType[?]) gives the compiler everything it needs to
      // infer them.
      final ctor = '$prefix\$${nested.className}Copy';
      final fieldName = field.element.name;
      final then = '(v) => _then(_value.copyWith(${field.parameterName}: v))';

      if (field.nullable) {
        buffer.writeln('''
          @override
          $returnType? get ${field.parameterName} => _value.$fieldName == null
              ? null
              : $ctor(_value.$fieldName!, $then);
        ''');
      } else {
        buffer.writeln('''
          @override
          $returnType get ${field.parameterName} => $ctor(_value.$fieldName, $then);
        ''');
      }
    }

    return buffer.toString();
  }

  _NestedCopyInfo? _resolveNestedCopy(
    ConstructorParameterInfo field,
    ClassHierarchyInfo hierarchy,
  ) {
    final element = field.element.type.element;
    if (element is! ClassElement) return null;

    const checker = TypeChecker.typeNamed(ImModel);
    final annotation = checker.firstAnnotationOf(element);
    if (annotation is! DartObject) return null;

    final nestedInfo = hierarchy.getClassInfo(
      element,
      ConstantReader(annotation),
    );
    if (copyFullyIgnored(nestedInfo)) return null;

    return _NestedCopyInfo(
      className: element.name!,
      rTypeArgs: _rTypeArgs(field),
      importPrefix: _importPrefixFor(field.element.library, element),
    );
  }

  /// [field]'s type, qualified for use from its own declaring library.
  String _qualifiedType(ConstructorParameterInfo field) =>
      _qualifiedTypeString(field.element.type, field.element.library);

  /// Turns a field's type into the nested proxy's type-argument list,
  /// dropping the field's own nullability and appending `$R`.
  /// e.g. `Pair<String, int>?` -> `<String, int, $R>`,
  ///  `Contact` -> `<$R>`, used as `$IContactCopy<$R>`.
  String _rTypeArgs(ConstructorParameterInfo field) {
    final qualified = _qualifiedType(field);
    final type = field.nullable
        ? qualified.substring(0, qualified.length - 1)
        : qualified;
    final ltIndex = type.indexOf('<');
    final existingArgs = ltIndex == -1 ? '' : type.substring(ltIndex);
    return _appendTypeArg(existingArgs, '\$R');
  }

  String _constructorFor(String typeAnnotation, String? namedConstructor) {
    return "$typeAnnotation${namedConstructor == null ? "" : ".$namedConstructor"}";
  }

  String _convertToMutable(ConstructorParameterInfo param) {
    final type = _qualifiedType(param);
    final index =
        (imListRegex.hasMatch(type) ||
            imMapRegex.hasMatch(type) ||
            imSetRegex.hasMatch(type))
        ? 2
        : 0;
    return type.substring(index);
  }

  String? _convertToImmutable(ConstructorParameterInfo param) {
    final type = _qualifiedType(param);
    final name = param.parameterName;

    final String imWrapper;
    if (imListRegex.hasMatch(type)) {
      imWrapper = 'ImList';
    } else if (imMapRegex.hasMatch(type)) {
      imWrapper = 'ImMap';
    } else if (imSetRegex.hasMatch(type)) {
      imWrapper = 'ImSet';
    } else {
      return '$name as $type';
    }

    // All Im* types share the same prefix length ("Im" = 2 chars).
    final mutType = type.substring(2, param.nullable ? type.length - 1 : null);
    return param.nullable
        ? '$name == null ? null : $imWrapper($name as $mutType)'
        : '$imWrapper($name as $mutType)';
  }

  bool _ignoreCopy(ClassInfo classInfo, ConstructorParameterInfo field) {
    final fieldIgnoreCopy = field.annotation?.ignoreCopy;
    if (fieldIgnoreCopy != null) {
      return fieldIgnoreCopy;
    }

    if (field.element.name case final name?) {
      return lookupClassInfoFromField(classInfo, name)?.annotation.ignoreCopy ??
          false;
    }

    return true;
  }
}

class CopyWithGenerator {
  const CopyWithGenerator();

  Future<GenResult> generate(
    ClassInfo classInfo,
    ClassHierarchyInfo hierarchy,
  ) async {
    final parameters = _getConstructorPrams(classInfo);

    // Copy is fully ignored
    if (copyFullyIgnored(classInfo)) {
      return const GenResult(mixinCode: '', extensionCode: '');
    }

    final typeParams = typeParameterStrings(classInfo.element);
    final className = classInfo.element.name!;
    final selfType = '$className${typeParams.names}';

    final generatedCode = _CopyInterfaceTemplate().gen(
      classInfo,
      hierarchy,
      className,
      typeParams.annotation,
      typeParams.names,
      parameters,
    );

    // The root entry point instantiates the generic proxy with $R bound
    // to the class's own type, and an identity `_then`.
    final rootTypeArgs = _appendTypeArg(typeParams.names, selfType);

    final mixinCode =
        '''
      \$I${className}Copy$rootTypeArgs get copyWith => \$${className}Copy(this as $selfType, (v) => v);
    ''';

    return GenResult(
      generatedCode: generatedCode,
      extensionCode: '',
      mixinCode: mixinCode,
    );
  }

  List<ConstructorParameterInfo> _getConstructorPrams(ClassInfo classInfo) {
    final constructor = classInfo.annotation.copyConstructor;

    final targetConstructor = constructor != null
        ? classInfo.element.getNamedConstructor(constructor)
        : classInfo.element.unnamedConstructor;

    if (targetConstructor is! ConstructorElement) {
      if (constructor != null) {
        throw InvalidGenerationSourceError(
          'Named Constructor "$constructor" constructor is missing.',
          element: classInfo.element,
        );
      } else {
        throw InvalidGenerationSourceError(
          'Default constructor for "${classInfo.element.name}" is missing.',
          element: classInfo.element,
        );
      }
    }

    final parameters = targetConstructor.formalParameters;
    if (parameters.isEmpty) {
      throw InvalidGenerationSourceError(
        'Constructor "${classInfo.element.name}" has no parameters.',
        element: classInfo.element,
      );
    }

    final fields = <ConstructorParameterInfo>[];

    for (final parameter in parameters) {
      // For private field formals (this._id), the analyzer returns the public
      // name without underscore as parameter.name (e.g. "id"). The actual
      // private field name (e.g. "_id") is obtained from the field element.
      final fieldName = parameter is FieldFormalParameterElement
          ? (parameter.field?.name ?? parameter.name!)
          : parameter.name!;

      final fieldInfo = lookupFieldInfo(classInfo, fieldName);

      if (fieldInfo == null) {
        throw InvalidGenerationSourceError(
          'Constructor parameter "${parameter.name}" is not a class member.',
          element: classInfo.element,
        );
      }

      fields.add(
        ConstructorParameterInfo(
          fieldInfo,
          isPositional: parameter.isPositional,
          isParameterNullable:
              parameter.type.nullabilitySuffix != NullabilitySuffix.none,
          parameterName: parameter.name!,
        ),
      );
    }

    for (final field in fields) {
      if (!field.isParameterNullable && field.nullable) {
        throw InvalidGenerationSourceError(
          'Constructor parameter and class field nullability mismatch. "${field.element.name}" is not nullable when the corresponding class field is nullable. Please fix this.',
          element: field.element,
        );
      }
    }

    return fields;
  }
}

/// Represents a field parameter from the constructor.
class ConstructorParameterInfo extends FieldInfo {
  ConstructorParameterInfo(
    FieldInfo fieldInfo, {
    required this.isPositional,
    required this.isParameterNullable,
    required this.parameterName,
  }) : super(
         annotation: fieldInfo.annotation,
         element: fieldInfo.element,
         nullable:
             fieldInfo.element.type.nullabilitySuffix != NullabilitySuffix.none,
         type: fieldInfo.element.type.getDisplayString(),
       );

  /// True if the field is positioned in the constructor
  final bool isPositional;

  /// True if the field is optional in the constructor
  final bool isParameterNullable;

  /// The name used in the constructor call (public name).
  /// For private fields like `_id`, this is `"id"` (without underscore),
  /// which is how Dart exposes private field formals as named parameters.
  final String parameterName;
}
