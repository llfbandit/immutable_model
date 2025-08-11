import 'package:analyzer/dart/element/element2.dart';
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
    final constructorInput = sortedFields.fold<String>(
      '',
      (r, v) {
        if (_ignoreCopy(classInfo, v)) {
          return r;
        }

        if (isAbstract) {
          final type = (v.type.endsWith('?') || v.isDynamic)
              ? _convertToMutable(v)
              : '${_convertToMutable(v)}?';
          return '$r $type ${v.element.name3},';
        } else {
          return '$r Object? ${v.element.name3} = const \$ImCopy(),';
        }
      },
    );

    final parameters = sortedFields.fold<String>(
      '',
      (r, v) {
        final param = '$r ${v.isPositional ? '' : '${v.element.name3}:'}';

        if (_ignoreCopy(classInfo, v)) {
          return '$param _value.${v.element.name3},';
        }

        final nullCheck = v.nullable ? '' : '|| ${v.element.name3} == null';

        return '''$param
        const \$ImCopy() == ${v.element.name3} $nullCheck
        ? _value.${v.element.name3}
        : ${_convertToImmutable(v)},''';
      },
    );

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

    if (imListRegex.hasMatch(type)) {
      final mutParam = _convertToMutable(param, keepOptional: false);

      if (param.nullable) {
        return '${param.element.name3} == null ? null : ImList(${param.element.name3} as $mutParam)';
      } else {
        return 'ImList(${param.element.name3} as $mutParam)';
      }
    }
    if (imMapRegex.hasMatch(type)) {
      final mutParam = _convertToMutable(param, keepOptional: false);

      if (param.nullable) {
        return '${param.element.name3} == null ? null : ImMap(${param.element.name3} as $mutParam)';
      } else {
        return 'ImMap(${param.element.name3} as $mutParam)';
      }
    }
    if (imSetRegex.hasMatch(type)) {
      final mutParam = _convertToMutable(param, keepOptional: false);

      if (param.nullable) {
        return '${param.element.name3} == null ? null : ImSet(${param.element.name3} as $mutParam)';
      } else {
        return 'ImSet(${param.element.name3} as $mutParam)';
      }
    }

    if (param.type == 'Object' || param.type == 'Object?') {
      return param.element.name3;
    } else {
      return '${param.element.name3} as ${param.type}';
    }
  }

  bool _ignoreCopy(ClassInfo classInfo, ConstructorParameterInfo field) {
    final fieldIgnoreCopy = field.annotation?.ignoreCopy;
    if (fieldIgnoreCopy != null) {
      return fieldIgnoreCopy;
    }

    if (field.element.name3 case final name?) {
      return lookupClassInfoFromField(
            classInfo,
            name,
          )?.annotation.ignoreCopy ??
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
            classInfo.fields
                .every((f) => (f.annotation?.ignoreCopy ?? true)))) {
      return const GenResult(mixinCode: '', extensionCode: '');
    }

    final typeParametersAnnotation = typeParametersString(
      classInfo.element,
      false,
    );
    final typeParametersNames = typeParametersString(
      classInfo.element,
      true,
    );

    final generatedCode = _CopyInterfaceTemplate().gen(
      classInfo,
      classInfo.element.name3!,
      typeParametersAnnotation,
      typeParametersNames,
      parameters,
    );

    final mixinCode = '''
      ${"_\$I${classInfo.element.name3}Copy$typeParametersNames get copyWith => _\$${classInfo.element.name3}Copy$typeParametersNames(this as ${classInfo.element.name3}$typeParametersNames);"}
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
        ? classInfo.element.getNamedConstructor2(constructor)
        : classInfo.element.unnamedConstructor2;

    if (targetConstructor is! ConstructorElement2) {
      if (constructor != null) {
        throw InvalidGenerationSourceError(
          'Named Constructor "$constructor" constructor is missing.',
          element: classInfo.element,
        );
      } else {
        throw InvalidGenerationSourceError(
          'Default constructor for "${classInfo.element.name3}" is missing.',
          element: classInfo.element,
        );
      }
    }

    final parameters = targetConstructor.formalParameters;
    if (parameters.isEmpty) {
      throw InvalidGenerationSourceError(
        'Constructor "${classInfo.element.name3}" has no parameters.',
        element: classInfo.element,
      );
    }

    final fields = <ConstructorParameterInfo>[];

    for (final parameter in parameters) {
      final fieldInfo = lookupFieldInfo(classInfo, parameter.name3!);

      if (fieldInfo == null) {
        throw InvalidGenerationSourceError(
          'Constructor parameter "${parameter.name3}" is not a class member.',
          element: classInfo.element,
        );
      }

      fields.add(ConstructorParameterInfo(
        fieldInfo,
        isPositional: parameter.isPositional,
        isParameterNullable:
            parameter.type.nullabilitySuffix != NullabilitySuffix.none,
      ));
    }

    for (final field in fields) {
      if (!field.isParameterNullable && field.nullable) {
        throw InvalidGenerationSourceError(
          'Constructor parameter and class field nullability mismatch. "${field.element.name3}" is not nullable when the corresponding class field is nullable. Please fix this.',
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
  }) : super(
          annotation: fieldInfo.annotation,
          element: fieldInfo.element,
          nullable: fieldInfo.element.type.nullabilitySuffix !=
              NullabilitySuffix.none,
          type: fieldInfo.element.type.getDisplayString(),
        );

  /// True if the field is positioned in the constructor
  final bool isPositional;

  /// True if the field is optional in the constructor
  final bool isParameterNullable;
}
