// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collection_test.dart';

// **************************************************************************
// ImmutableModelGenerator
// **************************************************************************

extension _$CopyListImExt on CopyList {
  dynamic _eq() => (coll);
}

mixin _$CopyListMixin {
  $ICopyListCopy<CopyList> get copyWith =>
      $CopyListCopy(this as CopyList, (v) => v);

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

abstract interface class $ICopyListCopy<$R> {
  $R call({List<String>? coll});
}

class $CopyListCopy<$R> implements $ICopyListCopy<$R> {
  const $CopyListCopy(this._value, this._then);

  final CopyList _value;
  final $R Function(CopyList) _then;

  @override
  $R call({Object? coll = $undefined}) {
    return _then(
      CopyList(
        coll: $undefined == coll || coll == null
            ? _value.coll
            : ImList(coll as List<String>),
      ),
    );
  }
}

extension _$CopyMapImExt on CopyMap {
  dynamic _eq() => (coll);
}

mixin _$CopyMapMixin {
  $ICopyMapCopy<CopyMap> get copyWith =>
      $CopyMapCopy(this as CopyMap, (v) => v);

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

abstract interface class $ICopyMapCopy<$R> {
  $R call({Map<String, String>? coll});
}

class $CopyMapCopy<$R> implements $ICopyMapCopy<$R> {
  const $CopyMapCopy(this._value, this._then);

  final CopyMap _value;
  final $R Function(CopyMap) _then;

  @override
  $R call({Object? coll = $undefined}) {
    return _then(
      CopyMap(
        coll: $undefined == coll || coll == null
            ? _value.coll
            : ImMap(coll as Map<String, String>),
      ),
    );
  }
}

extension _$CopySetImExt on CopySet {
  dynamic _eq() => (coll);
}

mixin _$CopySetMixin {
  $ICopySetCopy<CopySet> get copyWith =>
      $CopySetCopy(this as CopySet, (v) => v);

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

abstract interface class $ICopySetCopy<$R> {
  $R call({Set<String>? coll});
}

class $CopySetCopy<$R> implements $ICopySetCopy<$R> {
  const $CopySetCopy(this._value, this._then);

  final CopySet _value;
  final $R Function(CopySet) _then;

  @override
  $R call({Object? coll = $undefined}) {
    return _then(
      CopySet(
        coll: $undefined == coll || coll == null
            ? _value.coll
            : ImSet(coll as Set<String>),
      ),
    );
  }
}

extension _$CopyNestedListImExt on CopyNestedList {
  dynamic _eq() => (coll);
}

mixin _$CopyNestedListMixin {
  $ICopyNestedListCopy<CopyNestedList> get copyWith =>
      $CopyNestedListCopy(this as CopyNestedList, (v) => v);

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

abstract interface class $ICopyNestedListCopy<$R> {
  $R call({List<ImList<String>>? coll});
}

class $CopyNestedListCopy<$R> implements $ICopyNestedListCopy<$R> {
  const $CopyNestedListCopy(this._value, this._then);

  final CopyNestedList _value;
  final $R Function(CopyNestedList) _then;

  @override
  $R call({Object? coll = $undefined}) {
    return _then(
      CopyNestedList(
        coll: $undefined == coll || coll == null
            ? _value.coll
            : ImList(coll as List<ImList<String>>),
      ),
    );
  }
}
