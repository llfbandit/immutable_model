import 'package:collection/collection.dart';

const _dce = DeepCollectionEquality();

/// Jenkins Hash function (1 to 1)
/// https://en.wikipedia.org/wiki/Jenkins_hash_function
class Hash {
  const Hash();

  static int _add(int newHash, Object? o) {
    var hash = (newHash + o.hashCode) & 0x7fffffff;
    hash = (hash + (hash << 10)) & 0x7fffffff;
    return hash ^ (hash >> 6);
  }

  static int _finish(int newHash) {
    var hash = (newHash + (newHash << 3)) & 0x7fffffff;
    hash ^= hash >> 11;
    return (hash + (hash << 15)) & 0x7fffffff;
  }

  @pragma("vm:prefer-inline")
  int hash(Object obj, List<Object?> props) {
    var hash = 0;
    for (final hashParam in props) {
      if (hashParam is Set) {
        hash = _add(
          hash,
          const SetEquality(_dce).hash(hashParam) ^ hashParam.length,
        );
      } else if (hashParam is Map) {
        hash = _add(
          hash,
          const MapEquality(keys: _dce, values: _dce).hash(hashParam) ^
              hashParam.length,
        );
      } else if (hashParam is List) {
        hash = _add(
          hash,
          const ListEquality(_dce).hash(hashParam) ^ hashParam.length,
        );
      } else if (hashParam is Iterable) {
        hash = _add(
          hash,
          const IterableEquality(_dce).hash(hashParam) ^ hashParam.length,
        );
      } else {
        hash = _add(hash, _dce.hash(hashParam));
      }
    }

    return obj.runtimeType.hashCode ^ _finish(hash);
  }
}
