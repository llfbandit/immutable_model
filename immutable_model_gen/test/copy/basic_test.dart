import 'package:immutable_model/immutable_model.dart';
import 'package:test/test.dart' hide equals;

part 'basic_test.g.dart';

@ImModel()
class CopyNonOptional with _$CopyNonOptionalMixin {
  const CopyNonOptional({required this.id});

  final String id;
}

@ImModel()
class CopyOptional with _$CopyOptionalMixin {
  const CopyOptional({this.id});

  final String? id;
}

void main() {
  test('CopyNonOptional', () {
    expect(const CopyNonOptional(id: '').copyWith(id: 'test').id, 'test');

    expect(const CopyNonOptional(id: 'test').copyWith(id: null).id, 'test');
  });

  test('CopyOptional', () {
    expect(const CopyOptional().copyWith(id: 'test').id, 'test');

    expect(const CopyOptional(id: 'test').copyWith(id: null).id, null);
  });
}
