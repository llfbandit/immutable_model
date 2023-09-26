// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'example.dart';

// **************************************************************************
// ImmutableModelGenerator
// **************************************************************************

extension $ParentImExt<T> on Parent<T> {
  dynamic _eq() => (id);

  // ignore: library_private_types_in_public_api
  _$IParentCopy<T> get copyWith => _$ParentCopy<T>(this);
}

mixin _$ParentMixin<T> {
  @override
  int get hashCode => (this as Parent)._eq().hashCode;

  @override
  bool operator ==(covariant Parent<T> other) {
    if (identical(this, other)) return true;
    return other._eq() == (this as Parent)._eq();
  }

  @override
  String toString() => (this as Parent)._eq().toString();
}

abstract interface class _$IParentCopy<T> {
  Parent<T> call({
    T? aValue,
  });
}

class _$ParentCopy<T> implements _$IParentCopy<T> {
  const _$ParentCopy(this._value);

  final Parent<T> _value;

  @override
  Parent<T> call({
    Object? aValue = const $ImCopy(),
  }) {
    return Parent<T>(
      _value.id,
      aValue == const $ImCopy() ? _value.aValue : aValue as T?,
    );
  }
}

extension $ChildImExt<T> on Child<T> {
  dynamic _eq() => (id, collection);

  // ignore: library_private_types_in_public_api
  _$IChildCopy<T> get copyWith => _$ChildCopy<T>(this);
}

mixin _$ChildMixin<T> {
  @override
  int get hashCode => (this as Child)._eq().hashCode;

  @override
  bool operator ==(covariant Child<T> other) {
    if (identical(this, other)) return true;
    return other._eq() == (this as Child)._eq();
  }

  @override
  String toString() => (this as Child)._eq().toString();
}

abstract interface class _$IChildCopy<T> {
  Child<T> call({
    T? aValue,
    List<int>? collection,
  });
}

class _$ChildCopy<T> implements _$IChildCopy<T> {
  const _$ChildCopy(this._value);

  final Child<T> _value;

  @override
  Child<T> call({
    Object? aValue = const $ImCopy(),
    Object? collection = const $ImCopy(),
  }) {
    return Child<T>(
      _value.id,
      aValue == const $ImCopy() ? _value.aValue : aValue as T?,
      collection: collection == const $ImCopy() || collection == null
          ? _value.collection
          : ImList(collection as List<int>),
    );
  }
}

extension $Child2ImExt<T> on Child2<T> {
  dynamic _eq() => (id, collection, foo);
}

mixin _$Child2Mixin<T> {
  @override
  int get hashCode => (this as Child2)._eq().hashCode;

  @override
  bool operator ==(covariant Child2<T> other) {
    if (identical(this, other)) return true;
    return other._eq() == (this as Child2)._eq();
  }

  @override
  String toString() => (this as Child2)._eq().toString();
}
