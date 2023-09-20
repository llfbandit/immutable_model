// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collection_test.dart';

// **************************************************************************
// ImmutableModelGenerator
// **************************************************************************

extension $CopyListImExt on CopyList {
  List<Object?> get _$props => [coll];

  // ignore: library_private_types_in_public_api
  _$ICopyListCopy get copyWith => _$CopyListCopy(this);
}

mixin _$CopyListMixin implements IEquatable {
  @override
  List<Object?> get props => $CopyListImExt(this as CopyList)._$props;

  @override
  int get hashCode => const Hash().hash(this, props);

  @override
  bool operator ==(Object other) => eq(this, other);
}

abstract interface class _$ICopyListCopy {
  CopyList call({
    List<String>? coll,
  });
}

class _$CopyListCopy implements _$ICopyListCopy {
  const _$CopyListCopy(this._value);

  final CopyList _value;

  @override
  CopyList call({
    Object? coll = const $ImCopy(),
  }) {
    return CopyList(
      coll: coll == const $ImCopy() || coll == null
          ? _value.coll
          : ImList(coll as List<String>),
    );
  }
}

extension $CopyMapImExt on CopyMap {
  List<Object?> get _$props => [coll];

  // ignore: library_private_types_in_public_api
  _$ICopyMapCopy get copyWith => _$CopyMapCopy(this);
}

mixin _$CopyMapMixin implements IEquatable {
  @override
  List<Object?> get props => $CopyMapImExt(this as CopyMap)._$props;

  @override
  int get hashCode => const Hash().hash(this, props);

  @override
  bool operator ==(Object other) => eq(this, other);
}

abstract interface class _$ICopyMapCopy {
  CopyMap call({
    Map<String, String>? coll,
  });
}

class _$CopyMapCopy implements _$ICopyMapCopy {
  const _$CopyMapCopy(this._value);

  final CopyMap _value;

  @override
  CopyMap call({
    Object? coll = const $ImCopy(),
  }) {
    return CopyMap(
      coll: coll == const $ImCopy() || coll == null
          ? _value.coll
          : ImMap(coll as Map<String, String>),
    );
  }
}

extension $CopySetImExt on CopySet {
  List<Object?> get _$props => [coll];

  // ignore: library_private_types_in_public_api
  _$ICopySetCopy get copyWith => _$CopySetCopy(this);
}

mixin _$CopySetMixin implements IEquatable {
  @override
  List<Object?> get props => $CopySetImExt(this as CopySet)._$props;

  @override
  int get hashCode => const Hash().hash(this, props);

  @override
  bool operator ==(Object other) => eq(this, other);
}

abstract interface class _$ICopySetCopy {
  CopySet call({
    Set<String>? coll,
  });
}

class _$CopySetCopy implements _$ICopySetCopy {
  const _$CopySetCopy(this._value);

  final CopySet _value;

  @override
  CopySet call({
    Object? coll = const $ImCopy(),
  }) {
    return CopySet(
      coll: coll == const $ImCopy() || coll == null
          ? _value.coll
          : ImSet(coll as Set<String>),
    );
  }
}

extension $CopyNestedListImExt on CopyNestedList {
  List<Object?> get _$props => [coll];

  // ignore: library_private_types_in_public_api
  _$ICopyNestedListCopy get copyWith => _$CopyNestedListCopy(this);
}

mixin _$CopyNestedListMixin implements IEquatable {
  @override
  List<Object?> get props =>
      $CopyNestedListImExt(this as CopyNestedList)._$props;

  @override
  int get hashCode => const Hash().hash(this, props);

  @override
  bool operator ==(Object other) => eq(this, other);
}

abstract interface class _$ICopyNestedListCopy {
  CopyNestedList call({
    List<ImList<String>>? coll,
  });
}

class _$CopyNestedListCopy implements _$ICopyNestedListCopy {
  const _$CopyNestedListCopy(this._value);

  final CopyNestedList _value;

  @override
  CopyNestedList call({
    Object? coll = const $ImCopy(),
  }) {
    return CopyNestedList(
      coll: coll == const $ImCopy() || coll == null
          ? _value.coll
          : ImList(coll as List<ImList<String>>),
    );
  }
}
