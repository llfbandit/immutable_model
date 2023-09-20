// ignore_for_file: deprecated_member_use_from_same_package

import 'package:immutable_model/immutable_model.dart';
import 'package:test/test.dart';

void main() {
  group('ImList', () {
    test('mut getter', () {
      final coll = ImList(['foo', 'bar']);
      final mutColl = coll.mut..add('baz');

      expect(coll.length, 2);
      expect(mutColl.length, 3);
      expect(mutColl[2], 'baz');
    });

    test('immut getter', () {
      final coll = ['foo'].immut;
      expect(() => coll.add('baz'), throwsUnsupportedError);
    });

    group('Forward methods', () {
      test('length', () {
        final coll = ImList(['foo', 'bar']);
        expect(coll.length, 2);

        expect(const ImList<int>.empty().length, 0);
      });

      test('index', () {
        final coll = ImList(['foo', 'bar']);
        expect(coll[0], 'foo');
        expect(coll[1], 'bar');
      });
    });

    group('Deprecated methods', () {
      test('clear', () {
        final coll = ImList(['foo', 'bar']);
        expect(() => coll.clear(), throwsUnsupportedError);
      });

      test('add', () {
        final coll = ImList(['foo', 'bar']);
        expect(() => coll.add('baz'), throwsUnsupportedError);
      });

      test('addAll', () {
        final coll = ImList(['foo', 'bar']);
        expect(() => coll.addAll(['baz']), throwsUnsupportedError);
      });

      test('remove', () {
        final coll = ImList(['foo', 'bar']);
        expect(() => coll.remove('foo'), throwsUnsupportedError);
      });

      test('removeAt', () {
        final coll = ImList(['foo', 'bar']);
        expect(() => coll.removeAt(0), throwsUnsupportedError);
      });

      test('removeLast', () {
        final coll = ImList(['foo', 'bar']);
        expect(() => coll.removeLast(), throwsUnsupportedError);
      });

      test('removeRange', () {
        final coll = ImList(['foo', 'bar']);
        expect(() => coll.removeRange(0, 0), throwsUnsupportedError);
      });

      test('removeWhere', () {
        final coll = ImList(['foo', 'bar']);
        expect(() => coll.removeWhere((e) => true), throwsUnsupportedError);
      });

      test('replaceRange', () {
        final coll = ImList(['foo', 'bar']);
        expect(() => coll.replaceRange(0, 0, ['baz']), throwsUnsupportedError);
      });

      test('retainWhere', () {
        final coll = ImList(['foo', 'bar']);
        expect(() => coll.retainWhere((e) => true), throwsUnsupportedError);
      });

      test('setAll', () {
        final coll = ImList(['foo', 'bar']);
        expect(() => coll.setAll(0, ['baz']), throwsUnsupportedError);
      });

      test('setRange', () {
        final coll = ImList(['foo', 'bar']);
        expect(() => coll.setRange(0, 0, ['baz']), throwsUnsupportedError);
      });

      test('length setter', () {
        final coll = ImList(['foo', 'bar']);
        expect(() => coll.length = 0, throwsUnsupportedError);
      });

      test('index setter', () {
        final coll = ImList(['foo', 'bar']);
        expect(() => coll[0] = 'baz', throwsUnsupportedError);
      });

      test('insert', () {
        final coll = ImList(['foo', 'bar']);
        expect(() => coll.insert(0, 'baz'), throwsUnsupportedError);
      });

      test('insertAll', () {
        final coll = ImList(['foo', 'bar']);
        expect(() => coll.insertAll(0, ['baz']), throwsUnsupportedError);
      });

      test('fillRange', () {
        final coll = ImList(['foo', 'bar']);
        expect(() => coll.fillRange(0, 0, 'baz'), throwsUnsupportedError);
      });

      test('sort', () {
        final coll = ImList(['foo', 'bar']);
        expect(() => coll.sort((a, b) => 0), throwsUnsupportedError);
      });

      test('shuffle', () {
        final coll = ImList(['foo', 'bar']);
        expect(() => coll.shuffle(null), throwsUnsupportedError);
      });
    });
  });

  group('ImMap', () {
    test('mut getter', () {
      final coll = ImMap({'foo': 'bar'});
      final mutColl = coll.mut;
      mutColl['baz'] = 'foo';

      expect(coll.length, 1);
      expect(mutColl.length, 2);
      expect(mutColl['baz'], 'foo');
    });

    test('immut getter', () {
      final coll = {'foo': 'bar'}.immut;
      expect(() => coll['baz'] = 'foo', throwsUnsupportedError);
    });

    group('Forward methods', () {
      test('length', () {
        final coll = ImMap({'foo': 'bar'});
        expect(coll.length, 1);

        expect(const ImMap<int, int>.empty().length, 0);
      });

      test('index', () {
        final coll = ImMap({'foo': 'bar'});
        expect(coll['foo'], 'bar');
      });

      test('keys', () {
        final coll = ImMap({'foo': 'bar'});
        expect(coll.keys, ['foo']);
      });
    });

    group('Deprecated methods', () {
      test('add', () {
        final coll = ImMap({'foo': 'bar'});
        expect(() => coll['baz'] = 'foo', throwsUnsupportedError);
      });

      test('addAll', () {
        final coll = ImMap({'foo': 'bar'});
        expect(() => coll.addAll({'foo': 'bar'}), throwsUnsupportedError);
      });

      test('addEntries', () {
        final coll = ImMap({'foo': 'bar'});
        expect(() => coll.addEntries([]), throwsUnsupportedError);
      });

      test('clear', () {
        final coll = ImMap({'foo': 'bar'});
        expect(() => coll.clear(), throwsUnsupportedError);
      });

      test('putIfAbsent', () {
        final coll = ImMap({'foo': 'bar'});
        expect(
          () => coll.putIfAbsent('foo', () => 'foo'),
          throwsUnsupportedError,
        );
      });

      test('remove', () {
        final coll = ImMap({'foo': 'bar'});
        expect(() => coll.remove('foo'), throwsUnsupportedError);
      });

      test('removeWhere', () {
        final coll = ImMap({'foo': 'bar'});
        expect(() => coll.removeWhere((k, v) => true), throwsUnsupportedError);
      });

      test('update', () {
        final coll = ImMap({'foo': 'bar'});
        expect(() => coll.update('foo', (k) => ''), throwsUnsupportedError);
      });

      test('updateAll', () {
        final coll = ImMap({'foo': 'bar'});
        expect(() => coll.updateAll((k, v) => ''), throwsUnsupportedError);
      });
    });
  });

  group('ImSet', () {
    test('mut getter', () {
      final coll = ImSet({'foo', 'bar'});
      final mutColl = coll.mut..add('baz');

      expect(coll.length, 2);
      expect(mutColl.length, 3);
      expect(mutColl.lookup('baz'), 'baz');
    });

    test('immut getter', () {
      final coll = {'foo'}.immut;
      expect(() => coll.add('baz'), throwsUnsupportedError);
    });

    group('Forward methods', () {
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
    });

    group('Deprecated methods', () {
      test('add', () {
        final coll = ImSet({'foo', 'bar'});
        expect(() => coll.add('baz'), throwsUnsupportedError);
      });

      test('addAll', () {
        final coll = ImSet({'foo', 'bar'});
        expect(() => coll.addAll({'baz'}), throwsUnsupportedError);
      });

      test('clear', () {
        final coll = ImSet({'foo', 'bar'});
        expect(() => coll.clear(), throwsUnsupportedError);
      });

      test('remove', () {
        final coll = ImSet({'foo', 'bar'});
        expect(() => coll.remove('foo'), throwsUnsupportedError);
      });

      test('removeAll', () {
        final coll = ImSet({'foo', 'bar'});
        expect(() => coll.removeAll(['foo']), throwsUnsupportedError);
      });

      test('removeWhere', () {
        final coll = ImSet({'foo', 'bar'});
        expect(() => coll.removeWhere((v) => true), throwsUnsupportedError);
      });

      test('retainAll', () {
        final coll = ImSet({'foo', 'bar'});
        expect(() => coll.retainAll(['foo']), throwsUnsupportedError);
      });

      test('retainWhere', () {
        final coll = ImSet({'foo', 'bar'});
        expect(() => coll.retainWhere((e) => true), throwsUnsupportedError);
      });
    });
  });
}
