part of 'index.dart';

@ShouldThrow(
  'Only classes can be annotated with "ImModel". "Object wrongAnnotation" is not a class.',
)
// ignore: invalid_annotation_target
@ImModel()
Object wrongAnnotation = Object();

@ShouldThrow('Constructor "Empty" has no parameters.')
@ImModel()
class Empty {
  const Empty();
}

@ShouldThrow('"int? test" is not final or const to ensure immutability.')
@ImModel()
class NotFinal {
  int? test;
}

@ShouldThrow('Named Constructor "test" constructor is missing.')
@ImModel(copyConstructor: 'test')
class WrongConstructor {}

@ShouldThrow('Default constructor for "NoDefaultConstructor" is missing.')
@ImModel()
class NoDefaultConstructor {
  NoDefaultConstructor.nonDefault();
}

@ShouldThrow(
  'Constructor parameter and class field nullability mismatch. "nullable" is not nullable when the corresponding class field is nullable. Please fix this.',
)
@ImModel()
class TestNullabilityMismatch {
  TestNullabilityMismatch(int this.nullable);

  final int? nullable;
}

@ShouldThrow(
  '"List<int> coll" is a mutable list, you must use "ImList" instead to ensure immutability.',
)
@ImModel()
class TestList {
  TestList(this.coll);

  final List<int> coll;
}

@ShouldThrow(
  '"Map<int, int> coll" is a mutable map, you must use "ImMap" instead to ensure immutability.',
)
@ImModel()
class TestMap {
  TestMap(this.coll);

  final Map<int, int> coll;
}

@ShouldThrow(
  '"Set<int> coll" is a mutable set, you must use "ImSet" instead to ensure immutability.',
)
@ImModel()
class TestSet {
  TestSet(this.coll);

  final Set<int> coll;
}

@ShouldThrow(
  '"ImSet<List<List<int>>> coll" is a mutable nested collection, you must use "ImList/ImMap/ImSet" instead to ensure immutability.',
)
@ImModel()
class TestNestedCollection {
  TestNestedCollection(this.coll);

  final ImSet<List<List<int>>> coll;
}

@ShouldThrow(
  '"ImMap<String, List<List<int>>> coll" is a mutable nested collection, you must use "ImList/ImMap/ImSet" instead to ensure immutability.',
)
@ImModel()
class TestNestedMap {
  TestNestedMap(this.coll);

  final ImMap<String, List<List<int>>> coll;
}

@ShouldThrow('Constructor parameter "nonField" is not a class member.')
@ImModel()
class NonMemberParam {
  NonMemberParam({required int nonField}) : field = nonField;

  final int field;
}

class PlainMutable {
  int value = 0;
}

@ShouldThrow(
  '"ImList<PlainMutable> coll" has element type "PlainMutable", which is not immutable. Elements of ImList/ImMap/ImSet must be a core primitive, an enum, a Record of immutable fields, a class whose fields are all final/const (recursively), an @ImModel or @immutable class, or another ImList/ImMap/ImSet.',
)
@ImModel()
class TestUnprovenCollectionElement {
  TestUnprovenCollectionElement(this.coll);

  final ImList<PlainMutable> coll;
}

// Mutability hidden two structural levels deep — the outer class's own
// fields are all final, but one nests a class that isn't.
class PlainOuterWithMutableInner {
  const PlainOuterWithMutableInner(this.inner);

  final PlainMutable inner;
}

@ShouldThrow(
  '"ImList<PlainOuterWithMutableInner> coll" has element type "PlainOuterWithMutableInner", which is not immutable. Elements of ImList/ImMap/ImSet must be a core primitive, an enum, a Record of immutable fields, a class whose fields are all final/const (recursively), an @ImModel or @immutable class, or another ImList/ImMap/ImSet.',
)
@ImModel()
class TestUnprovenNestedCollectionElement {
  TestUnprovenNestedCollectionElement(this.coll);

  final ImList<PlainOuterWithMutableInner> coll;
}

// Mutability reached only via an inherited field, not one declared directly
// on the class itself.
class PlainMutableBase {
  int id = 0;
}

class PlainDerivedFromMutableBase extends PlainMutableBase {
  PlainDerivedFromMutableBase(this.extra);

  final String extra;
}

@ShouldThrow(
  '"ImList<PlainDerivedFromMutableBase> coll" has element type "PlainDerivedFromMutableBase", which is not immutable. Elements of ImList/ImMap/ImSet must be a core primitive, an enum, a Record of immutable fields, a class whose fields are all final/const (recursively), an @ImModel or @immutable class, or another ImList/ImMap/ImSet.',
)
@ImModel()
class TestUnprovenInheritedCollectionElement {
  TestUnprovenInheritedCollectionElement(this.coll);

  final ImList<PlainDerivedFromMutableBase> coll;
}

@ShouldThrow(
  '"dynamic dyn" has type "dynamic", which is not immutable. Fields '
  'must be a core primitive, an enum, a Record of immutable fields, a class '
  'whose fields are all final/const (recursively), an @ImModel or '
  '@immutable class, or an ImList/ImMap/ImSet of such elements.',
)
@ImModel()
class TestDynamicField {
  TestDynamicField(this.dyn);

  final dynamic dyn;
}

@ShouldThrow(
  '"Object obj" has type "Object", which is not immutable. Fields '
  'must be a core primitive, an enum, a Record of immutable fields, a class '
  'whose fields are all final/const (recursively), an @ImModel or '
  '@immutable class, or an ImList/ImMap/ImSet of such elements.',
)
@ImModel()
class TestObjectField {
  TestObjectField(this.obj);

  final Object obj;
}

@ShouldThrow(
  '"Object? objOptional" has type "Object?", which is not '
  'immutable. Fields must be a core primitive, an enum, a Record of '
  'immutable fields, a class whose fields are all final/const '
  '(recursively), an @ImModel or @immutable class, or an ImList/ImMap/ImSet '
  'of such elements.',
)
@ImModel()
class TestObjectOptionalField {
  TestObjectOptionalField(this.objOptional);

  final Object? objOptional;
}

// A plain class (reached only via structural nesting, never CheckImmutability
// .check()'s own regex-based "use ImList" rule) hiding a raw mutable List.
class PlainWithRawList {
  const PlainWithRawList(this.items);

  final List<int> items;
}

@ShouldThrow(
  '"ImList<PlainWithRawList> coll" has element type "PlainWithRawList", '
  'which is not immutable. Elements of ImList/ImMap/ImSet must be a core '
  'primitive, an enum, a Record of immutable fields, a class whose fields '
  'are all final/const (recursively), an @ImModel or @immutable class, or '
  'another ImList/ImMap/ImSet.',
)
@ImModel()
class TestNestedRawCollectionField {
  TestNestedRawCollectionField(this.coll);

  final ImList<PlainWithRawList> coll;
}
