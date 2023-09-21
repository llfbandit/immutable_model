import 'package:im_model/src/collection/internal/copy_on_write_map.dart';
import 'package:test/test.dart';

void main() {
  group('CopyOnWriteMap', () {
    test('has toString equal to Map.toString', () {
      var map = <int, String>{1: 'one', 2: 'two', 3: 'three'};
      expect(CopyOnWriteMap(map).toString(), map.toString());
    });

    test('Map[]', () {
      expect(CopyOnWriteMap<int, String>({1: '1', 2: '2', 3: '3'})[2], '2');
    });

    test('Map.length', () {
      expect(CopyOnWriteMap<int, String>({1: '1', 2: '2', 3: '3'}).length, 3);
    });

    test('Map.containsKey', () {
      expect(
          CopyOnWriteMap<int, String>({1: '1', 3: '3'}).containsKey(3), isTrue);
      expect(CopyOnWriteMap<int, String>({1: '1', 3: '3'}).containsKey(4),
          isFalse);
    });

    test('Map.containsValue', () {
      expect(CopyOnWriteMap<int, String>({1: '1', 3: '3'}).containsValue('3'),
          isTrue);
      expect(CopyOnWriteMap<int, String>({1: '1', 3: '3'}).containsValue('4'),
          isFalse);
    });

    test('Map.forEach', () {
      var totalKeys = 0;
      var concatenatedValues = '';
      CopyOnWriteMap<int, String>({1: '1', 2: '2', 3: '3'})
          .forEach((key, value) {
        totalKeys += key;
        concatenatedValues += value;
      });

      expect(totalKeys, 6);
      expect(concatenatedValues, '123');
    });

    test('Map.keys', () {
      expect(CopyOnWriteMap<int, String>({1: '1', 2: '2', 3: '3'}).keys,
          [1, 2, 3]);
    });

    test('Map.values', () {
      expect(
        CopyOnWriteMap<int, String>({1: '1', 2: '2', 3: '3'}).values,
        ['1', '2', '3'],
      );
    });

    test('Map.entries', () {
      var map = CopyOnWriteMap<int, String>({1: '1', 2: '2', 3: '3'});
      expect(CopyOnWriteMap<int, String>(Map.fromEntries(map.entries)), map);
    });

    test('Map[]', () {
      var map = CopyOnWriteMap<int, String>({1: '1', 2: '2'});
      map[1] = '${map[1]!}*';
      map[2] = '${map[2]!}**';
      expect(map, {1: '1*', 2: '2**'});
    });

    test('Map[]=', () {
      expect(
          (CopyOnWriteMap<int, String>({1: '1'})..[2] = '2'), {1: '1', 2: '2'});
    });

    test('Map.length', () {
      expect(CopyOnWriteMap<int, String>({1: '1', 2: '2'}).length, 2);

      expect(CopyOnWriteMap<int, String>({}).length, 0);
    });

    test('Map.isEmpty', () {
      expect(CopyOnWriteMap<int, String>({1: '1', 2: '2'}).isEmpty, false);
      expect(CopyOnWriteMap<int, String>({}).isEmpty, true);
    });

    test('Map.isNotEmpty', () {
      expect(CopyOnWriteMap<int, String>({1: '1', 2: '2'}).isNotEmpty, true);

      expect(CopyOnWriteMap<int, String>({}).isNotEmpty, false);
    });

    test('Map.putIfAbsent', () {
      expect(
          CopyOnWriteMap<int, String>({1: '1'}).putIfAbsent(2, () => '2'), '2');
    });

    test('Map.addAll', () {
      expect((CopyOnWriteMap<int, String>({})..addAll({1: '1', 2: '2'})),
          {1: '1', 2: '2'});
    });

    test('Map.remove', () {
      expect(CopyOnWriteMap<int, String>({1: '1', 2: '2'}).remove(2), '2');
      expect(CopyOnWriteMap<int, String>({1: '1', 2: '2'}).remove(3), null);
      expect(
          (CopyOnWriteMap<int, String>({1: '1', 2: '2'})..remove(2)), {1: '1'});
    });

    test('Map.removeWhere', () {
      expect(
          (CopyOnWriteMap<int, String>({1: '1', 2: '2'})
            ..removeWhere((k, v) => k == 2)),
          {1: '1'});
      expect(
          (CopyOnWriteMap<int, String>({1: '1', 2: '2'})
            ..removeWhere((k, v) => v == '2')),
          {1: '1'});
    });

    test('Map.clear', () {
      expect((CopyOnWriteMap<int, String>({1: '1', 2: '2'})..clear()),
          <int, String>{});
    });

    test('Map.update', () {
      expect(
          (CopyOnWriteMap<int, String>({1: '1', 2: '2'})
            ..update(1, (v) => '${v}1', ifAbsent: () => '7')),
          {1: '11', 2: '2'});
      expect(
          (CopyOnWriteMap<int, String>({1: '1', 2: '2'})
            ..update(7, (v) => '${v}1', ifAbsent: () => '7')),
          {1: '1', 2: '2', 7: '7'});
    });

    test('Map.updateAll', () {
      expect(
          (CopyOnWriteMap<int, String>({1: '1', 2: '2'})
            ..updateAll((k, v) => v + k.toString())),
          {1: '11', 2: '22'});
    });
  });
}
