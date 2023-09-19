import 'dart:async';

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:immutable_model/immutable_model.dart';
import 'package:immutable_model_gen/src/check_immutability.dart';
import 'package:immutable_model_gen/src/class_hierarchy_info.dart';
import 'package:immutable_model_gen/src/copy_with_generator.dart';
import 'package:immutable_model_gen/src/equal_generator.dart';
import 'package:immutable_model_gen/src/utils.dart';
import 'package:source_gen/source_gen.dart';

class ImmutableModelGenerator extends GeneratorForAnnotation<ImModel> {
  final ClassHierarchyInfo classHierarchyInfo = ClassHierarchyInfo();

  @override
  FutureOr<String> generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) async {
    final classElement = CheckImmutability().check(element);

    final classInfo = classHierarchyInfo.getClassInfo(
      classElement,
      annotation,
    );

    final extName = '\$${classElement.name}ImExt';

    final result = await Future.wait([
      const EqualGenerator().generate(classInfo, extensionName: extName),
      const CopyWithGenerator().generate(classInfo),
    ], eagerError: true);

    final typeParametersAnnotation = typeParametersString(classElement, false);
    final typeParametersNames = typeParametersString(classElement, true);

    return '''
      extension $extName$typeParametersAnnotation on ${classElement.name}$typeParametersNames {
        ${result[0].extensionCode}

        ${result[1].extensionCode}
      }

      ${result[0].generatedCode}

      ${result[1].generatedCode}
    ''';
  }
}
