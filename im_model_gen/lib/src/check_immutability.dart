import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:im_model/im_model.dart';
import 'package:im_model_gen/src/utils.dart';
import 'package:meta/meta.dart' show Immutable;
import 'package:source_gen/source_gen.dart';

class CheckImmutability {
  CheckImmutability();

  static const _imListChecker = TypeChecker.typeNamed(ImList);
  static const _imMapChecker = TypeChecker.typeNamed(ImMap);
  static const _imSetChecker = TypeChecker.typeNamed(ImSet);
  static const _imModelChecker = TypeChecker.typeNamed(ImModel);
  static const _immutableChecker = TypeChecker.typeNamed(Immutable);

  /// Validates [element]'s fields and constructors against the immutability
  /// constraints. [onNestedImModel] is called for every `@ImModel`-typed
  /// collection element, so it can be validated too even if only reached
  /// this way.
  void check(
    ClassElement element,
    void Function(ClassElement element, DartObject annotation) onNestedImModel,
  ) {
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

    // Runs last so the checks above throw first where they overlap.
    for (var field in element.fields) {
      if (field.isStatic || field.isConst || field.isOriginGetterSetter) {
        continue;
      }
      _checkFieldTypeImmutability(field, onNestedImModel);
    }
  }

  /// Verifies [field]'s type is immutable — recursing into
  /// ImList/ImMap/ImSet element types when [field] is a collection, or the
  /// field's own type otherwise.
  void _checkFieldTypeImmutability(
    FieldElement field,
    void Function(ClassElement, DartObject) onNestedImModel,
  ) {
    final elementTypes = _collectionElementTypesOf(field.type);
    if (elementTypes != null) {
      for (final elementType in elementTypes) {
        if (!_isImmutable(elementType, onNestedImModel, <int>{})) {
          throw InvalidGenerationSourceError(
            '"$field" has element type "${elementType.getDisplayString()}", '
            'which is not immutable. Elements of ImList/ImMap/ImSet '
            'must be a core primitive, an enum, a Record of immutable '
            'fields, a class whose fields are all final/const '
            '(recursively), an @ImModel or @immutable class, or another '
            'ImList/ImMap/ImSet.',
            element: field,
          );
        }
      }
      return;
    }

    if (!_isImmutable(field.type, onNestedImModel, <int>{})) {
      throw InvalidGenerationSourceError(
        '"$field" has type "${field.type.getDisplayString()}", which is not '
        'immutable. Fields must be a core primitive, an enum, a '
        'Record of immutable fields, a class whose fields are all '
        'final/const (recursively), an @ImModel or @immutable class, or an '
        'ImList/ImMap/ImSet of such elements.',
        element: field,
      );
    }
  }

  /// The element type(s) of [type] if it's `ImList<E>`/`ImSet<E>` (`[E]`) or
  /// `ImMap<K, V>` (`[K, V]`), else `null`.
  List<DartType>? _collectionElementTypesOf(DartType type) {
    if (type is! InterfaceType) return null;
    if (_imListChecker.isExactlyType(type) ||
        _imSetChecker.isExactlyType(type) ||
        _imMapChecker.isExactlyType(type)) {
      return type.typeArguments;
    }
    return null;
  }

  bool _isImmutable(
    DartType type,
    void Function(ClassElement, DartObject) onNestedImModel,
    Set<int> visiting,
  ) {
    // Not knowable at generation time; deferred to the call site.
    if (type is TypeParameterType) return true;

    // Can't prove anything about an unconstrained type: every value in Dart
    // is an Object, so this carries no structural signal to check.
    if (type is DynamicType || type is VoidType || type.isDartCoreObject) {
      return false;
    }

    if (type.isDartCoreBool ||
        type.isDartCoreDouble ||
        type.isDartCoreInt ||
        type.isDartCoreNum ||
        type.isDartCoreNull ||
        type.isDartCoreString ||
        type.isDartCoreSymbol ||
        type.isDartCoreType) {
      return true;
    }

    if (type is RecordType) {
      return type.positionalFields.every(
            (f) => _isImmutable(f.type, onNestedImModel, visiting),
          ) &&
          type.namedFields.every(
            (f) => _isImmutable(f.type, onNestedImModel, visiting),
          );
    }

    final nestedElementTypes = _collectionElementTypesOf(type);
    if (nestedElementTypes != null) {
      return nestedElementTypes.every(
        (t) => _isImmutable(t, onNestedImModel, visiting),
      );
    }

    // A raw List/Map/Set has no concrete fields of its own (it's an
    // interface, all abstract members), so the structural fallback below
    // would vacuously treat it as immutable. Reject it outright instead,
    // same as the top-level "use ImList/ImMap/ImSet" rule.
    final displayString = type.getDisplayString();
    if (listRegex.hasMatch(displayString) ||
        mapRegex.hasMatch(displayString) ||
        setRegex.hasMatch(displayString)) {
      return false;
    }

    final element = type.element;
    if (element == null) return false;

    if (element is EnumElement) return true;

    if (element is! InterfaceElement) return false;

    if (_immutableChecker.hasAnnotationOf(element)) return true;

    final annotation = _imModelChecker.firstAnnotationOf(element);
    if (annotation is DartObject && element is ClassElement) {
      onNestedImModel(element, annotation);
      return true;
    }

    // Fallback: no marker/annotation vouches for this type.
    // Prove it structurally: every instance field (own + inherited)
    // must be final/const and itself recursively immutable.
    if (!visiting.add(element.id)) return true; // cycle guard
    try {
      return _instanceFields(element)
          .where((field) => !field.isOriginGetterSetter)
          .every(
            (field) =>
                (field.isFinal || field.isConst) &&
                _isImmutable(field.type, onNestedImModel, visiting),
          );
    } finally {
      visiting.remove(element.id);
    }
  }

  /// Instance fields of [element], including those inherited from
  /// superclasses (excluding `Object`).
  Iterable<FieldElement> _instanceFields(InterfaceElement element) sync* {
    InterfaceElement? current = element;
    while (current != null) {
      yield* current.fields.where((f) => !f.isStatic);
      final supertype = current.supertype;
      current = (supertype != null && !supertype.isDartCoreObject)
          ? supertype.element
          : null;
    }
  }
}
