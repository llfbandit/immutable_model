import 'package:analyzer/dart/element/element2.dart';
import 'package:im_model_gen/src/class_hierarchy_info.dart';
import 'package:im_model_gen/src/gen_result.dart';
import 'package:im_model_gen/src/immutable_annotation.dart';
import 'package:im_model_gen/src/utils.dart';

class _EqualMixinTemplate {
  const _EqualMixinTemplate();

  GenResult generate(
    InterfaceElement2 classElement, {
    required List<String> props,
  }) {
    final className = classElement.name3;

    final mixinCode = '''
        @override
        int get hashCode => (this as $className)._eq().hashCode;

        @override
        bool operator ==(covariant $className${typeParametersString(classElement, true)} other) {
          if (identical(this, other)) return true;
          return other._eq() == (this as $className)._eq();
        }

        @override
        String toString() => (this as $className)._eq().toString();
      ''';

    final extensionCode = 'dynamic _eq() => (${props.join(', ')});';

    return GenResult(
      mixinCode: mixinCode,
      extensionCode: extensionCode,
    );
  }
}

class EqualGenerator {
  const EqualGenerator();

  Future<GenResult> generate(
    ClassInfo classInfo, {
    required String extensionName,
  }) async {
    return const _EqualMixinTemplate().generate(
      classInfo.element,
      props: _generateEquality(classInfo),
    );
  }

  List<String> _generateEquality(ClassInfo classInfo) {
    final list = <String>[];

    final superClass = classInfo.superClass;

    if (superClass case var superClass?) {
      list.addAll(_generateEquality(superClass));
    }

    list.addAll(classInfo.fields
        .where((field) => _includeField(classInfo.annotation, field))
        .map((field) => field.element.name3!)
        .toList(growable: false));

    return list;
  }

  bool _includeField(
    ImModelAnnotation classAnnotation,
    FieldInfo field,
  ) {
    if (field.element.isStatic) return false;
    if (field.element.isSynthetic) return false; // Getters
    if (field.element.getter2 == null) return false;
    if (field.element.name3 == 'props') return false;
    if (field.element.name3 == null) return false;

    if (field.annotation != null) {
      return !(field.annotation!.ignoreEqual ?? classAnnotation.ignoreEqual);
    } else {
      return !classAnnotation.ignoreEqual;
    }
  }
}
