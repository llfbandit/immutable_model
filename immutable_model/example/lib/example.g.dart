// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'example.dart';

// **************************************************************************
// ImmutableModelGenerator
// **************************************************************************

extension $ParentImExt<T> on Parent<T> {
  List<Object?> get _$props => [id];

  // ignore: library_private_types_in_public_api
  _$IParentCopy<T> get copyWith => _$ParentCopy<T>(this);
}

mixin _$ParentMixin implements IEquatable {
  @override
  List<Object?> get props => $ParentImExt(this as Parent)._$props;

  @override
  int get hashCode => const Hash().hash(this, props);

  @override
  bool operator ==(Object other) => eq(this, other);
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
  List<Object?> get _$props => [collection];

  // ignore: library_private_types_in_public_api
  _$IChildCopy<T> get copyWith => _$ChildCopy<T>(this);
}

mixin _$ChildMixin on IEquatable {
  @override
  List<Object?> get props =>
      [...super.props, ...$ChildImExt(this as Child)._$props];

  @override
  int get hashCode => const Hash().hash(this, props);

  @override
  bool operator ==(Object other) => eq(this, other);
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
  List<Object?> get _$props => [foo];
}

mixin _$Child2Mixin on IEquatable {
  @override
  List<Object?> get props =>
      [...super.props, ...$Child2ImExt(this as Child2)._$props];

  @override
  int get hashCode => const Hash().hash(this, props);

  @override
  bool operator ==(Object other) => eq(this, other);
}
