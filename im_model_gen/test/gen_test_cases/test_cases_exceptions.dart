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
