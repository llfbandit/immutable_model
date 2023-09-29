// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collection_test.dart';

// **************************************************************************
// ImmutableModelGenerator
// **************************************************************************

extension $CopyListImExt on CopyList {
  dynamic _eq() => (coll);

  // ignore: library_private_types_in_public_api
  _$ICopyListCopy get copyWith => _$CopyListCopy(this);
}

mixin _$CopyListMixin {
  @override
  int get hashCode => (this as CopyList)._eq().hashCode;

  @override
  bool operator ==(covariant CopyList other) {
    if (identical(this, other)) return true;
    return other._eq() == (this as CopyList)._eq();
  }

  @override
  String toString() => (this as CopyList)._eq().toString();
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
      coll: const $ImCopy() == coll || coll == null
          ? _value.coll
          : ImList(coll as List<String>),
    );
  }
}

extension $CopyMapImExt on CopyMap {
  dynamic _eq() => (coll);

  // ignore: library_private_types_in_public_api
  _$ICopyMapCopy get copyWith => _$CopyMapCopy(this);
}

mixin _$CopyMapMixin {
  @override
  int get hashCode => (this as CopyMap)._eq().hashCode;

  @override
  bool operator ==(covariant CopyMap other) {
    if (identical(this, other)) return true;
    return other._eq() == (this as CopyMap)._eq();
  }

  @override
  String toString() => (this as CopyMap)._eq().toString();
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
      coll: const $ImCopy() == coll || coll == null
          ? _value.coll
          : ImMap(coll as Map<String, String>),
    );
  }
}

extension $CopySetImExt on CopySet {
  dynamic _eq() => (coll);

  // ignore: library_private_types_in_public_api
  _$ICopySetCopy get copyWith => _$CopySetCopy(this);
}

mixin _$CopySetMixin {
  @override
  int get hashCode => (this as CopySet)._eq().hashCode;

  @override
  bool operator ==(covariant CopySet other) {
    if (identical(this, other)) return true;
    return other._eq() == (this as CopySet)._eq();
  }

  @override
  String toString() => (this as CopySet)._eq().toString();
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
      coll: const $ImCopy() == coll || coll == null
          ? _value.coll
          : ImSet(coll as Set<String>),
    );
  }
}

extension $CopyNestedListImExt on CopyNestedList {
  dynamic _eq() => (coll);

  // ignore: library_private_types_in_public_api
  _$ICopyNestedListCopy get copyWith => _$CopyNestedListCopy(this);
}

mixin _$CopyNestedListMixin {
  @override
  int get hashCode => (this as CopyNestedList)._eq().hashCode;

  @override
  bool operator ==(covariant CopyNestedList other) {
    if (identical(this, other)) return true;
    return other._eq() == (this as CopyNestedList)._eq();
  }

  @override
  String toString() => (this as CopyNestedList)._eq().toString();
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
      coll: const $ImCopy() == coll || coll == null
          ? _value.coll
          : ImList(coll as List<ImList<String>>),
    );
  }
}
