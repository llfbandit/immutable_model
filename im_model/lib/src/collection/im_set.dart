import 'dart:collection';

import 'package:im_model/src/equality/equality_hash.dart';
import 'package:im_model/src/collection/internal/copy_on_write_set.dart';

/// A [Set] that is immutable.
class ImSet<E> implements Iterable<E> {
  ImSet._(Iterable<E> items) : _inner = Set<E>.from(items);

  factory ImSet([Iterable<E>? items]) {
    if (items == null) {
      return ImSet._(<E>[]);
    } else if (items is ImSet<E>) {
      return items;
    }

    return ImSet._(items);
  }

  const ImSet.empty() : _inner = const {};

  final Set<E> _inner;

  /// Gets a mutable copy of the collection [toSet]
  Set<E> get mut => toSet();

  /// Deep hashCode.
  ///
  /// A `ImSet` is only equal to another with equal elements in
  /// any order. Then, the `hashCode` is guaranteed to be the same.
  @override
  int get hashCode {
    return const Hash().hashIterable(
      _inner.map((e) => e.hashCode).toList(growable: false)..sort(),
    );
  }

  /// Deep equality.
  ///
  /// A `ImSet` is only equal to another with equal elements in
  /// any order.
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! ImSet) return false;
    if (other.length != length) return false;
    if (other.hashCode != hashCode) return false;
    return containsAll(other);
  }

  @override
  String toString() => _inner.toString();

  /// Returns as an immutable set.
  Set<E> asSet() => UnmodifiableSetView<E>(_inner);

  // Set.

  /// [Set.length].
  @override
  int get length => _inner.length;

  /// [Set.containsAll].
  bool containsAll(Iterable<Object?> other) => _inner.containsAll(other);

  /// [Set.difference] but takes a `ImSet<Object?>` and returns a
  /// `ImSet<E>`.
  ImSet<E> difference(ImSet<Object?> other) {
    return ImSet<E>(_inner.difference(other._inner));
  }

  /// [Set.intersection] but takes a `ImSet<Object?>` and returns a
  /// `ImSet<E>`.
  ImSet<E> intersection(ImSet<Object?> other) {
    return ImSet<E>(_inner.intersection(other._inner));
  }

  /// As [Set.lookup].
  E? lookup(Object? object) => _inner.lookup(object);

  /// [Set.union] but takes and returns a `ImSet<E>`.
  ImSet<E> union(ImSet<E> other) {
    return ImSet<E>(_inner.union(other._inner));
  }

  // Iterable.

  /// [Iterable.toSet].
  ///
  /// Note that the implementation is efficient: it returns a copy-on-write
  /// wrapper around the data from this `ImSet`. So, if no mutations are
  /// made to the result, no copy is made.
  ///
  /// This allows efficient use of APIs that ask for a mutable collection
  /// but don't actually mutate it.
  @override
  Set<E> toSet() => CopyOnWriteSet<E>(_inner);

  @override
  Iterator<E> get iterator => _inner.iterator;

  @override
  Iterable<T> cast<T>() => Iterable.castFrom<E, T>(_inner);

  @override
  Iterable<E> followedBy(Iterable<E> other) => _inner.followedBy(other);

  @override
  Iterable<T> whereType<T>() => _inner.whereType<T>();

  @override
  Iterable<T> map<T>(T Function(E) f) => _inner.map(f);

  @override
  Iterable<E> where(bool Function(E) test) => _inner.where(test);

  @override
  Iterable<T> expand<T>(Iterable<T> Function(E) f) => _inner.expand(f);

  @override
  bool contains(Object? element) => _inner.contains(element);

  @override
  void forEach(void Function(E) f) => _inner.forEach(f);

  @override
  E reduce(E Function(E, E) combine) => _inner.reduce(combine);

  @override
  T fold<T>(T initialValue, T Function(T, E) combine) {
    return _inner.fold(initialValue, combine);
  }

  @override
  bool every(bool Function(E) test) => _inner.every(test);

  @override
  String join([String separator = '']) => _inner.join(separator);

  @override
  bool any(bool Function(E) test) => _inner.any(test);

  @override
  List<E> toList({bool growable = true}) => _inner.toList(growable: growable);

  @override
  bool get isEmpty => _inner.isEmpty;

  @override
  bool get isNotEmpty => _inner.isNotEmpty;

  @override
  Iterable<E> take(int n) => _inner.take(n);

  @override
  Iterable<E> takeWhile(bool Function(E) test) => _inner.takeWhile(test);

  @override
  Iterable<E> skip(int n) => _inner.skip(n);

  @override
  Iterable<E> skipWhile(bool Function(E) test) => _inner.skipWhile(test);

  @override
  E get first => _inner.first;

  @override
  E get last => _inner.last;

  @override
  E get single => _inner.single;

  @override
  E firstWhere(bool Function(E) test, {E Function()? orElse}) {
    return _inner.firstWhere(test, orElse: orElse);
  }

  @override
  E lastWhere(bool Function(E) test, {E Function()? orElse}) {
    return _inner.lastWhere(test, orElse: orElse);
  }

  @override
  E singleWhere(bool Function(E) test, {E Function()? orElse}) {
    return _inner.singleWhere(test, orElse: orElse);
  }

  @override
  E elementAt(int index) => _inner.elementAt(index);
}

extension SetExtensions<T> on Set<T> {
  /// Gets an immutable copy of the collection
  ImSet<T> get immut => ImSet<T>(this);
}
