import 'package:im_model/im_model.dart';
import 'package:test/test.dart';

part 'eq_test.g.dart';

@ImModel()
class Generic<T extends Object> with _$GenericMixin {
  Generic(this.value);

  final T value;
}

@ImModel()
class Other with _$OtherMixin {
  Other(this.data);

  final String data;
}

enum Color { blonde, black, brown }

@ImModel()
class Complex with _$ComplexMixin {
  Complex({this.name, this.age, this.hairColor, this.children});

  final String? name;
  final int? age;
  final Color? hairColor;
  final ImList<String>? children;
}

void main() {
  group('Generic (string)', () {
    test('should return true when instance is the same', () {
      final instance = Generic('foo');
      expect(instance == instance, true);
    });

    test('should return true when instances are different', () {
      final instanceA = Generic('foo');
      final instanceB = Generic('foo');
      expect(instanceA == instanceB, true);
      expect(instanceA.hashCode == instanceB.hashCode, true);
    });

    test('should return false when values are different', () {
      final instanceA = Generic('foo');
      final instanceB = Generic('simpl');
      expect(instanceA == instanceB, false);
    });
  });

  group('Generic (number)', () {
    test('should return true when instance is the same', () {
      final instance = Generic(0);
      expect(instance == instance, true);
    });

    test('should return true when instances are different', () {
      final instanceA = Generic(0);
      final instanceB = Generic(0);
      expect(instanceA == instanceB, true);
      expect(instanceA.hashCode == instanceB.hashCode, true);
    });

    test('should return false when values are different', () {
      final instanceA = Generic(0);
      final instanceB = Generic(1);
      expect(instanceA == instanceB, false);
    });
  });

  group('Generic (bool)', () {
    test('should return true when instance is the same', () {
      final instance = Generic(true);
      expect(instance == instance, true);
    });

    test('should return true when instances are different', () {
      final instanceA = Generic(true);
      final instanceB = Generic(true);
      expect(instanceA == instanceB, true);
      expect(instanceA.hashCode == instanceB.hashCode, true);
    });

    test('should return false when values are different', () {
      final instanceA = Generic(true);
      final instanceB = Generic(false);
      expect(instanceA == instanceB, false);
    });
  });

  group('Generic (map)', () {
    test('should return true when instance is the same', () {
      final instance = Generic({'a': 1, 'b': 2, 'c': 3});
      expect(instance == instance, true);
    });

    test('should have same hashCode when values are equal', () {
      final instanceA = Generic(ImMap({'a': 1, 'b': 2, 'c': 3}));
      final instanceB = Generic(ImMap({'b': 2, 'a': 1, 'c': 3}));
      expect(instanceA == instanceB, true);
      expect(instanceA.hashCode, instanceB.hashCode);
    });

    test('should return true when instances are different', () {
      final instanceA = Generic(ImMap({'a': 1, 'b': 2, 'c': 3}));
      final instanceB = Generic(ImMap({'a': 1, 'b': 2, 'c': 3}));
      expect(instanceA == instanceB, true);
      expect(instanceA.hashCode == instanceB.hashCode, true);
    });

    test('should return false when values are different', () {
      final instanceA = Generic(ImMap({'a': 1, 'b': 2, 'c': 3}));
      final instanceB = Generic(ImMap({'a': 1, 'b': 2, 'c': 4}));
      expect(instanceA == instanceB, false);
    });
  });

  group('Generic (map custom key)', () {
    test('should return true when instance is the same', () {
      final instance = Generic(
        {
          Generic<String>('a'): 1,
          Generic<String>('b'): 2,
          Generic<String>('c'): 3
        },
      );
      expect(instance == instance, true);
    });

    test('should have same hashCode when values are equal', () {
      final instanceA = Generic(
        ImMap({
          Generic<String>('a'): 1,
          Generic<String>('b'): 2,
          Generic<String>('c'): 3
        }),
      );
      final instanceB = Generic(
        ImMap({
          Generic<String>('b'): 2,
          Generic<String>('a'): 1,
          Generic<String>('c'): 3
        }),
      );
      expect(instanceA == instanceB, true);
      expect(instanceA.hashCode, instanceB.hashCode);
    });

    test('should return true when instances are different', () {
      final instanceA = Generic(
        ImMap({
          Generic<String>('a'): 1,
          Generic<String>('b'): 2,
          Generic<String>('c'): 3
        }),
      );
      final instanceB = Generic(
        ImMap({
          Generic<String>('a'): 1,
          Generic<String>('b'): 2,
          Generic<String>('c'): 3
        }),
      );
      expect(instanceA == instanceB, true);
      expect(instanceA.hashCode == instanceB.hashCode, true);
    });

    test('should return false when values are different', () {
      final instanceA = Generic(
        ImMap({
          Generic<String>('a'): 1,
          Generic<String>('b'): 2,
          Generic<String>('c'): 3
        }),
      );
      final instanceB = Generic(
        ImMap({
          Generic<String>('a'): 1,
          Generic<String>('b'): 2,
          Generic<String>('c'): 2
        }),
      );
      expect(instanceA == instanceB, false);
    });
  });

  group('Generic (immutable)', () {
    test('should return true when instance is the same', () {
      final instance = Generic(Other('foo'));
      expect(instance == instance, true);
    });

    test('should return true when instances are different', () {
      final instanceA = Generic(Other('foo'));
      final instanceB = Generic(Other('foo'));
      expect(instanceA == instanceB, true);
      expect(instanceA.hashCode == instanceB.hashCode, true);
    });

    test('should return false when values are different', () {
      final instanceA = Generic(Other('foo'));
      final instanceB = Generic(Other('fooo'));
      expect(instanceA == instanceB, false);
    });
  });

  group('Complex', () {
    test('should return true when instance is the same', () {
      final instance = Complex(
        name: 'Joe',
        age: 40,
        hairColor: Color.black,
        children: ['Junior'].immut,
      );
      expect(instance == instance, true);
    });

    test('should return true when instances are different', () {
      final instanceA = Complex(
        name: 'Joe',
        age: 40,
        hairColor: Color.black,
        children: ['Junior'].immut,
      );
      final instanceB = Complex(
        name: 'Joe',
        age: 40,
        hairColor: Color.black,
        children: ['Junior'].immut,
      );
      expect(instanceA == instanceB, true);
      expect(instanceA.hashCode == instanceB.hashCode, true);
    });

    test('should return false when values are different', () {
      final instanceA = Complex(
        name: 'Joe',
        age: 40,
        hairColor: Color.black,
        children: ['Junior'].immut,
      );
      final instanceB = Complex(
        name: 'John',
        age: 40,
        hairColor: Color.brown,
        children: ['Laertes'].immut,
      );
      expect(instanceA == instanceB, false);
    });

    test('should return false when values only differ in list', () {
      final instanceA = Complex(
        name: 'Joe',
        age: 40,
        hairColor: Color.black,
        children: ['Junior'].immut,
      );
      final instanceB = Complex(
        name: 'Joe',
        age: 40,
        hairColor: Color.black,
        children: ['Laertes'].immut,
      );
      expect(instanceA == instanceB, false);
    });

    test('should return false when values only differ in single property', () {
      final instanceA = Complex(
        name: 'Joe',
        age: 40,
        hairColor: Color.black,
        children: ['Junior'].immut,
      );
      final instanceB = Complex(
        name: 'Joe',
        age: 41,
        hairColor: Color.black,
        children: ['Junior'].immut,
      );
      expect(instanceA == instanceB, false);
    });
  });

  group('Collection', () {
    group('Iterable', () {
      test('list of zeros same hashcode check', () {
        final s0 = Generic(ImList([0, 0]));
        final s1 = Generic(ImList([0, 0, 0]));
        expect(s0.hashCode != s1.hashCode, true);
      });

      test('should return when values are same', () {
        final instanceA = Generic(ImList(['A', 'B']));
        final instanceB = Generic(ImList(['A', 'B']));
        expect(instanceA == instanceB, true);
        expect(instanceA.hashCode == instanceB.hashCode, true);
      });

      test('should return when values are different', () {
        final instanceA = Generic(ImList(['A', 'B']));
        final instanceB = Generic(ImList(['a', 'b']));
        expect(instanceA != instanceB, true);
        expect(instanceA.hashCode != instanceB.hashCode, true);
      });

      test('should return when values are different', () {
        final instanceA = Generic(ImList(['A', 'B']));
        final instanceB = Generic(ImList(['C', 'D']));
        expect(instanceA != instanceB, true);
        expect(instanceA.hashCode != instanceB.hashCode, true);
      });
    });

    group('Nested Iterable', () {
      test('should return when values are same', () {
        final instanceA = Generic(ImList([
          ImList(['A', 'B', 'C']),
          ImList(['D', 'E', 'F'])
        ]));
        final instanceB = Generic(ImList([
          ImList(['A', 'B', 'C']),
          ImList(['D', 'E', 'F'])
        ]));
        expect(instanceA == instanceB, true);
        expect(instanceA.hashCode == instanceB.hashCode, true);
      });

      test('should return when values are different', () {
        final instanceA = Generic(ImList([
          ImList(['A', 'B', 'C']),
          ImList(['D', 'E', 'F'])
        ]));
        final instanceB = Generic(ImList([
          ImList(['a', 'b', 'c']),
          ImList(['d', 'e', 'f'])
        ]));
        expect(instanceA != instanceB, true);
        expect(instanceA.hashCode != instanceB.hashCode, true);
      });
    });

    group('List', () {
      test('should return when values are same', () {
        final instanceA = Generic(ImList(['A', 'B']));
        final instanceB = Generic(ImList(['A', 'B']));
        expect(instanceA == instanceB, true);
        expect(instanceA.hashCode == instanceB.hashCode, true);
      });

      test('should return when values are different', () {
        final instanceA = Generic(ImList(['A', 'B']));
        final instanceB = Generic(ImList(['a', 'b']));
        expect(instanceA != instanceB, true);
        expect(instanceA.hashCode != instanceB.hashCode, true);
      });

      test('should return when values are different', () {
        final instanceA = Generic(ImList(['A', 'B']));
        final instanceB = Generic(ImList(['C', 'D']));
        expect(instanceA != instanceB, true);
        expect(instanceA.hashCode != instanceB.hashCode, true);
      });

      test(
          'should return different hashCode '
          'when instance properties are different', () {
        final instanceA = Generic(ImList(['A', 'B']));
        final instanceB = Generic(ImList(['B']));

        expect(instanceA != instanceB, true);
        expect(instanceA.hashCode != instanceB.hashCode, true);
      });
    });

    group('Map', () {
      test('should return true when values are same', () {
        final instanceA = Generic(ImMap({1: 'A', 2: 'B'}));
        final instanceB = Generic(ImMap({1: 'A', 2: 'B'}));
        expect(instanceA == instanceB, true);
        expect(instanceA.hashCode == instanceB.hashCode, true);
      });

      test('should return false when values are different', () {
        final instanceA = Generic(ImMap({1: 'A', 2: 'B'}));
        final instanceB = Generic(ImMap({1: 'a', 2: 'b'}));
        expect(instanceA != instanceB, true);
        expect(instanceA.hashCode != instanceB.hashCode, true);
      });

      test('should return false when values are different', () {
        final instanceA = Generic(ImMap({1: 'A', 2: 'B'}));
        final instanceB = Generic(ImMap({1: 'C', 2: 'D'}));
        expect(instanceA != instanceB, true);
        expect(instanceA.hashCode != instanceB.hashCode, true);
      });

      test(
          'should return different hashCode '
          'when instance properties are different', () {
        final instanceA = Generic(ImMap({1: 'A', 2: 'B'}));
        final instanceB = Generic(ImMap({2: 'B'}));

        expect(instanceA != instanceB, true);
        expect(instanceA.hashCode != instanceB.hashCode, true);
      });
    });

    group('Set', () {
      test('should return when values are same', () {
        final instanceA = Generic(ImSet({'A', 'B'}));
        final instanceB = Generic(ImSet({'A', 'B'}));
        expect(instanceA == instanceB, true);
        expect(instanceA.hashCode == instanceB.hashCode, true);
      });

      test('should return when Set values are same but in different order', () {
        final instanceA = Generic(ImSet({'A', 'B'}));
        final instanceB = Generic(ImSet({'B', 'A'}));
        expect(instanceA == instanceB, true);
        expect(instanceA.hashCode == instanceB.hashCode, true);
      });

      test('should return when values are different', () {
        final instanceA = Generic(ImSet({'A', 'B'}));
        final instanceB = Generic(ImSet({'a', 'b'}));
        expect(instanceA != instanceB, true);
        expect(instanceA.hashCode != instanceB.hashCode, true);
      });

      test('should return when values are different', () {
        final instanceA = Generic(ImSet({'A', 'B'}));
        final instanceB = Generic(ImSet({'C', 'D'}));
        expect(instanceA != instanceB, true);
        expect(instanceA.hashCode != instanceB.hashCode, true);
      });

      test('should support non-comparable types', () {
        final instanceA = Generic(ImSet({Object()}));
        final instanceB = Generic(ImSet({Object()}));
        expect(instanceA == instanceB, false);
        expect(instanceA.hashCode == instanceB.hashCode, false);
      });
    });
  });
}
