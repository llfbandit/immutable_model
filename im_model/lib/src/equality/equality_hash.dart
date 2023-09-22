/// Jenkins Hash function (1 to 1)
/// https://en.wikipedia.org/wiki/Jenkins_hash_function
class Hash {
  const Hash();

  @pragma("vm:prefer-inline")
  int hash(Object obj, List<Object?> props) {
    final hash = _finish(props.fold(0, (h, i) => _combine(h, i.hashCode)));

    return obj.runtimeType.hashCode ^ hash;
  }

  /// Generates a hash code for multiple [objects] in iterable.
  int hashIterable(Iterable<dynamic> it) {
    return _finish(it.fold(0, (h, i) => _combine(h, i.hashCode)));
  }

  /// Generates a hash code for two objects.
  int hash2(dynamic a, dynamic b) {
    return _finish(_combine(_combine(0, a.hashCode), b.hashCode));
  }

  int _combine(int hash, int value) {
    hash = 0x1fffffff & (hash + value);
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  int _finish(int hash) {
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}
