import 'dart:async';

import 'package:analyzer/dart/element/element2.dart';
import 'package:build/build.dart';
import 'package:im_model/im_model.dart';
import 'package:im_model_gen/src/check_immutability.dart';
import 'package:im_model_gen/src/class_hierarchy_info.dart';
import 'package:im_model_gen/src/copy_with_generator.dart';
import 'package:im_model_gen/src/equal_generator.dart';
import 'package:im_model_gen/src/utils.dart';
import 'package:source_gen/source_gen.dart';

class ImmutableModelGenerator extends GeneratorForAnnotation<ImModel> {
  final ClassHierarchyInfo classHierarchyInfo = ClassHierarchyInfo();

  @override
  dynamic generateForAnnotatedElement(
    Element2 element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) async {
    final classElement = CheckImmutability().check(element);

    final classInfo = classHierarchyInfo.getClassInfo(
      classElement,
      annotation,
    );

    final extName = '_\$${classElement.name3}ImExt';
    final mixinName = '_\$${classElement.name3}Mixin';

    final result = await Future.wait([
      const CopyWithGenerator().generate(classInfo),
      const EqualGenerator().generate(classInfo, extensionName: extName),
    ], eagerError: true);

    final typeParametersAnnotation = typeParametersString(classElement, false);
    final typeParametersNames = typeParametersString(classElement, true);

    return '''
      extension $extName$typeParametersAnnotation on ${classElement.name3}$typeParametersNames {
        ${result[1].extensionCode}
      }

      mixin $mixinName$typeParametersAnnotation {
        ${result[0].mixinCode}

        ${result[1].mixinCode}
      }      

      ${result[0].generatedCode}
    ''';
  }
}
