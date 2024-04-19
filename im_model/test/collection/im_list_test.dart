import 'package:im_model/im_model.dart';
import 'package:test/test.dart';

void main() {
  group('ImList', () {
    test('mut getter', () {
      final initial = ['foo', 'bar'];
      final coll = ImList(initial);
      final mutColl = coll.mut..add('baz');
      initial.add('baz');

      expect(coll.length, 2);
      expect(mutColl.length, 3);
      expect(mutColl[2], 'baz');
    });

    test('immut getter', () {
      final coll = ['foo', 'bar'].immut;
      expect(coll.runtimeType, ImList<String>);
    });

    test('empty constructor', () {
      expect(ImList<int>.empty().length, 0);
    });

    test('does not implement List', () {
      expect(ImList<int>() is List, isFalse);
    });

    test('List[]', () {
      expect(ImList<int>([1, 2, 3])[1], 2);
    });

    test('List+', () {
      expect(
        ImList<int>([1, 2, 3]) + ImList<int>([4, 5, 6]),
        [1, 2, 3, 4, 5, 6],
      );
    });

    test('List.length', () {
      expect(ImList<int>([1, 2, 3]).length, 3);
    });

    test('List.reversed', () {
      expect(ImList<int>([1, 2, 3]).reversed, [3, 2, 1]);
    });

    test('List.indexOf', () {
      expect(ImList<int>([1, 2, 3]).indexOf(2), 1);
      expect(ImList<int>([1, 2, 3]).indexOf(2, 2), -1);
    });

    test('List.lastIndexOf', () {
      expect(ImList<int>([1, 2, 3]).lastIndexOf(2), 1);
      expect(ImList<int>([1, 2, 3]).lastIndexOf(2, 0), -1);
    });

    test('List.sublist', () {
      expect(ImList<int>([1, 2, 3]).sublist(1), [2, 3]);
      expect(ImList<int>([1, 2, 3]).sublist(1, 2), [2]);
    });

    test('List.getRange', () {
      expect(ImList<int>([1, 2, 3]).getRange(1, 3), [2, 3]);
    });

    test('List.asMap', () {
      expect(ImList<int>([1, 2, 3]).asMap(), {0: 1, 1: 2, 2: 3});
    });

    test('List.indexWhere', () {
      expect(ImList<int>([1, 2, 3, 2]).indexWhere((x) => x == 2), 1);
      expect(ImList<int>([1, 2, 3, 2]).indexWhere((x) => x == 2, 2), 3);
    });

    test('List.lastIndexWhere', () {
      expect(ImList<int>([1, 2, 3, 2]).lastIndexWhere((x) => x == 2), 3);
      expect(ImList<int>([1, 2, 3, 2]).lastIndexWhere((x) => x == 2, 2), 1);
    });

    // Iterable.

    test('implements Iterable', () {
      expect(ImList<int>(), const TypeMatcher<Iterable<int>>());
    });

    test('Iterable.isEmpty', () {
      expect(ImList<int>.empty().isEmpty, true);
    });

    test('Iterable.isNotEmpty', () {
      expect(ImList<int>.empty().isNotEmpty, false);
    });

    test('Iterable<E>', () {
      expect(ImList<int>(), const TypeMatcher<Iterable<int>>());
      expect(ImList<int>(), isNot(const TypeMatcher<Iterable<String>>()));
    });

    test('Iterable.map', () {
      expect(ImList<int>([1]).map((x) => x + 1), [2]);
    });

    test('Iterable.where', () {
      expect(ImList<int>([1, 2]).where((x) => x > 1), [2]);
    });

    test('Iterable.expand', () {
      expect(ImList<int>([1, 2]).expand((x) => [x, x + 1]), [1, 2, 2, 3]);
    });

    test('Iterable.contains', () {
      expect(ImList<int>([1]).contains(1), isTrue);
      expect(ImList<int>([1]).contains(2), isFalse);
    });

    test('Iterable.forEach', () {
      var value = 1;
      // ignore: avoid_function_literals_in_foreach_calls
      ImList<int>([2]).forEach((x) => value = x);
      expect(value, 2);
    });

    test('Iterable.reduce', () {
      expect(ImList<int>([1, 2]).reduce((x, y) => x + y), 3);
    });

    test('Iterable.fold', () {
      expect(
          ImList<int>([1, 2]).fold('', (x, y) => x.toString() + y.toString()),
          '12');
    });

    test('Iterable.followedBy', () {
      expect(ImList<int>([1, 2]).followedBy(ImList<int>([3, 4])), [1, 2, 3, 4]);
    });

    test('Iterable.every', () {
      expect(ImList<int>([1, 2]).every((x) => x == 1), isFalse);
      expect(ImList<int>([1, 2]).every((x) => x == 1 || x == 2), isTrue);
    });

    test('Iterable.join', () {
      expect(ImList<int>([1, 2]).join(','), '1,2');
    });

    test('Iterable.any', () {
      expect(ImList<int>([1, 2]).any((x) => x == 0), isFalse);
      expect(ImList<int>([1, 2]).any((x) => x == 1), isTrue);
    });

    test('Iterable.toSet', () {
      expect(ImList<int>([1, 2]).toSet(), const TypeMatcher<Set<int>>());
      expect(ImList<int>([1, 2]).toSet(), [1, 2]);
    });

    test('Iterable.take', () {
      expect(ImList<int>([1, 2]).take(1), [1]);
    });

    test('Iterable.takeWhile', () {
      expect(ImList<int>([1, 2]).takeWhile((x) => x == 1), [1]);
    });

    test('Iterable.skip', () {
      expect(ImList<int>([1, 2]).skip(1), [2]);
    });

    test('Iterable.skipWhile', () {
      expect(ImList<int>([1, 2]).skipWhile((x) => x == 1), [2]);
    });

    test('Iterable.first', () {
      expect(ImList<int>([1, 2]).first, 1);
    });

    test('Iterable.last', () {
      expect(ImList<int>([1, 2]).last, 2);
    });

    test('Iterable.last', () {
      expect(() => ImList<int>([1, 2]).single, throwsA(anything));
      expect(ImList<int>([1]).single, 1);
    });

    test('Iterable.firstWhere', () {
      expect(ImList<int>([1, 2]).firstWhere((x) => x == 2), 2);
      expect(() => ImList<int>([1, 2]).firstWhere((x) => x == 3),
          throwsA(anything));
      expect(ImList<int>([1, 2]).firstWhere((x) => x == 3, orElse: () => 4), 4);
    });

    test('Iterable.lastWhere', () {
      expect(ImList<int>([1, 2]).lastWhere((x) => x == 2), 2);
      expect(() => ImList<int>([1, 2]).lastWhere((x) => x == 3),
          throwsA(anything));
      expect(ImList<int>([1, 2]).lastWhere((x) => x == 3, orElse: () => 4), 4);
    });

    test('Iterable.singleWhere', () {
      expect(ImList<int>([1, 2]).singleWhere((x) => x == 2), 2);
      expect(() => ImList<int>([1, 2]).singleWhere((x) => x == 3),
          throwsA(anything));
      expect(() => ImList<int>([1, 2]).singleWhere((x) => true),
          throwsA(anything));
      expect(ImList<int>([1, 2]).singleWhere((x) => x == 2), 2);
      expect(ImList<int>([1, 2]).singleWhere((x) => false, orElse: () => 7), 7);
    });

    test('Iterable.elementAt', () {
      expect(ImList<int>([1, 2]).elementAt(0), 1);
    });

    test('Iterable.cast', () {
      expect(ImList<int>([1, 2]).cast<Object>(),
          const TypeMatcher<Iterable<Object>>());
      expect(ImList<int>([1, 2]).cast<Object>(), [1, 2]);
    });

    test('Iterable.whereType', () {
      expect(ImList<Object>([1, 'two', 3]).whereType<String>(), ['two']);
    });
  });
}
