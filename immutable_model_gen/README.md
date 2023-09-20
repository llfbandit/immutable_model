This library provides code generation for immutable models with value comparison `==` and `copyWith` methods.

Project targets:
- Standard syntax.
- Improved output binary size.
- Low source code generation code, your IDE will be happy.
- Inheritance unlocked (while encouraging composition every day, "is-a" pattern is not bad).
- to be not too intrusive.
- errors/warnings before runtime (__do use a linter!__).

## Requirements
Requirement dart SDK >= 3.0.0

## Usage

#### Annotate your class with `ImModel` annotation

```dart
import 'package:immutable_model/immutable_model.dart';

part 'example.g.dart'; // Declare generated part file

@ImModel()
class Example with _$ExampleMixin { // Associate your class with the generated mixin
  final String id;
  final String? name;
  final ImList<int> values; // ImList is part of this package.

  const Example(this.id, {this.name, this.values = const ImList.empty()});
}
```

```dart
const example = Example(id: 'id');

// Copy
example.copyWith(text: 'test'); // Example(id: "id", text: test, values = [])
example.copyWith(text: null); // Example(id: "id", text: null, values = [])

// Equality
const exampleTwo = Example(id: 'id');
example == exampleTwo; // true
example == exampleTwo.copyWith(values: [1]); // false

// Immutability
example.values.add(1); // 'add' is deprecated and shouldn't be used. This collection is immutable and will throw exception at runtime.
```

#### Code generation command

```bash
dart run build_runner build --delete-conflicting-outputs
```

## More on features

There are two annotations available.

`ImModel` on classes with those parameters:
  - ignoreCopy: allows to ignore the copy generation. Defaults to `false`.
  - ignoreEqual: allows to ignore the equality generation. Defaults to `false`.
  - copyConstructor: If needed, you can setup a named constructor for copy generation. Defaults to `null`.

`ImModel` on class fields to superseed class annotation with those parameters:
  - ignoreCopy: allows to ignore the copy generation. Defaults to `null`.
  - ignoreEqual: allows to ignore the equality generation. Defaults to `null`.

## Collections:
This package provides immutable collections by simply wrapping the core ones.

You must prefix all your mutable collections to their immutable counterpart.
- List => ImList
- Map => ImMap
- Set => ImSet

The code generator will provide error messages if it detects mutable collections.

If you're migrating from another tool: __with your linter__ fix deprecated mutable operations (add, remove, ...) in your code base if any.

⚠️ __Warning__ ⚠️

At this time, if you use a custom collection implementation, the package won't be able to detect it.

So things like `MyFooList<int>` or `ImList<MyFooList<int>>` will be allowed, but `ImList<Set<int>>` or other variants won't.

To facilitate mutation on collections there are two getters:
- mut => to get the mutable version of the collection.
- immut => to get the immutable version of the collection.

Look at the example below for demonstration.

## Equality & performance
Since this package aims to minimize output size, equality is not generated.

Instead, equality mecanism is very similar to Equatable package. So you can expect similar performance.

## (More) advanced usage

Now that we have all discovered, here's a full (fancy) example:

```dart
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
```

```dart
void main() {
  var obj1 = Child('a', 0, collection: [1].immut);
  var obj2 = Child('a', 0, collection: ImList([1]));
  print(obj1 == obj2 ? '\u2705 Equal' : '\u274C Not equal');

  obj1 = obj1.copyWith(collection: obj1.collection.mut..add(2));
  print(obj1 == obj2 ? '\u274C Equal' : '\u2705 Not equal');

  // Two things to notice here:
  // - we used `mut` getter to mutate the initial collection for shorter syntax. This is a shortcut (forward method) for `List.of`.
  // - we didn't had to wrap again the collection to be immutable, this is done in generated code.

  // obj1.copyWith(id: 'b');
  // The named parameter 'id' isn't defined.
}
```

## What if I do love `Freezed`?

This project diverges by targeting output size of your app and doesn't use "specific" syntax for the same result, improving our coding performance.

Freezed does not guarantee in any way that your collections are immutable when coding.

I consider this package not too intrusive to allow you to get away easily if you(we) find a more suitable or definitive solution.

## Final word

Made with two fingers an a keyboard late at night.
