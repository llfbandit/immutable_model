import 'package:im_model/im_model.dart';
import 'package:test/test.dart';

void main() {
  group('ImSet', () {
    test('mut getter', () {
      final coll = ImSet({'foo', 'bar'});
      final mutColl = coll.mut..add('baz');

      expect(coll.length, 2);
      expect(mutColl.length, 3);
      expect(mutColl.lookup('baz'), 'baz');
    });

    test('immut getter', () {
      final coll = {'foo', 'bar'}.immut;
      expect(coll.runtimeType, ImSet<String>);
    });

    test('empty constructor', () {
      expect(const ImSet<int>.empty().length, 0);
    });

    test('length', () {
      final coll = ImSet({'foo', 'bar'});
      expect(coll.length, 2);

      expect(const ImSet<int>.empty().length, 0);
    });

    test('iterator', () {
      final coll = ImSet({'foo', 'bar'});
      final it = coll.iterator;

      expect(it.moveNext(), true);
      expect(it.current, 'foo');
      expect(it.moveNext(), true);
      expect(it.current, 'bar');
    });

    test('contains', () {
      final coll = ImSet({'foo', 'bar'});
      expect(coll.contains('foo'), true);
    });

    test('lookup', () {
      final coll = ImSet({'foo', 'bar'});
      expect(coll.lookup('foo'), 'foo');
      expect(coll.lookup('baz'), null);
    });

    test('toSet', () {
      final coll = ImSet({'foo', 'bar'});
      final mutColl = coll.toSet()..add('baz');

      expect(coll.length, 2);
      expect(mutColl.length, 3);
      expect(mutColl.lookup('baz'), 'baz');
    });

    test('instantiates empty by default', () {
      var set = ImSet<int>();
      expect(set.isEmpty, isTrue);
      expect(set.isNotEmpty, isFalse);
    });

    test('allows <dynamic>', () {
      ImSet<dynamic>();
    });

    test('can be instantiated from Set', () {
      ImSet<int>([]);
    });

    test('of constructor takes inferred type', () {
      expect(ImSet([1, 2, 3]), const TypeMatcher<ImSet<int>>());
    });

    test('reports non-emptiness', () {
      var set = ImSet<int>([1]);
      expect(set.isEmpty, isFalse);
      expect(set.isNotEmpty, isTrue);
    });

    test('can be instantiated from Set then converted back to equal Set', () {
      var mutableSet = [1];
      var set = ImSet<int>(mutableSet);
      expect(set.toSet(), mutableSet);
    });

    test('does not keep a mutable Set', () {
      var mutableSet = [1];
      var set = ImSet<int>(mutableSet);
      mutableSet.clear();
      expect(set.toSet(), [1]);
    });

    test('can be converted to Set<E>', () {
      expect(
        ImSet<int>().toSet(),
        const TypeMatcher<Set<int>>(),
      );
      expect(
        ImSet<int>().toSet(),
        isNot(const TypeMatcher<Set<String>>()),
      );
    });

    test('can be converted to an UnmodifiableSetView', () {
      var immutableSet = ImSet<int>().asSet();
      expect(immutableSet, const TypeMatcher<Set<int>>());
      expect(() => immutableSet.add(1), throwsUnsupportedError);
      expect(immutableSet, isEmpty);
    });

    test('hashes to same value for same contents', () {
      var set1 = ImSet<int>([1, 2, 3]);
      var set2 = ImSet<int>([1, 2, 3]);

      expect(set1.hashCode, set2.hashCode);
    });

    test('hashes to same value for same contents in different order', () {
      var set1 = ImSet<int>([1, 2, 3]);
      var set2 = ImSet<int>([3, 2, 1]);

      expect(set1.hashCode, set2.hashCode);
    });

    test('hashes to different value for different contents', () {
      var set1 = ImSet<int>([1, 2, 3]);
      var set2 = ImSet<int>([1, 2, 4]);

      expect(set1.hashCode, isNot(set2.hashCode));
    });

    test('compares equal to same instance', () {
      var set1 = ImSet<int>([1, 2, 3]);
      expect(set1 == set1, isTrue);
    });

    test('compares equal to same contents', () {
      var set1 = ImSet<int>([1, 2, 3]);
      var set2 = ImSet<int>([1, 2, 3]);
      expect(set1 == set2, isTrue);
    });

    test('compares not equal to different type', () {
      // ignore: unrelated_type_equality_checks
      expect(ImSet<int>([1, 2, 3]) == '', isFalse);
    });

    test('compares not equal to different length ImSet', () {
      expect(ImSet<int>([1, 2, 3]) == ImSet<int>([1, 2, 3, 4]), isFalse);
    });

    test('provides toString() for debugging', () {
      expect(ImSet<int>([1, 2, 3]).toString(), '{1, 2, 3}');
    });

    test('preserves order', () {
      expect(ImSet<int>([1, 2, 3]), [1, 2, 3]);
      expect(ImSet<int>([3, 2, 1]), [3, 2, 1]);
    });

    test('is not mutated when Set from toSet is mutated', () {
      var set = ImSet<int>();
      set.toSet().add(1);
      expect(set, <int>[]);
    });

    // Set.

    test('does not implement Set', () {
      expect(ImSet<int>() is Set, isFalse);
    });

    test('Set.length', () {
      expect(ImSet<int>([1, 2, 3]).length, 3);
    });

    test('Set.containsAll', () {
      expect(ImSet<int>([1, 2, 3]).containsAll([1, 2]), isTrue);
      expect(ImSet<int>([1, 2, 3]).containsAll([1, 2, 3, 4]), isFalse);
    });

    test('Set.difference', () {
      expect(ImSet<int>([1, 2, 3]).difference(ImSet<int>([1])), [2, 3]);
    });

    test('Set.intersection', () {
      expect(ImSet<int>([1, 2, 3]).intersection(ImSet<int>([1])), [1]);
    });

    test('Set.lookup', () {
      expect(ImSet<int>([1, 2, 3]).lookup(1), 1);
      expect(ImSet<int>([1, 2, 3]).lookup(4), isNull);
    });

    test('Set.union', () {
      expect(ImSet<int>([1, 2, 3]).union(ImSet<int>([4])), [1, 2, 3, 4]);
    });

    // Iterable.

    test('implements Iterable', () {
      expect(ImSet<int>(), const TypeMatcher<Iterable<int>>());
    });

    test('Iterable<E>', () {
      expect(
        ImSet<int>(),
        const TypeMatcher<Iterable<int>>(),
      );
      expect(
        ImSet<int>(),
        isNot(const TypeMatcher<Iterable<String>>()),
      );
    });

    test('Iterable.map', () {
      expect(ImSet<int>([1]).map((x) => x + 1), [2]);
    });

    test('Iterable.where', () {
      expect(ImSet<int>([1, 2]).where((x) => x > 1), [2]);
    });

    test('Iterable.expand', () {
      expect(ImSet<int>([1, 2]).expand((x) => [x, x + 1]), [1, 2, 2, 3]);
    });

    test('Iterable.contains', () {
      expect(ImSet<int>([1]).contains(1), isTrue);
      expect(ImSet<int>([1]).contains(2), isFalse);
    });

    test('Iterable.forEach', () {
      var value = 1;
      // ignore: avoid_function_literals_in_foreach_calls
      ImSet<int>([2]).forEach((x) => value = x);
      expect(value, 2);
    });

    test('Iterable.reduce', () {
      expect(ImSet<int>([1, 2]).reduce((x, y) => x + y), 3);
    });

    test('Iterable.fold', () {
      expect(ImSet<int>([1, 2]).fold('', (x, y) => x.toString() + y.toString()),
          '12');
    });

    test('Iterable.followedBy', () {
      expect(ImSet<int>([1, 2]).followedBy(ImSet<int>([3, 4])), [1, 2, 3, 4]);
    });

    test('Iterable.every', () {
      expect(ImSet<int>([1, 2]).every((x) => x == 1), isFalse);
      expect(ImSet<int>([1, 2]).every((x) => x == 1 || x == 2), isTrue);
    });

    test('Iterable.join', () {
      expect(ImSet<int>([1, 2]).join(','), '1,2');
    });

    test('Iterable.any', () {
      expect(ImSet<int>([1, 2]).any((x) => x == 0), isFalse);
      expect(ImSet<int>([1, 2]).any((x) => x == 1), isTrue);
    });

    test('Iterable.toSet', () {
      expect(ImSet<int>([1, 2]).toSet(), const TypeMatcher<Set<int>>());
      expect(ImSet<int>([1, 2]).toSet(), [1, 2]);
    });

    test('Iterable.toList', () {
      expect(ImSet<int>([1, 2]).toList(), const TypeMatcher<List<int>>());
      expect(ImSet<int>([1, 2]).toList(), [1, 2]);
    });

    test('Iterable.take', () {
      expect(ImSet<int>([1, 2]).take(1), [1]);
    });

    test('Iterable.takeWhile', () {
      expect(ImSet<int>([1, 2]).takeWhile((x) => x == 1), [1]);
    });

    test('Iterable.skip', () {
      expect(ImSet<int>([1, 2]).skip(1), [2]);
    });

    test('Iterable.skipWhile', () {
      expect(ImSet<int>([1, 2]).skipWhile((x) => x == 1), [2]);
    });

    test('Iterable.first', () {
      expect(ImSet<int>([1, 2]).first, 1);
    });

    test('Iterable.last', () {
      expect(ImSet<int>([1, 2]).last, 2);
    });

    test('Iterable.last', () {
      expect(() => ImSet<int>([1, 2]).single, throwsA(anything));
      expect(ImSet<int>([1]).single, 1);
    });

    test('Iterable.firstWhere', () {
      expect(ImSet<int>([1, 2]).firstWhere((x) => x == 2), 2);
      expect(() => ImSet<int>([1, 2]).firstWhere((x) => x == 3),
          throwsA(anything));
      expect(ImSet<int>([1, 2]).firstWhere((x) => x == 3, orElse: () => 4), 4);
    });

    test('Iterable.lastWhere', () {
      expect(ImSet<int>([1, 2]).lastWhere((x) => x == 2), 2);
      expect(
          () => ImSet<int>([1, 2]).lastWhere((x) => x == 3), throwsA(anything));
      expect(ImSet<int>([1, 2]).lastWhere((x) => x == 3, orElse: () => 4), 4);
    });

    test('Iterable.singleWhere', () {
      expect(ImSet<int>([1, 2]).singleWhere((x) => x == 2), 2);
      expect(() => ImSet<int>([1, 2]).singleWhere((x) => x == 3),
          throwsA(anything));
      expect(
          () => ImSet<int>([1, 2]).singleWhere((x) => true), throwsA(anything));
      expect(ImSet<int>([1, 2]).singleWhere((x) => false, orElse: () => 7), 7);
    });

    test('Iterable.elementAt', () {
      expect(ImSet<int>([1, 2]).elementAt(0), 1);
    });

    test('Iterable.cast', () {
      expect(ImSet<int>([1, 2]).cast<Object>(),
          const TypeMatcher<Iterable<Object>>());
      expect(ImSet<int>([1, 2]).cast<Object>(), [1, 2]);
    });

    test('Iterable.whereType', () {
      expect(ImSet<Object>([1, 'two', 3]).whereType<String>(), ['two']);
    });
  });
}
