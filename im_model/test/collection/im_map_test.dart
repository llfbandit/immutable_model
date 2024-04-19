import 'package:im_model/src/collection/im_map.dart';
import 'package:test/test.dart';

void main() {
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
      expect(coll.runtimeType, ImMap<String, String>);
    });

    test('empty constructor', () {
      expect(ImMap<int, int>.empty().length, 0);
    });

    test('instantiates empty by default', () {
      var map = ImMap<int, String>();
      expect(map.isEmpty, isTrue);
      expect(map.isNotEmpty, isFalse);
    });

    test('allows <dynamic, dynamic>', () {
      ImMap<dynamic, dynamic>();
    });

    test('can be instantiated from Map', () {
      ImMap<int, String>({});
    });

    test('constructor takes inferred type', () {
      expect(ImMap({1: '1'}), const TypeMatcher<ImMap<int, String>>());
    });

    test('reports non-emptiness', () {
      var map = ImMap<int, String>({1: '1'});
      expect(map.isEmpty, isFalse);
      expect(map.isNotEmpty, isTrue);
    });

    test('can be instantiated from Map then converted back to equal Map', () {
      var mutableMap = {1: '1'};
      var map = ImMap<int, String>(mutableMap);
      expect(map.toMap(), mutableMap);
    });

    test('does not keep a mutable Map', () {
      var mutableMap = {1: '1'};
      var map = ImMap<int, String>(mutableMap);
      mutableMap.clear();
      expect(map.toMap(), {1: '1'});
    });

    test('can be converted to Map<K, V>', () {
      expect(
        ImMap<int, String>().toMap(),
        const TypeMatcher<Map<int, String>>(),
      );
      expect(
        ImMap<int, String>().toMap(),
        isNot(const TypeMatcher<Map<int, int>>()),
      );
      expect(
        ImMap<int, String>().toMap(),
        isNot(const TypeMatcher<Map<String, String>>()),
      );
    });

    test('can be converted to an UnmodifiableMapView', () {
      var immutableMap = ImMap<int, String>().asMap();
      expect(immutableMap, const TypeMatcher<Map<int, String>>());
      expect(() => immutableMap[1] = 'Hello', throwsUnsupportedError);
      expect(immutableMap, isEmpty);
    });

    test('nullable does not throw on null keys', () {
      expect(ImMap<int?, String>({null: '1'})[null], '1');
    });

    test('nullable does not throw on null values', () {
      expect(ImMap<int, String?>({1: null})[1], null);
    });

    test('hashes to same value for same contents', () {
      var map1 = ImMap<int, String>({1: '1', 2: '2', 3: '3'});
      var map2 = ImMap<int, String>({1: '1', 2: '2', 3: '3'});

      expect(map1.hashCode, map2.hashCode);
    });

    test('hashes to different value for different keys', () {
      var map1 = ImMap<int, String>({1: '1', 2: '2', 3: '3'});
      var map2 = ImMap<int, String>({1: '1', 2: '2', 4: '3'});

      expect(map1.hashCode, isNot(map2.hashCode));
    });

    test('hashes to different value for different values', () {
      var map1 = ImMap<int, String>({1: '1', 2: '2', 3: '3'});
      var map2 = ImMap<int, String>({1: '1', 2: '2', 3: '4'});

      expect(map1.hashCode, isNot(map2.hashCode));
    });

    test('compares equal to same instance', () {
      var map = ImMap<int, String>({1: '1', 2: '2', 3: '3'});
      expect(map == map, isTrue);
    });

    test('compares equal to same contents', () {
      var map1 = ImMap<int, String>({1: '1', 2: '2', 3: '3'});
      var map2 = ImMap<int, String>({1: '1', 2: '2', 3: '3'});
      expect(map1 == map2, isTrue);
    });

    test('compares not equal to different type', () {
      expect(
          // ignore: unrelated_type_equality_checks
          ImMap<int, String>({1: '1', 2: '2', 3: '3'}) == '',
          isFalse);
    });

    test('compares not equal to different length ImMap', () {
      expect(
          ImMap<int, String>({1: '1', 2: '2', 3: '3'}) ==
              ImMap<int, String>({1: '1', 2: '2'}),
          isFalse);
    });

    test('provides toString() for debugging', () {
      expect(ImMap<int, String>({1: '1', 2: '2', 3: '3'}).toString(),
          '{1: 1, 2: 2, 3: 3}');
    });

    test('preserves key order', () {
      expect(ImMap<int, String>({1: '1', 2: '2', 3: '3'}).keys, [1, 2, 3]);
      expect(ImMap<int, String>({3: '3', 2: '2', 1: '1'}).keys, [3, 2, 1]);
    });

    test('is not mutated when Map from toMap is mutated', () {
      var map = ImMap<int, String>();
      map.toMap()[1] = '1';
      expect(map.isEmpty, isTrue);
    });

    // Map.

    test('does not implement Map', () {
      expect(ImMap<int, String>() is Map, isFalse);
    });

    test('Map[]', () {
      expect(ImMap<int, String>({1: '1', 2: '2', 3: '3'})[2], '2');
    });

    test('Map.length', () {
      expect(ImMap<int, String>({1: '1', 2: '2', 3: '3'}).length, 3);
    });

    test('Map.containsKey', () {
      expect(ImMap<int, String>({1: '1', 3: '3'}).containsKey(3), isTrue);
      expect(ImMap<int, String>({1: '1', 3: '3'}).containsKey(4), isFalse);
    });

    test('Map.containsValue', () {
      expect(ImMap<int, String>({1: '1', 3: '3'}).containsValue('3'), isTrue);
      expect(ImMap<int, String>({1: '1', 3: '3'}).containsValue('4'), isFalse);
    });

    test('Map.forEach', () {
      var totalKeys = 0;
      var concatenatedValues = '';
      ImMap<int, String>({1: '1', 2: '2', 3: '3'}).forEach((key, value) {
        totalKeys += key;
        concatenatedValues += value;
      });

      expect(totalKeys, 6);
      expect(concatenatedValues, '123');
    });

    test('Map.keys', () {
      expect(ImMap<int, String>({1: '1', 2: '2', 3: '3'}).keys, [1, 2, 3]);
    });

    test('Map.values', () {
      expect(
        ImMap<int, String>({1: '1', 2: '2', 3: '3'}).values,
        ['1', '2', '3'],
      );
    });

    test('Map.entries', () {
      var map = ImMap<int, String>({1: '1', 2: '2', 3: '3'});
      expect(ImMap<int, String>(Map.fromEntries(map.entries)), map);
    });

    test('Map.map', () {
      expect(
          ImMap<int, String>({1: '1', 2: '2', 3: '3'})
              .map((key, value) => MapEntry(value, key))
              .asMap(),
          {'1': 1, '2': 2, '3': 3});
    });
  });
}
