part of 'index.dart';

// Class-level bypass: `mutableCounter` and `rawList` would normally throw.
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

// Field-level bypass: `tags` is a raw mutable list, normally an error.
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

// The bypass must not leak to sibling fields: `untouched` still throws.
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

// Also covers the constructor-parameter nested-collection check.
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

// Also covers the recursive element-type check (`PlainMutable` from
// test_cases_exceptions.dart isn't provably immutable).
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

// Also resolves through a primary constructor parameter.
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

// Object fields (only reachable via ignoreMutable) must not get an
// `unnecessary_cast`-triggering `as Object`.
@ShouldGenerate(r'''
  $R call({Object? id = $undefined, Object? obj = $undefined}) {
    return _then(
      IgnoreMutableObjectField(
        $undefined == id || id == null ? _value.id : id as String,
        $undefined == obj || obj == null ? _value.obj : obj,
      ),
    );
  }
''', contains: true)
@ImModel()
class IgnoreMutableObjectField {
  const IgnoreMutableObjectField(this.id, this.obj);

  final String id;
  @ImField(ignoreMutable: true)
  final Object obj;
}

@ShouldGenerate(r'''
  $R call({Object? id = $undefined, Object? obj = $undefined}) {
    return _then(
      IgnoreMutableObjectNullableField(
        $undefined == id || id == null ? _value.id : id as String,
        $undefined == obj ? _value.obj : obj,
      ),
    );
  }
''', contains: true)
@ImModel()
class IgnoreMutableObjectNullableField {
  const IgnoreMutableObjectNullableField(this.id, this.obj);

  final String id;
  @ImField(ignoreMutable: true)
  final Object? obj;
}

// `dynamic` doesn't have that problem, so the cast stays.
@ShouldGenerate(r'''
  $R call({Object? id = $undefined, Object? dyn = $undefined}) {
    return _then(
      IgnoreMutableDynamicField(
        $undefined == id || id == null ? _value.id : id as String,
        $undefined == dyn || dyn == null ? _value.dyn : dyn as dynamic,
      ),
    );
  }
''', contains: true)
@ImModel()
class IgnoreMutableDynamicField {
  const IgnoreMutableDynamicField(this.id, this.dyn);

  final String id;
  @ImField(ignoreMutable: true)
  final dynamic dyn;
}
