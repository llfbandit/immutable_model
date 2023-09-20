import 'package:analyzer/dart/element/element.dart';
import 'package:im_model_gen/src/utils.dart';
import 'package:source_gen/source_gen.dart';

class CheckImmutability {
  CheckImmutability();

  ClassElement check(Element element) {
    // Check if the annotation is set up on class element
    if (element is! ClassElement) {
      throw InvalidGenerationSourceError(
        'Only classes can be annotated with "ImmutableModel". "$element" is not a class.',
        element: element,
      );
    }

    // Check class members
    for (var field in element.fields) {
      if (!field.isFinal && !field.isConst) {
        throw InvalidGenerationSourceError(
          '"$field" is not final or const to ensure immutability.',
          element: field,
        );
      }

      final type = field.type.toString();
      if (listRegex.hasMatch(type)) {
        throw InvalidGenerationSourceError(
          '"$field" is a mutable list, so you must use "ImList" instead to ensure immutability.',
          element: field,
        );
      }

      if (mapRegex.hasMatch(type)) {
        throw InvalidGenerationSourceError(
          '"$field" is a mutable map, so you must use "ImMap" instead to ensure immutability.',
          element: field,
        );
      }
      if (setRegex.hasMatch(type)) {
        throw InvalidGenerationSourceError(
          '"$field" is a mutable set, so you must use "ImSet" instead to ensure immutability.',
          element: field,
        );
      }
    }

    for (var constructor in element.constructors) {
      for (var parameter in constructor.parameters) {
        final type = parameter.type.toString();

        if (nestedCollRegex.hasMatch(type)) {
          throw InvalidGenerationSourceError(
            '"${parameter.getDisplayString(withNullability: true)}" is a mutable nested collection, you must use "ImList/ImMap/ImSet" instead to ensure immutability.',
            element: parameter,
          );
        }
      }
    }

    return element;
  }
}
