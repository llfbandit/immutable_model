import 'dart:async';

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:im_model/im_model.dart';
import 'package:im_model_gen/src/class_hierarchy_info.dart';
import 'package:im_model_gen/src/copy_with_generator.dart';
import 'package:im_model_gen/src/equal_generator.dart';
import 'package:im_model_gen/src/utils.dart';
import 'package:source_gen/source_gen.dart';

class ImmutableModelGenerator extends GeneratorForAnnotation<ImModel> {
  final ClassHierarchyInfo classHierarchyInfo = ClassHierarchyInfo();

  @override
  dynamic generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) async {
    if (element is! ClassElement) {
      throw InvalidGenerationSourceError(
        'Only classes can be annotated with "ImModel". "$element" is not a class.',
        element: element,
      );
    }
    final classElement = element;

    // Immutability is validated inside getClassInfo, once per class.
    final classInfo = classHierarchyInfo.getClassInfo(classElement, annotation);

    final extName = '_\$${classElement.name}ImExt';
    final mixinName = '_\$${classElement.name}Mixin';

    final result = await Future.wait([
      const CopyWithGenerator().generate(classInfo, classHierarchyInfo),
      const EqualGenerator().generate(classInfo, extensionName: extName),
    ], eagerError: true);

    final typeParams = typeParameterStrings(classElement);

    return '''
      extension $extName${typeParams.annotation} on ${classElement.name}${typeParams.names} {
        ${result[1].extensionCode}
      }

      mixin $mixinName${typeParams.annotation} {
        ${result[0].mixinCode}

        ${result[1].mixinCode}
      }

      ${result[0].generatedCode}
    ''';
  }
}
