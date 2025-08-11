import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/element2.dart';
import 'package:analyzer/dart/element/nullability_suffix.dart';
import 'package:im_model/im_model.dart';
import 'package:im_model_gen/src/immutable_annotation.dart';
import 'package:im_model_gen/src/utils.dart';
import 'package:source_gen/source_gen.dart';

class ClassInfo {
  ClassInfo({
    required this.superClass,
    required this.element,
    required this.annotation,
    required this.fields,
    required this.isAbstract,
  });

  /// Super class info hierarchy
  ClassInfo? superClass;

  /// Class element itself.
  final InterfaceElement2 element;

  /// The annotation attached to the class.
  final ImModelAnnotation annotation;

  /// The fields of the class.
  final List<FieldInfo> fields;

  /// [true] if class is abstract
  final bool isAbstract;
}

class FieldInfo {
  const FieldInfo({
    required this.element,
    required this.nullable,
    required this.type,
    required this.annotation,
  });

  // Field element itself.
  final FieldElement2 element;

  /// If the type is nullable.
  final bool nullable;

  /// Type name with nullability flag.
  final String type;

  /// The annotation attached to the field.
  final ImFieldAnnotation? annotation;

  /// True if the type is `dynamic`.
  bool get isDynamic => type == 'dynamic';
}

class ClassHierarchyInfo {
  final List<ClassInfo> classesInfo = [];

  ClassInfo getClassInfo(
    ClassElement2 element,
    ConstantReader reader,
  ) {
    final existingClassInfo = _lookup(element);
    if (existingClassInfo != null) return existingClassInfo;

    final classInfo = _createClassInfo(element, reader, element.isAbstract);
    classesInfo.add(classInfo);
    _addSuperClasses(classInfo);

    return classInfo;
  }

  ClassInfo? _lookup(InterfaceElement2 element) {
    return classesInfo.firstWhereOrNull(
      (classInfo) {
        if (classInfo.element.name3 == element.name3) return true;

        var superClass = classInfo.superClass;
        while (superClass != null) {
          if (superClass.element.name3 == element.name3) {
            return true;
          }
          superClass = superClass.superClass;
        }

        return false;
      },
    );
  }

  ClassInfo _createClassInfo(
    InterfaceElement2 element,
    ConstantReader reader,
    bool isAbstract,
  ) {
    final annotation = _readClassAnnotation(reader);

    final fields = element.fields2
        .where((field) => _includeField(annotation, field))
        .map((field) {
      return FieldInfo(
        element: field,
        nullable: field.type.nullabilitySuffix != NullabilitySuffix.none,
        type: field.type.getDisplayString(),
        annotation: _readFieldAnnotation(field),
      );
    }).toList(growable: false);

    return ClassInfo(
      superClass: null,
      element: element,
      annotation: annotation,
      fields: fields,
      isAbstract: isAbstract,
    );
  }

  void _addSuperClasses(ClassInfo classInfo) {
    final superClass = _getSuperClass(classInfo.element);
    if (superClass == null) return;

    final ssClass = superClass.superClass;

    final superClassInfo = _lookup(ssClass) ??
        _createClassInfo(
          ssClass,
          ConstantReader(superClass.annotation),
          ssClass is ClassElement2 ? ssClass.isAbstract : true,
        );

    classInfo.superClass = superClassInfo;

    _addSuperClasses(superClassInfo);
  }

  ({InterfaceElement2 superClass, DartObject annotation})? _getSuperClass(
      InterfaceElement2 element) {
    final checkedSupertype = element.supertype;
    if (checkedSupertype == null) return null;

    const checker = TypeChecker.fromRuntime(ImModel);
    final annotation = checker.firstAnnotationOf(checkedSupertype.element3);

    return (annotation is DartObject)
        ? (superClass: checkedSupertype.element3, annotation: annotation)
        : null;
  }

  ImModelAnnotation _readClassAnnotation(ConstantReader reader) {
    final copyConstructor = reader.peek('copyConstructor')?.stringValue;
    final ignoreCopy = reader.peek('ignoreCopy')?.boolValue;
    final ignoreEqual = reader.peek('ignoreEqual')?.boolValue;

    return ImModelAnnotation(
      ignoreCopy: ignoreCopy ?? false,
      ignoreEqual: ignoreEqual ?? false,
      copyConstructor: copyConstructor,
    );
  }

  ImFieldAnnotation? _readFieldAnnotation(FieldElement2 element) {
    const checker = TypeChecker.fromRuntime(ImField);
    final annotation = checker.firstAnnotationOf(element);
    if (annotation is! DartObject) {
      return null;
    }

    final reader = ConstantReader(annotation);
    return ImFieldAnnotation(
      ignoreCopy: reader.peek('ignoreCopy')?.boolValue,
      ignoreEqual: reader.peek('ignoreEqual')?.boolValue,
    );
  }

  bool _includeField(
    ImModelAnnotation classAnnotation,
    FieldElement2 fieldElement,
  ) {
    if (fieldElement.isStatic) return false;
    if (fieldElement.getter2 == null) return false;
    if (fieldElement.name3 == 'props') return false;

    return true;
  }
}
