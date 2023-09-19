import 'dart:collection';
import 'dart:math';

const String errMessage =
    'This collection is immutable and will throw exception at runtime.';

/// A [List] that is immutable.
class ImList<E> extends ListBase<E> {
  ImList(Iterable<E> items) : _inner = List.unmodifiable(items);

  const ImList.empty() : _inner = const [];

  final List<E> _inner;

  List<E> get mut => List.of(_inner);

  // Forward methods
  @override
  E operator [](int index) => _inner[index];

  @override
  int get length => _inner.length;

  // Deprecated methods
  @Deprecated(errMessage)
  @override
  void clear();

  @Deprecated(errMessage)
  @override
  void add(E element);

  @Deprecated(errMessage)
  @override
  void addAll(Iterable<E> iterable) => throw UnsupportedError(errMessage);

  @Deprecated(errMessage)
  @override
  bool remove(Object? element) => throw UnsupportedError(errMessage);

  @Deprecated(errMessage)
  @override
  E removeAt(int index) => throw UnsupportedError(errMessage);

  @Deprecated(errMessage)
  @override
  E removeLast() => throw UnsupportedError(errMessage);

  @Deprecated(errMessage)
  @override
  E removeRange(int start, int end) => throw UnsupportedError(errMessage);

  @Deprecated(errMessage)
  @override
  E removeWhere(bool Function(E element) test) {
    throw UnsupportedError(errMessage);
  }

  @Deprecated(errMessage)
  @override
  E replaceRange(int start, int end, Iterable<E> newContents) {
    throw UnsupportedError(errMessage);
  }

  @Deprecated(errMessage)
  @override
  E retainWhere(bool Function(E element) test) {
    throw UnsupportedError(errMessage);
  }

  @Deprecated(errMessage)
  @override
  void setAll(int index, Iterable<E> iterable) {
    throw UnsupportedError(errMessage);
  }

  @Deprecated(errMessage)
  @override
  void setRange(int start, int end, Iterable<E> iterable, [int skipCount = 0]) {
    throw UnsupportedError(errMessage);
  }

  @Deprecated(errMessage)
  @override
  set length(int length) => throw UnsupportedError(errMessage);

  @Deprecated(errMessage)
  @override
  void operator []=(int index, E value) => throw UnsupportedError(errMessage);

  @Deprecated(errMessage)
  @override
  void insert(int index, E element) => throw UnsupportedError(errMessage);

  @Deprecated(errMessage)
  @override
  void insertAll(int index, Iterable<E> iterable) {
    throw UnsupportedError(errMessage);
  }

  @Deprecated(errMessage)
  @override
  void fillRange(int start, int end, [E? fill]);

  @Deprecated(errMessage)
  @override
  void sort([int Function(E a, E b)? compare]) {
    throw UnsupportedError(errMessage);
  }

  @Deprecated(errMessage)
  @override
  void shuffle([Random? random]) => throw UnsupportedError(errMessage);
}

/// A [Map] that is immutable.
class ImMap<K, V> extends MapBase<K, V> {
  ImMap(Map<K, V> other) : _inner = Map<K, V>.unmodifiable(other);

  const ImMap.empty() : _inner = const {};

  final Map<K, V> _inner;

  Map<K, V> get mut => Map.of(_inner);

  // Forward methods
  @override
  V? operator [](Object? key) => _inner[key];

  @override
  Iterable<K> get keys => _inner.keys;

  // Deprecated  methods
  @Deprecated(errMessage)
  @override
  void operator []=(K key, V value) => throw UnsupportedError(errMessage);

  @Deprecated(errMessage)
  @override
  void addAll(Map<K, V> other);

  @Deprecated(errMessage)
  @override
  void addEntries(Iterable<MapEntry<K, V>> newEntries);

  @Deprecated(errMessage)
  @override
  void clear() => throw UnsupportedError(errMessage);

  @Deprecated(errMessage)
  @override
  V putIfAbsent(K key, V Function() ifAbsent) {
    throw UnsupportedError(errMessage);
  }

  @Deprecated(errMessage)
  @override
  V? remove(Object? key) => throw UnsupportedError(errMessage);

  @Deprecated(errMessage)
  @override
  void removeWhere(bool Function(K key, V value) test) {
    throw UnsupportedError(errMessage);
  }

  @Deprecated(errMessage)
  @override
  V update(K key, V Function(V value) update, {V Function()? ifAbsent}) {
    throw UnsupportedError(errMessage);
  }

  @Deprecated(errMessage)
  @override
  void updateAll(V Function(K key, V value) update) {
    throw UnsupportedError(errMessage);
  }
}

/// A [Set] that is immutable.
class ImSet<E> extends SetBase<E> {
  ImSet(Set<E> other) : _inner = Set<E>.unmodifiable(other);

  const ImSet.empty() : _inner = const {};

  final Set<E> _inner;

  Set<E> get mut => Set.of(_inner);

  // Forward methods
  @override
  bool contains(Object? element) => _inner.contains(element);

  @override
  Iterator<E> get iterator => _inner.iterator;

  @override
  int get length => _inner.length;

  @override
  E? lookup(Object? element) => _inner.lookup(element);

  @override
  Set<E> toSet() => _inner.toSet();

  // Deprecated methods
  @Deprecated(errMessage)
  @override
  bool add(E value) => throw UnsupportedError(errMessage);

  @Deprecated(errMessage)
  @override
  void addAll(Iterable<E> elements) => throw UnsupportedError(errMessage);

  @Deprecated(errMessage)
  @override
  void clear() => throw UnsupportedError(errMessage);

  @Deprecated(errMessage)
  @override
  bool remove(Object? value) => throw UnsupportedError(errMessage);

  @Deprecated(errMessage)
  @override
  void removeAll(Iterable<Object?> elements) {
    throw UnsupportedError(errMessage);
  }

  @Deprecated(errMessage)
  @override
  void removeWhere(bool Function(E element) test) {
    throw UnsupportedError(errMessage);
  }

  @Deprecated(errMessage)
  @override
  void retainAll(Iterable<Object?> elements) {
    throw UnsupportedError(errMessage);
  }

  @Deprecated(errMessage)
  @override
  void retainWhere(bool Function(E element) test) {
    throw UnsupportedError(errMessage);
  }
}

extension IterableExtensions<T> on Iterable<T> {
  ImList<T> get immut => ImList<T>(this);
}

extension SetExtensions<T> on Set<T> {
  ImSet<T> get immut => ImSet<T>(this);
}

extension MapExtensions<K, V> on Map<K, V> {
  ImMap<K, V> get immut => ImMap<K, V>(this);
}
