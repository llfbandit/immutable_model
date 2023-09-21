import 'dart:math';

import 'package:im_model/src/collection/internal/copy_on_write_list.dart';
import 'package:test/test.dart';

void main() {
  group('CopyOnWriteList', () {
    test('has toString equal to List.toString', () {
      var list = <int>[1, 2, 3];
      expect(CopyOnWriteList(list, false).toString(), list.toString());
    });

    test('List[]', () {
      expect(CopyOnWriteList([1, 2, 3], false)[1], 2);
    });

    test('List+', () {
      expect(
        CopyOnWriteList([1, 2, 3], false) + CopyOnWriteList([4, 5, 6], false),
        [1, 2, 3, 4, 5, 6],
      );
    });

    test('List.length', () {
      expect(CopyOnWriteList([1, 2, 3], false).length, 3);
    });

    test('List.reversed', () {
      expect(CopyOnWriteList([1, 2, 3], false).reversed, [3, 2, 1]);
    });

    test('List.indexOf', () {
      expect(CopyOnWriteList([1, 2, 3], false).indexOf(2), 1);
      expect(CopyOnWriteList([1, 2, 3], false).indexOf(2, 2), -1);
    });

    test('List.lastIndexOf', () {
      expect(CopyOnWriteList([1, 2, 3], false).lastIndexOf(2), 1);
      expect(CopyOnWriteList([1, 2, 3], false).lastIndexOf(2, 0), -1);
    });

    test('List.sublist', () {
      expect(CopyOnWriteList([1, 2, 3], false).sublist(1), [2, 3]);
      expect(CopyOnWriteList([1, 2, 3], false).sublist(1, 2), [2]);
    });

    test('List.getRange', () {
      expect(CopyOnWriteList([1, 2, 3], false).getRange(1, 3), [2, 3]);
    });

    test('List.asMap', () {
      expect(CopyOnWriteList([1, 2, 3], false).asMap(), {0: 1, 1: 2, 2: 3});
    });

    test('List.indexWhere', () {
      expect(CopyOnWriteList([1, 2, 3, 2], false).indexWhere((x) => x == 2), 1);
      expect(
          CopyOnWriteList([1, 2, 3, 2], false).indexWhere((x) => x == 2, 2), 3);
    });

    test('List.lastIndexWhere', () {
      expect(CopyOnWriteList([1, 2, 3, 2], false).lastIndexWhere((x) => x == 2),
          3);
      expect(
          CopyOnWriteList([1, 2, 3, 2], false).lastIndexWhere((x) => x == 2, 2),
          1);
    });

    test('List.add', () {
      expect((CopyOnWriteList<int>([], true)..add(1)), [1]);
    });

    test('List.addAll', () {
      expect((CopyOnWriteList<int>([], true)..addAll([1, 2])), [1, 2]);
    });

    test('List.reversed that updates in place', () {
      expect(CopyOnWriteList<int>([1, 2], false).reversed, [2, 1]);
    });

    test('List.sort', () {
      expect(
          (CopyOnWriteList<int>([1, 2], false)
            ..sort((int x, int y) => x < y ? 1 : -1)),
          [2, 1]);
    });

    test('List.shuffle', () {
      expect(
          (CopyOnWriteList<int>([1, 2], false)..shuffle(_AlwaysZeroRandom())),
          [2, 1]);
    });

    test('List.clear', () {
      expect((CopyOnWriteList<int>([1, 2], true)..clear()), <int>[]);
    });

    test('List.insert', () {
      expect((CopyOnWriteList<int>([1, 2], true)..insert(1, 3)), [1, 3, 2]);
    });

    test('List.insertAll', () {
      expect((CopyOnWriteList<int>([1, 2], true)..insertAll(1, [3, 4])),
          [1, 3, 4, 2]);
    });

    test('List.setAll', () {
      expect((CopyOnWriteList<int>([1, 2], true)..setAll(0, [3, 4])), [3, 4]);
    });

    test('List.remove', () {
      expect(CopyOnWriteList<int>([1, 2], true).remove(2), true);
      expect(CopyOnWriteList<int>([1, 2], true).remove(3), false);
      expect((CopyOnWriteList<int>([1, 2], true)..remove(2)), [1]);
    });

    test('List.removeAt', () {
      expect(CopyOnWriteList<int>([1, 2], true).removeAt(1), 2);
      expect((CopyOnWriteList<int>([1, 2], true)..removeAt(1)), [1]);
    });

    test('List.removeLast', () {
      expect(CopyOnWriteList<int>([1, 2], true).removeLast(), 2);
      expect((CopyOnWriteList<int>([1, 2], true)..removeLast()), [1]);
    });

    test('List.removeWhere', () {
      expect((CopyOnWriteList<int>([1, 2], true)..removeWhere((x) => x == 1)),
          [2]);
    });

    test('List.retainWhere', () {
      expect((CopyOnWriteList<int>([1, 2], true)..retainWhere((x) => x == 1)),
          [1]);
    });

    // Iterable.

    test('Iterable.isEmpty', () {
      expect(CopyOnWriteList(<int>[], false).isEmpty, true);
    });

    test('Iterable.isNotEmpty', () {
      expect(CopyOnWriteList(<int>[], false).isNotEmpty, false);
    });

    test('Iterable<E>', () {
      expect(
          CopyOnWriteList(<int>[], false), const TypeMatcher<Iterable<int>>());
      expect(CopyOnWriteList(<int>[], false),
          isNot(const TypeMatcher<Iterable<String>>()));
    });

    test('Iterable.map', () {
      expect(CopyOnWriteList([1], false).map((x) => x + 1), [2]);
    });

    test('Iterable.where', () {
      expect(CopyOnWriteList([1, 2], false).where((x) => x > 1), [2]);
    });

    test('Iterable.expand', () {
      expect(CopyOnWriteList([1, 2], false).expand((x) => [x, x + 1]),
          [1, 2, 2, 3]);
    });

    test('Iterable.contains', () {
      expect(CopyOnWriteList([1], false).contains(1), isTrue);
      expect(CopyOnWriteList([1], false).contains(2), isFalse);
    });

    test('Iterable.forEach', () {
      var value = 1;
      // ignore: avoid_function_literals_in_foreach_calls
      CopyOnWriteList([2], false).forEach((x) => value = x);
      expect(value, 2);
    });

    test('Iterable.reduce', () {
      expect(CopyOnWriteList([1, 2], false).reduce((x, y) => x + y), 3);
    });

    test('Iterable.fold', () {
      expect(
          CopyOnWriteList([1, 2], false)
              .fold('', (x, y) => x.toString() + y.toString()),
          '12');
    });

    test('Iterable.followedBy', () {
      expect(
        CopyOnWriteList([1, 2], false).followedBy(
          CopyOnWriteList([3, 4], false),
        ),
        [1, 2, 3, 4],
      );
    });

    test('Iterable.every', () {
      expect(CopyOnWriteList([1, 2], false).every((x) => x == 1), isFalse);
      expect(CopyOnWriteList([1, 2], false).every((x) => x == 1 || x == 2),
          isTrue);
    });

    test('Iterable.join', () {
      expect(CopyOnWriteList([1, 2], false).join(','), '1,2');
    });

    test('Iterable.any', () {
      expect(CopyOnWriteList([1, 2], false).any((x) => x == 0), isFalse);
      expect(CopyOnWriteList([1, 2], false).any((x) => x == 1), isTrue);
    });

    test('Iterable.toSet', () {
      expect(CopyOnWriteList([1, 2], false).toSet(),
          const TypeMatcher<Set<int>>());
      expect(CopyOnWriteList([1, 2], false).toSet(), [1, 2]);
    });

    test('Iterable.take', () {
      expect(CopyOnWriteList([1, 2], false).take(1), [1]);
    });

    test('Iterable.takeWhile', () {
      expect(CopyOnWriteList([1, 2], false).takeWhile((x) => x == 1), [1]);
    });

    test('Iterable.skip', () {
      expect(CopyOnWriteList([1, 2], false).skip(1), [2]);
    });

    test('Iterable.skipWhile', () {
      expect(CopyOnWriteList([1, 2], false).skipWhile((x) => x == 1), [2]);
    });

    test('Iterable.first', () {
      expect(CopyOnWriteList([1, 2], false).first, 1);
    });

    test('Iterable.last', () {
      expect(CopyOnWriteList([1, 2], false).last, 2);
    });

    test('Iterable.firstWhere', () {
      expect(CopyOnWriteList([1, 2], false).firstWhere((x) => x == 2), 2);
      expect(() => CopyOnWriteList([1, 2], false).firstWhere((x) => x == 3),
          throwsA(anything));
      expect(
          CopyOnWriteList([1, 2], false)
              .firstWhere((x) => x == 3, orElse: () => 4),
          4);
    });

    test('Iterable.lastWhere', () {
      expect(CopyOnWriteList([1, 2], false).lastWhere((x) => x == 2), 2);
      expect(() => CopyOnWriteList([1, 2], false).lastWhere((x) => x == 3),
          throwsA(anything));
      expect(
          CopyOnWriteList([1, 2], false)
              .lastWhere((x) => x == 3, orElse: () => 4),
          4);
    });

    test('Iterable.singleWhere', () {
      expect(CopyOnWriteList([1, 2], false).singleWhere((x) => x == 2), 2);
      expect(() => CopyOnWriteList([1, 2], false).singleWhere((x) => x == 3),
          throwsA(anything));
      expect(() => CopyOnWriteList([1, 2], false).singleWhere((x) => true),
          throwsA(anything));
      expect(CopyOnWriteList([1, 2], false).singleWhere((x) => x == 2), 2);
      expect(
          CopyOnWriteList([1, 2], false)
              .singleWhere((x) => false, orElse: () => 7),
          7);
    });

    test('Iterable.elementAt', () {
      expect(CopyOnWriteList([1, 2], false).elementAt(0), 1);
    });

    test('Iterable.cast', () {
      expect(CopyOnWriteList([1, 2], false).cast<Object>(),
          const TypeMatcher<Iterable<Object>>());
      expect(CopyOnWriteList([1, 2], false).cast<Object>(), [1, 2]);
    });

    test('Iterable.whereType', () {
      expect(
          CopyOnWriteList([1, 'two', 3], false).whereType<String>(), ['two']);
    });
  });
}

class _AlwaysZeroRandom implements Random {
  @override
  bool nextBool() => false;

  @override
  double nextDouble() => 0.0;

  @override
  int nextInt(int max) => 0;
}
