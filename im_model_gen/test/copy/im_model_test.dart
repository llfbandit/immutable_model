import 'package:im_model/im_model.dart';
import 'package:test/test.dart' hide equals;

part 'im_model_test.g.dart';

@ImModel()
class Foo with _$FooMixin {
  const Foo({required this.id});

  final String id;
}

@ImModel()
class Bar with _$BarMixin {
  const Bar({required this.foo});

  final Foo foo;
}

void main() {
  // This test ensures that the copy will compare
  // const $ImCopy() == foo and not foo == const $ImCopy()
  // Since copy impl provides objects, there is no error at compile time.
  test('Copy im_model', () {
    expect(
      const Bar(foo: Foo(id: 'test'))
          .copyWith(foo: const Foo(id: 'test_copy'))
          .foo
          .id,
      'test_copy',
    );
  });
}
