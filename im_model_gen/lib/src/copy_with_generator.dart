import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/nullability_suffix.dart';
import 'package:im_model_gen/src/class_hierarchy_info.dart';
import 'package:im_model_gen/src/gen_result.dart';
import 'package:im_model_gen/src/utils.dart';
import 'package:source_gen/source_gen.dart';

class _CopyInterfaceTemplate {
  /// Generates a `Proxy` interface.
  String gen(
    ClassInfo classInfo,
    String type,
    String typeParameters,
    String typeParameterNames,
    List<ConstructorParameterInfo> parameters,
  ) {
    final typeAnnotation = type + typeParameterNames;

    return '''
      abstract interface class _\$I${type}Copy$typeParameters {
        ${_CopyImplTemplate().gen(classInfo, typeAnnotation, parameters, true)};
      }

      class _\$${type}Copy$typeParameters implements _\$I${type}Copy$typeParameterNames {
        const _\$${type}Copy(this._value);

        final $type$typeParameterNames _value;

        @override
        ${_CopyImplTemplate().gen(classInfo, typeAnnotation, parameters, false)}
      }
    ''';
  }
}

class _CopyImplTemplate {
  /// Generates the callable class function for copyWith(...).
  String gen(
    ClassInfo classInfo,
    String typeAnnotation,
    List<ConstructorParameterInfo> sortedFields,
    bool isAbstract,
  ) {
    final constructorInput = sortedFields.fold<String>('', (r, v) {
      if (_ignoreCopy(classInfo, v)) {
        return r;
      }

      if (isAbstract) {
        final type = (v.type.endsWith('?') || v.isDynamic)
            ? _convertToMutable(v)
            : '${_convertToMutable(v)}?';
        return '$r $type ${v.parameterName},';
      } else {
        return '$r Object? ${v.parameterName} = const \$ImCopy(),';
      }
    });

    final parameters = sortedFields.fold<String>('', (r, v) {
      final param = '$r ${v.isPositional ? '' : '${v.parameterName}:'}';

      if (_ignoreCopy(classInfo, v)) {
        return '$param _value.${v.element.name},';
      }

      final nullCheck = v.nullable ? '' : '|| ${v.parameterName} == null';

      return '''$param
        const \$ImCopy() == ${v.parameterName} $nullCheck
        ? _value.${v.element.name}
        : ${_convertToImmutable(v)},''';
    });

    final constructorBody = isAbstract
        ? ''
        : '{ return ${_constructorFor(typeAnnotation, classInfo.annotation.copyConstructor)}($parameters); }';

    return '$typeAnnotation call({$constructorInput}) $constructorBody';
  }

  String _constructorFor(String typeAnnotation, String? namedConstructor) {
    return "$typeAnnotation${namedConstructor == null ? "" : ".$namedConstructor"}";
  }

  String _convertToMutable(
    ConstructorParameterInfo param, {
    bool keepOptional = true,
  }) {
    final type = param.type;
    var index = 0;

    if (imListRegex.hasMatch(type) ||
        imMapRegex.hasMatch(type) ||
        imSetRegex.hasMatch(type)) {
      index = 2; // Remove Im
    }

    return type.substring(
      index,
      (!keepOptional && param.nullable) ? type.length - 1 : null,
    );
  }

  String? _convertToImmutable(ConstructorParameterInfo param) {
    final type = param.type;
    final name = param.parameterName;

    if (imListRegex.hasMatch(type)) {
      final mutParam = _convertToMutable(param, keepOptional: false);

      if (param.nullable) {
        return '$name == null ? null : ImList($name as $mutParam)';
      } else {
        return 'ImList($name as $mutParam)';
      }
    }
    if (imMapRegex.hasMatch(type)) {
      final mutParam = _convertToMutable(param, keepOptional: false);

      if (param.nullable) {
        return '$name == null ? null : ImMap($name as $mutParam)';
      } else {
        return 'ImMap($name as $mutParam)';
      }
    }
    if (imSetRegex.hasMatch(type)) {
      final mutParam = _convertToMutable(param, keepOptional: false);

      if (param.nullable) {
        return '$name == null ? null : ImSet($name as $mutParam)';
      } else {
        return 'ImSet($name as $mutParam)';
      }
    }

    if (param.type == 'Object' || param.type == 'Object?') {
      return name;
    } else {
      return '$name as ${param.type}';
    }
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

  Future<GenResult> generate(ClassInfo classInfo) async {
    final parameters = _getConstructorPrams(classInfo);

    // Copy is fully ignored
    if (classInfo.isAbstract ||
        (classInfo.annotation.ignoreCopy &&
            classInfo.fields.every(
              (f) => (f.annotation?.ignoreCopy ?? true),
            ))) {
      return const GenResult(mixinCode: '', extensionCode: '');
    }

    final typeParametersAnnotation = typeParametersString(
      classInfo.element,
      false,
    );
    final typeParametersNames = typeParametersString(classInfo.element, true);

    final generatedCode = _CopyInterfaceTemplate().gen(
      classInfo,
      classInfo.element.name!,
      typeParametersAnnotation,
      typeParametersNames,
      parameters,
    );

    final mixinCode =
        '''
      ${"_\$I${classInfo.element.name}Copy$typeParametersNames get copyWith => _\$${classInfo.element.name}Copy$typeParametersNames(this as ${classInfo.element.name}$typeParametersNames);"}
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
