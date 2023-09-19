import 'package:immutable_model/immutable_model.dart';
import 'package:test/test.dart' hide equals;

part 'constructor_test.g.dart';

@ImModel(copyConstructor: '_')
class CopyNamedConstructor with _$CopyNamedConstructorMixin {
  const CopyNamedConstructor._({
    this.id,
  });

  final String? id;
}

@ImModel(copyConstructor: 'first')
class CopyMultiConstructors with _$CopyMultiConstructorsMixin {
  const CopyMultiConstructors({
    this.id,
  }) : field = "test";

  const CopyMultiConstructors.first({
    this.id,
    required this.field,
  });

  const CopyMultiConstructors.second({
    this.id,
    required this.field,
  });

  final String? id;
  final String field;
}

@ImModel(copyConstructor: '_')
class DefaultValuesConstructor with _$DefaultValuesConstructorMixin {
  const DefaultValuesConstructor._({this.anotherField}) : field = 'test';

  final String? id = 'test';
  final String? field;
  final String? anotherField;
}

@ImModel()
class PositionedFields with _$PositionedFieldsMixin {
  const PositionedFields(
    this.pOne,
    this.pTwo, {
    this.namedOne,
  });

  final String pOne;
  final String pTwo;
  final String? namedOne;
}

void main() {
  group('named constructor', () {
    test('CopyNamedConstructor', () {
      expect(
        const CopyNamedConstructor._().copyWith(id: 'test').id,
        "test",
      );

      expect(
        const CopyNamedConstructor._(id: 'test').copyWith(id: null).id,
        null,
      );
    });

    test('CopyMultiConstructors', () {
      expect(
        const CopyMultiConstructors().copyWith(id: "test").id,
        "test",
      );

      expect(
        const CopyMultiConstructors().copyWith(field: 'test123').field,
        "test123",
      );
    });

    test('DefaultValuesConstructor', () {
      final result = const DefaultValuesConstructor._(anotherField: 'test')
          .copyWith(anotherField: '123');

      expect(result.id, 'test');
      expect(result.field, 'test');
      expect(result.anotherField, "123");
    });
  });

  group('Positionned fields', () {
    test('pOne has been replaced', () {
      const pf = PositionedFields('pOne', 'pTwo', namedOne: 'namedOne');
      const expected = PositionedFields('test', 'pTwo', namedOne: 'namedOne');

      expect(pf.copyWith(pOne: 'test'), expected);
    });

    test('pTwo has been replaced', () {
      const pf = PositionedFields('pOne', 'pTwo', namedOne: 'namedOne');
      const expected = PositionedFields('pOne', 'test', namedOne: 'namedOne');

      expect(pf.copyWith(pTwo: 'test'), expected);
    });

    test('namedOne has been replaced', () {
      const pf = PositionedFields('pOne', 'pTwo', namedOne: 'namedOne');
      const expected = PositionedFields('pOne', 'pTwo', namedOne: 'test');

      expect(pf.copyWith(namedOne: 'test'), expected);
    });
  });
}
