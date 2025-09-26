import 'package:analyzer/dart/element/element.dart';
import 'package:im_model_gen/src/class_hierarchy_info.dart';

final nestedCollRegex = RegExp(r'(\WList<)|(\WMap<)|(\WSet<)');

final listRegex = RegExp(r'^(List\<.+\>|List)');
final mapRegex = RegExp(r'^(Map\<.+,.+\>|Map)');
final setRegex = RegExp(r'^(Set\<.+\>|Set)');

final imListRegex = RegExp(r'^(ImList\<.+\>|ImList)');
final imMapRegex = RegExp(r'^(ImMap\<.+,.+\>|ImMap)');
final imSetRegex = RegExp(r'^(ImSet\<.+\>|ImSet)');

extension IterableExtension<T> on Iterable<T> {
  /// The first element satisfying [test], or `null` if there are none.
  T? firstWhereOrNull(bool Function(T element) test) {
    for (var element in this) {
      if (test(element)) return element;
    }
    return null;
  }
}

/// Returns parameter names or full parameters declaration declared by this class or an empty string.
///
/// If `nameOnly` is `true`: `class MyClass<T extends String, Y>` returns `<T, Y>`.
///
/// If `nameOnly` is `false`: `class MyClass<T extends String, Y>` returns `<T extends String, Y>`.
String typeParametersString(InterfaceElement classElement, bool nameOnly) {
  final names = classElement.typeParameters
      .map(
        (e) => nameOnly ? e.name : e.displayString(),
      )
      .join(',');

  return (names.isNotEmpty) ? '<$names>' : '';
}

FieldInfo? lookupFieldInfo(ClassInfo classInfo, String fieldName) {
  final fieldInfo = classInfo.fields.firstWhereOrNull((e) {
    return e.element.name == fieldName;
  });

  if (fieldInfo != null) {
    return fieldInfo;
  }

  final superClass = classInfo.superClass;
  return superClass != null ? lookupFieldInfo(superClass, fieldName) : null;
}

ClassInfo? lookupClassInfoFromField(ClassInfo classInfo, String fieldName) {
  final fieldInfo = classInfo.fields.firstWhereOrNull((e) {
    return e.element.name == fieldName;
  });

  if (fieldInfo != null) {
    return classInfo;
  }

  final superClass = classInfo.superClass;
  return superClass != null
      ? lookupClassInfoFromField(superClass, fieldName)
      : null;
}
