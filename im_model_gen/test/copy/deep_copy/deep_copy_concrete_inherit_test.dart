import 'package:im_model/im_model.dart';
import 'package:test/test.dart' hide equals;

part 'deep_copy_concrete_inherit_test.g.dart';

@ImModel()
class Base with _$BaseMixin {
  const Base({required this.id});

  final String id;
}

@ImModel()
class Derived extends Base with _$DerivedMixin {
  const Derived({required super.id, required this.label});

  final String label;
}

void main() {
  test(
    'a concrete class extending another concrete @ImModel class with '
    'copyWith enabled on both compiles, and copies correctly at each level',
    () {
      const derived = Derived(id: 'a', label: 'x');

      final updatedLabel = derived.copyWith(label: 'y');
      expect(updatedLabel.label, 'y');
      expect(updatedLabel.id, 'a');

      final updatedId = derived.copyWith(id: 'b');
      expect(updatedId.id, 'b');
      expect(updatedId.label, 'x');
    },
  );
}
