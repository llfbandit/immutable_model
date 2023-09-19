import 'package:immutable_model/immutable_model.dart';

part 'example.g.dart';

/// Generic type => No need to forward it to the mixin.
/// Inverted ignore flags on class => superseeded by fields
/// [id] is not part of `copyWith`.
/// Only [id] is part of equality.
@ImModel(ignoreEqual: true, ignoreCopy: true)
class Parent<T> with _$ParentMixin {
  @ImField(ignoreEqual: false)
  final String id;
  @ImField(ignoreCopy: false)
  final T? aValue;

  const Parent(this.id, this.aValue);
}

/// [collection] class member is immutable (you can't use add, remove, ...).
/// [id] is not part of `copyWith`.
/// Only [id] and [collection] are part of equality.
@ImModel()
class Child<T> extends Parent<T> with _$ChildMixin {
  final ImList<int> collection;

  const Child(super.id, super.aValue, {required this.collection});
}

/// Usage of named constructor to make copies.
/// [copyWith] is not available on this model.
@ImModel(copyConstructor: 'named', ignoreCopy: true)
class Child2<T> extends Child<T> with _$Child2Mixin {
  final bool foo;

  const Child2.named(
    super.id,
    super.aValue,
    this.foo, {
    super.collection = const ImList.empty(),
  });
}

void main() {
  var obj1 = Child('a', 0, collection: [1].immut);
  var obj2 = Child('a', 0, collection: ImList([1]));
  print(obj1 == obj2 ? '\u2705 equal!' : '\u274C Not equal');

  // obj1.collection.add(2);
  // 'add' is deprecated and shouldn't be used. This collection is immutable and will throw exception at runtime.

  // So now that we have a clear view in our source code, it's time to fix this!
  obj1 = obj1.copyWith(collection: obj1.collection.mut..add(2));
  print(obj1 == obj2 ? '\u274C equal!' : '\u2705 Not equal');

  // Two things to notice here:
  // - we used `mut` getter to mutate the initial collection for shorter syntax. This is a shortcut (forward method) for `List.of`.
  // - we didn't had to wrap again the collection to be immutable, this is done in generated code.

  // obj1.copyWith(id: 'b');
  // The named parameter 'id' isn't defined.
}
