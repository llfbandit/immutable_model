Annotations and immutable collections that power [im_model_gen](https://pub.dev/packages/im_model_gen), a code generator that adds `==` equality and `copyWith` to your Dart classes.

## Features

- Standard Dart syntax — no custom factories or sealed classes required
- Errors at generation time, not runtime
- Small generated output — smaller binary, faster IDE
- Enforces immutability
- Supports inheritance
- Supports copy chaining

## Setup

```yaml
# pubspec.yaml
dependencies:
  im_model: ^2.0.0

dev_dependencies:
  im_model_gen: ^2.0.0
  build_runner: ^2.0.0
```

## Usage

Annotate your class, add the generated mixin, and declare the part file:

```dart
import 'package:im_model/im_model.dart';

part 'example.g.dart';

@ImModel()
class Example with _$ExampleMixin {
  final String id;
  final String? name;
  final ImList<int> values;

  const Example(this.id, {this.name, required this.values});
}
```

Run the generator:

```bash
dart run build_runner build
```

Then use the generated extensions:

```dart
const example = Example('id', values: ImList.empty());

// Copy with new values
example.copyWith(name: 'Alice'); // Example(id: id, name: Alice, values: [])
example.copyWith(name: null);   // Example(id: id, name: null,  values: [])

// Equality
const other = Example('id', values: ImList.empty());
example == other;                       // true
example == other.copyWith(values: [1]); // false

// Immutability — compile error:
// example.values.add(1); // 'add' is undefined
```

## Annotations

### `@ImModel`

Applied to a class.

| Parameter         | Default | Description                         |
|-------------------|---------|-------------------------------------|
| `ignoreCopy`      | `false` | Skip `copyWith` generation          |
| `ignoreEqual`     | `false` | Skip `==` / `hashCode` generation   |
| `copyConstructor` | `null`  | Named constructor to use for copies |

### `@ImField`

Applied to a field to override the class-level `@ImModel` settings.

| Parameter     | Default | Description                        |
|---------------|---------|------------------------------------|
| `ignoreCopy`  | `false` | Exclude this field from `copyWith` |
| `ignoreEqual` | `false` | Exclude this field from equality   |

## Collections

Replace mutable collections with their immutable counterparts:

| Mutable     | Immutable     |
|-------------|---------------|
| `List<T>`   | `ImList<T>`   |
| `Map<K, V>` | `ImMap<K, V>` |
| `Set<T>`    | `ImSet<T>`    |

Use `.mut` / `.immut` to switch between views — `.mut` is copy-on-write, so there's no allocation cost unless you actually modify it:

```dart
obj = obj.copyWith(values: obj.values.mut..add(42));
// Generated code wraps the result back to ImList automatically.
```

## vs Freezed

- No special factory constructors or `@freezed` class shape
- Mutable types are caught at generation time
- Lean generated output
- No lock-in syntax — easy to migrate away from
- Generated code is intentionally minimal. A production Flutter web app (8.2 MB) saw a **650 KB reduction** (~8% of `main.dart.js`) after migrating from Freezed.
