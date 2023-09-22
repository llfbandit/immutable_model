import 'package:im_model/im_model.dart';
import 'package:im_model/src/collection/internal/copy_on_write_list.dart';

/// A [List] that is immutable.
class ImList<E> implements Iterable<E> {
  ImList._(Iterable<E> items) : _inner = List<E>.from(items);

  factory ImList([Iterable<E>? items]) {
    if (items == null) {
      return ImList._(<E>[]);
    } else if (items is ImList<E>) {
      return items;
    }

    return ImList._(items);
  }

  const ImList.empty() : _inner = const [];

  final List<E> _inner;

  /// Gets a mutable copy of the collection [ImList.toList]
  List<E> get mut => toList(growable: true);

  // List

  E operator [](int index) => _inner[index];

  /// [List.+].
  ImList<E> operator +(ImList<E> other) => ImList<E>(_inner + other._inner);

  /// [List.reversed].
  Iterable<E> get reversed => _inner.reversed;

  /// [List.indexOf].
  int indexOf(E element, [int start = 0]) => _inner.indexOf(element, start);

  /// [List.lastIndexOf].
  int lastIndexOf(E element, [int? start]) =>
      _inner.lastIndexOf(element, start);

  /// [List.indexWhere].
  int indexWhere(bool Function(E) test, [int start = 0]) {
    return _inner.indexWhere(test, start);
  }

  /// [List.lastIndexWhere].
  int lastIndexWhere(bool Function(E) test, [int? start]) {
    return _inner.lastIndexWhere(test, start);
  }

  /// [List.sublist] but returns a `ImList<E>`.
  ImList<E> sublist(int start, [int? end]) {
    return ImList<E>(_inner.sublist(start, end));
  }

  /// [List.getRange].
  Iterable<E> getRange(int start, int end) => _inner.getRange(start, end);

  /// [List.asMap].
  Map<int, E> asMap() => _inner.asMap();

  // Iterable

  @override
  int get length => _inner.length;

  @override
  bool any(bool Function(E element) test) => _inner.any(test);

  @override
  Iterable<T> cast<T>() => Iterable.castFrom<E, T>(_inner);

  @override
  bool contains(Object? element) => _inner.contains(element);

  @override
  E elementAt(int index) => _inner.elementAt(index);

  @override
  bool every(bool Function(E) test) => _inner.every(test);

  @override
  Iterable<T> expand<T>(Iterable<T> Function(E) f) => _inner.expand(f);

  @override
  E get first => _inner.first;

  @override
  E firstWhere(bool Function(E) test, {E Function()? orElse}) {
    return _inner.firstWhere(test, orElse: orElse);
  }

  @override
  T fold<T>(T initialValue, T Function(T, E) combine) {
    return _inner.fold(initialValue, combine);
  }

  @override
  Iterable<E> followedBy(Iterable<E> other) => _inner.followedBy(other);

  @override
  void forEach(void Function(E element) action) => _inner.forEach(action);

  @override
  bool get isEmpty => _inner.isEmpty;

  @override
  bool get isNotEmpty => _inner.isNotEmpty;

  @override
  Iterator<E> get iterator => _inner.iterator;

  @override
  String join([String separator = ""]) => _inner.join(separator);

  @override
  E get last => _inner.last;

  @override
  E lastWhere(bool Function(E) test, {E Function()? orElse}) {
    return _inner.lastWhere(test, orElse: orElse);
  }

  @override
  Iterable<T> map<T>(T Function(E e) toElement) => _inner.map(toElement);

  @override
  E reduce(E Function(E value, E element) combine) => _inner.reduce(combine);

  @override
  E get single => _inner.single;

  @override
  E singleWhere(bool Function(E element) test, {E Function()? orElse}) {
    return _inner.singleWhere(test, orElse: orElse);
  }

  @override
  Iterable<E> skip(int count) => _inner.skip(count);

  @override
  Iterable<E> skipWhile(bool Function(E value) test) => _inner.skipWhile(test);

  @override
  Iterable<E> take(int count) => _inner.take(count);

  @override
  Iterable<E> takeWhile(bool Function(E value) test) => _inner.takeWhile(test);

  ///  [Iterable.toList].
  ///
  /// Note that the implementation is efficient: it returns a copy-on-write
  /// wrapper around the data from this `ImList`. So, if no mutations are
  /// made to the result, no copy is made.
  ///
  /// This allows efficient use of APIs that ask for a mutable collection
  /// but don't actually mutate it.
  @override
  List<E> toList({bool growable = true}) {
    return CopyOnWriteList<E>(_inner, growable);
  }

  @override
  Set<E> toSet() => _inner.toSet();

  @override
  Iterable<E> where(bool Function(E element) test) => _inner.where(test);

  @override
  Iterable<T> whereType<T>() => _inner.whereType<T>();

  /// Deep hashCode.
  ///
  /// A `ImList` is only equal to another with equal elements in
  /// the same order. Then, the `hashCode` is guaranteed to be the same.
  @override
  int get hashCode => _inner.length ^ const Hash().hashIterable(_inner);

  /// Deep equality.
  ///
  /// A `ImList` is only equal to another with equal elements in
  /// the same order.
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! ImList) return false;
    if (other.length != length) return false;
    if (other.hashCode != hashCode) return false;
    for (var i = 0; i != length; ++i) {
      if (other[i] != this[i]) return false;
    }
    return true;
  }

  @override
  String toString() => _inner.toString();
}

extension ListExtensions<T> on List<T> {
  /// Gets an immutable copy of the collection
  ImList<T> get immut => ImList<T>(this);
}
