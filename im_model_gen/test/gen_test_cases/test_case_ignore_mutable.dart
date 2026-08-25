part of 'index.dart';

// Class-level bypass: both `mutableCounter` (non-final) and `rawList` (raw
// mutable collection) would normally throw. Neither is part of the
// constructor, mirroring Static's "extra field" pattern, so they're simply
// excluded from copyWith/equality once validation no longer blocks them.
@ShouldGenerate(r'''
extension _$IgnoreMutableClassImExt on IgnoreMutableClass {
  dynamic _eq() => (id, mutableCounter, rawList);
}
''', contains: true)
@ImModel(ignoreMutable: true)
class IgnoreMutableClass {
  IgnoreMutableClass({required this.id});

  final String id;
  int mutableCounter = 0;
  final List<int> rawList = const [];
}

// Field-level bypass: `tags` is a raw mutable list (normally an error) but
// is still wired through the constructor, so it participates in copyWith
// and equality just like a valid field would.
@ShouldGenerate(r'''
extension _$IgnoreMutableFieldImExt on IgnoreMutableField {
  dynamic _eq() => (id, tags);
}
''', contains: true)
@ImModel()
class IgnoreMutableField {
  const IgnoreMutableField(this.id, this.tags);

  final String id;
  @ImField(ignoreMutable: true)
  final List<String> tags;
}

// The bypass on `tags` must not leak to sibling fields: `untouched` has the
// same kind of violation but no override, so it must still throw.
@ShouldThrow(
  '"List<int> untouched" is a mutable list, you must use "ImList" instead to ensure immutability.',
)
@ImModel()
class IgnoreMutablePartial {
  const IgnoreMutablePartial(this.id, this.tags, this.untouched);

  final String id;
  @ImField(ignoreMutable: true)
  final List<String> tags;
  final List<int> untouched;
}

// Field-level bypass also covers the constructor-parameter nested-mutable
// -collection check (normally "ImSet<List<List<int>>>" would throw).
@ShouldGenerate(r'''
extension _$IgnoreMutableNestedImExt on IgnoreMutableNested {
  dynamic _eq() => (id, coll);
}
''', contains: true)
@ImModel()
class IgnoreMutableNested {
  const IgnoreMutableNested(this.id, this.coll);

  final String id;
  @ImField(ignoreMutable: true)
  final ImSet<List<List<int>>> coll;
}

// Field-level bypass also covers the recursive element-type check
// (`PlainMutable`, declared in test_cases_exceptions.dart, is not provably
// immutable and would normally throw as an ImList element type).
@ShouldGenerate(r'''
extension _$IgnoreMutableElementImExt on IgnoreMutableElement {
  dynamic _eq() => (id, coll);
}
''', contains: true)
@ImModel()
class IgnoreMutableElement {
  const IgnoreMutableElement(this.id, this.coll);

  final String id;
  @ImField(ignoreMutable: true)
  final ImList<PlainMutable> coll;
}

// Field-level bypass also resolves through a primary constructor parameter
// (the annotation lives on the parameter, not a class-body field).
@ShouldGenerate(r'''
extension _$IgnoreMutablePrimaryImExt on IgnoreMutablePrimary {
  dynamic _eq() => (id, tags);
}
''', contains: true)
@ImModel()
class IgnoreMutablePrimary(
  final String id,
  @ImField(ignoreMutable: true) final List<int> tags,
) {}
