import 'package:im_model/src/equality/equality_hash.dart';
import 'package:im_model/src/collection/internal/copy_on_write_map.dart';

/// A [Map] that is immutable.
class ImMap<K, V> {
  ImMap._(Map<K, V> other) : _inner = Map<K, V>.of(other);

  factory ImMap([Map<K, V>? other]) {
    if (other == null) {
      return ImMap._(<K, V>{});
    } else if (other is ImMap<K, V>) {
      return other as ImMap<K, V>;
    }

    return ImMap._(other);
  }

  ImMap.empty() : _inner = <K, V>{};

  final Map<K, V> _inner;
  int? _hashCode;

  /// Gets a mutable copy of the collection [ImMap.toMap]
  Map<K, V> get mut => toMap();

  /// Converts to a mutable [Map].
  ///
  /// Note that the implementation is efficient: it returns a copy-on-write
  /// wrapper around the data from this `ImMap`. So, if no mutations are
  /// made to the result, no copy is made.
  ///
  /// This allows efficient use of APIs that ask for a mutable collection
  /// but don't actually mutate it.
  Map<K, V> toMap() => CopyOnWriteMap<K, V>(_inner);

  /// Returns as an immutable map.
  ///
  /// Useful when producing or using APIs that need the [Map] interface. This
  /// differs from [toMap] where mutations are explicitly disallowed.
  Map<K, V> asMap() => Map<K, V>.unmodifiable(_inner);

  /// Deep hashCode.
  ///
  /// A `ImMap` is only equal to another with equal key/value
  /// pairs in any order. Then, the `hashCode` is guaranteed to be the same.
  @override
  int get hashCode {
    return _hashCode ??= const Hash().hashIterable(
      _inner.keys
          .map((key) => const Hash().hash2(key.hashCode, _inner[key].hashCode))
          .toList(growable: false)
        ..sort(),
    );
  }

  /// Deep equality.
  ///
  /// A `ImMap` is only equal to another with equal key/value
  /// pairs in any order.
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! ImMap) return false;
    if (other.length != length) return false;
    if (other.hashCode != hashCode) return false;
    for (var key in keys) {
      if (other[key] != this[key]) return false;
    }
    return true;
  }

  @override
  String toString() => _inner.toString();

  // Map.

  /// [Map].
  V? operator [](Object? key) => _inner[key];

  /// [Map.containsKey].
  bool containsKey(Object key) => _inner.containsKey(key);

  /// [Map.containsValue].
  bool containsValue(Object value) => _inner.containsValue(value);

  /// [Map.forEach].
  void forEach(void Function(K, V) f) {
    _inner.forEach(f);
  }

  /// [Map.isEmpty].
  bool get isEmpty => _inner.isEmpty;

  /// [Map.isNotEmpty].
  bool get isNotEmpty => _inner.isNotEmpty;

  /// [Map.keys]
  Iterable<K> get keys => _inner.keys;

  /// [Map.length].
  int get length => _inner.length;

  /// [Map.values].
  Iterable<V> get values => _inner.values;

  /// [Map.entries].
  Iterable<MapEntry<K, V>> get entries => _inner.entries;

  /// [Map.map], but returns a [ImMap].
  ImMap<K2, V2> map<K2, V2>(MapEntry<K2, V2> Function(K, V) f) {
    return ImMap<K2, V2>(_inner.map(f));
  }
}

extension MapExtensions<K, V> on Map<K, V> {
  /// Gets an immutable copy of the collection
  ImMap<K, V> get immut => ImMap<K, V>(this);
}
