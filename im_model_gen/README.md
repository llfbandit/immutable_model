This library provides code generation for immutable models with value comparison `==` and `copyWith` methods.

Project targets:
- Standard syntax.
- errors before runtime.
- Low source code generation, your IDE will be happy.
- Improved output binary size.
- Inheritance unlocked (while encouraging composition every day, "is-a" pattern is not bad).
- to be not too intrusive.

## Requirements
Requirement dart SDK >= 3.6.0

## Usage

#### Annotate your class with `ImModel` annotation

```dart
import 'package:im_model/im_model.dart';

part 'example.g.dart'; // Declare generated part file

@ImModel()
class Example with _$ExampleMixin { // Associate your class with the generated mixin
  final String id;
  final String? name;
  final ImList<int> values; // ImList is part of this package.

  const Example(this.id, {this.name, required this.values});
}
```

```dart
const example = Example(id: 'id', values: ImList.empty());

// Copy
example.copyWith(text: 'test'); // Example(id: "id", text: test, values; [])
example.copyWith(text: null); // Example(id: "id", text: null, values: [])

// Equality
const exampleTwo = Example(id: 'id', values: ImList.empty());
example == exampleTwo; // true
example == exampleTwo.copyWith(values: [1]); // false

// Immutability
// example.values.add(1); // 'add' is undefined.
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

## Collections
This package provides immutable/comparable/hashable collections by simply wrapping the core ones.

You must prefix all your mutable collections to their immutable counterpart.
- List => ImList
- Map => ImMap
- Set => ImSet

The code generator will provide error messages if it detects mutable collections.

To facilitate mutation on collections there are two getters:
- mut => to get a mutable version of the collection. You can use it at __no cost__, the collection is copied __only__ if you modify it.
- immut => to get the immutable version of the collection.

Look at the example below for demonstration.

⚠️ 

- Obviously, like anywhere else, the collections are immutable only if the elements are immutable.

- At this time, if you use a custom collection implementation, the package won't be able to detect it. So things like `MyFooList<int>` or `ImList<MyFooList<int>>` will be allowed, but `ImList<Set<int>>` or other variants won't.

## Equality
This package uses Dart 3 records to make `ImModel`s comparable.

Also, an `ImModel` enforces equality on models of the same type.

Now, things like `MyImModel() == Object()` will trigger an error at compile time.

Finally, the performance is completely determined by Dart internal libraries, partially on Im* collections.

## (More) advanced usage

Now that we have all discovered, here's a full (fancy) example:

```dart
/// Inverted ignore flags on class => superseeded by fields
/// [id] is not part of `copyWith`.
/// Only [id] is part of equality.
@ImModel(ignoreEqual: true, ignoreCopy: true)
class Parent<T> with _$ParentMixin<T> {
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
class Child<T> extends Parent<T> with _$ChildMixin<T> {
  final ImList<int> collection;

  const Child(super.id, super.aValue, {required this.collection});
}
```

```dart
void main() {
  var obj1 = Child('a', 0, collection: [1].immut);
  var obj2 = Child('a', 0, collection: ImList([1]));
  // obj1 == obj2 => true

  obj1 = obj1.copyWith(collection: obj1.collection.mut..add(2));
  // obj1 == obj2 => false

  // Two things to notice here:
  // - we used `mut` getter to mutate the initial collection for shorter syntax.
  // - we didn't had to wrap again the collection to be immutable, this is done in generated code.

  // obj1.copyWith(id: 'b');
  // The named parameter 'id' isn't defined.
}
```

## Improved output size

Todo.

For now, I'll give you my personal experience.

I developed this package for professional needs and the resulting output size from a 8.2MB web app has decreased by 650KB => 8% (main.dart.js considered only).

## What if I do love `Freezed`?

This project diverges by targeting output size of your app and doesn't use "specific" syntax for the same result, improving our coding performance.

Freezed does not guarantee in any way that your collections are immutable when coding.

I consider this package not too intrusive to allow you to get away easily if you(we) find a more suitable or definitive solution.

## Final word

Made with two fingers and a keyboard late at night.
