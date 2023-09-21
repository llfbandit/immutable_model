import 'package:im_model/src/collection/internal/copy_on_write_set.dart';
import 'package:test/test.dart';

void main() {
  group('CopyOnWriteSet', () {
    test('has toString equal to Set.toString', () {
      var set = <int>{1, 2, 3};
      expect(CopyOnWriteSet(set).toString(), set.toString());
    });

    test('Set.length', () {
      expect(CopyOnWriteSet<int>({1, 2, 3}).length, 3);
    });

    test('Set.containsAll', () {
      expect(CopyOnWriteSet<int>({1, 2, 3}).containsAll({1, 2}), isTrue);
      expect(CopyOnWriteSet<int>({1, 2, 3}).containsAll([1, 2, 3, 4]), isFalse);
    });

    test('Set.difference', () {
      expect(
          CopyOnWriteSet<int>({1, 2, 3}).difference(CopyOnWriteSet<int>({1})),
          [2, 3]);
    });

    test('Set.intersection', () {
      expect(
          CopyOnWriteSet<int>({1, 2, 3}).intersection(CopyOnWriteSet<int>({1})),
          {1});
    });

    test('Set.lookup', () {
      expect(CopyOnWriteSet<int>({1, 2, 3}).lookup(1), 1);
      expect(CopyOnWriteSet<int>({1, 2, 3}).lookup(4), isNull);
    });

    test('Set.union', () {
      expect(CopyOnWriteSet<int>({1, 2, 3}).union(CopyOnWriteSet<int>({4})),
          [1, 2, 3, 4]);
    });

    // Iterable.

    test('Iterable.map', () {
      expect(CopyOnWriteSet<int>({1}).map((x) => x + 1), [2]);
    });

    test('Iterable.where', () {
      expect(CopyOnWriteSet<int>({1, 2}).where((x) => x > 1), [2]);
    });

    test('Iterable.expand', () {
      expect(
          CopyOnWriteSet<int>({1, 2}).expand((x) => [x, x + 1]), [1, 2, 2, 3]);
    });

    test('Iterable.contains', () {
      expect(CopyOnWriteSet<int>({1}).contains(1), isTrue);
      expect(CopyOnWriteSet<int>({1}).contains(2), isFalse);
    });

    test('Iterable.forEach', () {
      var value = 1;
      // ignore: avoid_function_literals_in_foreach_calls
      CopyOnWriteSet<int>({2}).forEach((x) => value = x);
      expect(value, 2);
    });

    test('Iterable.reduce', () {
      expect(CopyOnWriteSet<int>({1, 2}).reduce((x, y) => x + y), 3);
    });

    test('Iterable.fold', () {
      expect(
          CopyOnWriteSet<int>({1, 2})
              .fold('', (x, y) => x.toString() + y.toString()),
          '12');
    });

    test('Iterable.followedBy', () {
      expect(
          CopyOnWriteSet<int>({1, 2}).followedBy(CopyOnWriteSet<int>({3, 4})),
          [1, 2, 3, 4]);
    });

    test('Iterable.every', () {
      expect(CopyOnWriteSet<int>({1, 2}).every((x) => x == 1), isFalse);
      expect(
          CopyOnWriteSet<int>({1, 2}).every((x) => x == 1 || x == 2), isTrue);
    });

    test('Iterable.join', () {
      expect(CopyOnWriteSet<int>({1, 2}).join(','), '1,2');
    });

    test('Iterable.any', () {
      expect(CopyOnWriteSet<int>({1, 2}).any((x) => x == 0), isFalse);
      expect(CopyOnWriteSet<int>({1, 2}).any((x) => x == 1), isTrue);
    });

    test('Iterable.toSet', () {
      expect(
          CopyOnWriteSet<int>({1, 2}).toSet(), const TypeMatcher<Set<int>>());
      expect(CopyOnWriteSet<int>({1, 2}).toSet(), {1, 2});
    });

    test('Iterable.toList', () {
      expect(
          CopyOnWriteSet<int>({1, 2}).toList(), const TypeMatcher<List<int>>());
      expect(CopyOnWriteSet<int>({1, 2}).toList(), {1, 2});
    });

    test('Iterable.take', () {
      expect(CopyOnWriteSet<int>({1, 2}).take(1), {1});
    });

    test('Iterable.takeWhile', () {
      expect(CopyOnWriteSet<int>({1, 2}).takeWhile((x) => x == 1), {1});
    });

    test('Iterable.skip', () {
      expect(CopyOnWriteSet<int>({1, 2}).skip(1), [2]);
    });

    test('Iterable.skipWhile', () {
      expect(CopyOnWriteSet<int>({1, 2}).skipWhile((x) => x == 1), [2]);
    });

    test('Iterable.first', () {
      expect(CopyOnWriteSet<int>({1, 2}).first, 1);
    });

    test('Iterable.last', () {
      expect(CopyOnWriteSet<int>({1, 2}).last, 2);
    });

    test('Iterable.last', () {
      expect(() => CopyOnWriteSet<int>({1, 2}).single, throwsA(anything));
      expect(CopyOnWriteSet<int>({1}).single, 1);
    });

    test('Iterable.firstWhere', () {
      expect(CopyOnWriteSet<int>({1, 2}).firstWhere((x) => x == 2), 2);
      expect(() => CopyOnWriteSet<int>({1, 2}).firstWhere((x) => x == 3),
          throwsA(anything));
      expect(
          CopyOnWriteSet<int>({1, 2})
              .firstWhere((x) => x == 3, orElse: () => 4),
          4);
    });

    test('Iterable.lastWhere', () {
      expect(CopyOnWriteSet<int>({1, 2}).lastWhere((x) => x == 2), 2);
      expect(() => CopyOnWriteSet<int>({1, 2}).lastWhere((x) => x == 3),
          throwsA(anything));
      expect(
          CopyOnWriteSet<int>({1, 2}).lastWhere((x) => x == 3, orElse: () => 4),
          4);
    });

    test('Iterable.singleWhere', () {
      expect(CopyOnWriteSet<int>({1, 2}).singleWhere((x) => x == 2), 2);
      expect(() => CopyOnWriteSet<int>({1, 2}).singleWhere((x) => x == 3),
          throwsA(anything));
      expect(() => CopyOnWriteSet<int>({1, 2}).singleWhere((x) => true),
          throwsA(anything));
      expect(
          CopyOnWriteSet<int>({1, 2})
              .singleWhere((x) => false, orElse: () => 7),
          7);
    });

    test('Iterable.elementAt', () {
      expect(CopyOnWriteSet<int>({1, 2}).elementAt(0), 1);
    });

    test('Iterable.cast', () {
      expect(CopyOnWriteSet<int>({1, 2}).cast<Object>(),
          const TypeMatcher<Iterable<Object>>());
      expect(CopyOnWriteSet<int>({1, 2}).cast<Object>(), {1, 2});
    });

    test('Iterable.whereType', () {
      expect(
          CopyOnWriteSet<Object>({1, 'two', 3}).whereType<String>(), ['two']);
    });
  });
}
