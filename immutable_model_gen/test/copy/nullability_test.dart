import 'package:immutable_model/immutable_model.dart';
import 'package:test/test.dart' hide equals;

part 'nullability_test.g.dart';

@ImModel()
class TestNullability with _$TestNullabilityMixin {
  TestNullability(this.dynField, this.coll);

  /// Special case for dynamic types
  final dynamic dynField;

  final ImList<int> coll;
}

void main() {
  test('TestNullability', () {
    expect(TestNullability(1, [1].immut).copyWith(dynField: 2).dynField, 2);
    expect(TestNullability(1, [1].immut).copyWith(coll: [1]).dynField, 1);
    expect(
      TestNullability(null, [1].immut).copyWith(dynField: 1).dynField,
      1,
    );
    expect(
      TestNullability(null, [1].immut).copyWith(coll: [2]).dynField,
      null,
    );
  });
}
