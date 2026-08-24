import 'package:analyzer/dart/element/element.dart';
import 'package:im_model_gen/src/utils.dart';
import 'package:source_gen/source_gen.dart';

class CheckImmutability {
  CheckImmutability();

  /// Validates [element]'s fields and constructors against the immutability
  /// constraints (final/const fields, ImList/ImMap/ImSet instead of mutable
  /// collections, no mutable nested collections).
  void check(ClassElement element) {
    // Check class members
    for (var field in element.fields) {
      // isSynthetic is to detect getter
      if (!field.isOriginGetterSetter && !field.isFinal && !field.isConst) {
        throw InvalidGenerationSourceError(
          '"$field" is not final or const to ensure immutability.',
          element: field,
        );
      }

      final type = field.type.toString();
      if (listRegex.hasMatch(type) && !field.isStatic && !field.isConst) {
        throw InvalidGenerationSourceError(
          '"$field" is a mutable list, you must use "ImList" instead to ensure immutability.',
          element: field,
        );
      }

      if (mapRegex.hasMatch(type) && !field.isStatic && !field.isConst) {
        throw InvalidGenerationSourceError(
          '"$field" is a mutable map, you must use "ImMap" instead to ensure immutability.',
          element: field,
        );
      }
      if (setRegex.hasMatch(type) && !field.isStatic && !field.isConst) {
        throw InvalidGenerationSourceError(
          '"$field" is a mutable set, you must use "ImSet" instead to ensure immutability.',
          element: field,
        );
      }
    }

    for (var constructor in element.constructors) {
      // Don't check for immutable collections in factory contructors.
      if (constructor.isFactory) continue;

      for (var parameter in constructor.formalParameters) {
        final type = parameter.type.toString();

        if (nestedCollRegex.hasMatch(type)) {
          throw InvalidGenerationSourceError(
            '"${parameter.displayString()}" is a mutable nested collection, you must use "ImList/ImMap/ImSet" instead to ensure immutability.',
            element: parameter,
          );
        }
      }
    }
  }
}
