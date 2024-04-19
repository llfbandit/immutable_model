part of 'index.dart';

@ShouldGenerate(r'''
extension _$CollectionClassImExt<T extends Iterable<int>>
    on CollectionClass<T> {
  dynamic _eq() => (
        mandatoryList,
        optionalList,
        mandatoryMap,
        optionalMap,
        mandatorySet,
        optionalSet
      );
}

mixin _$CollectionClassMixin<T extends Iterable<int>> {
  _$ICollectionClassCopy<T> get copyWith =>
      _$CollectionClassCopy<T>(this as CollectionClass);

  @override
  int get hashCode => (this as CollectionClass)._eq().hashCode;

  @override
  bool operator ==(covariant CollectionClass<T> other) {
    if (identical(this, other)) return true;
    return other._eq() == (this as CollectionClass)._eq();
  }

  @override
  String toString() => (this as CollectionClass)._eq().toString();
}

abstract interface class _$ICollectionClassCopy<T extends Iterable<int>> {
  CollectionClass<T> call({
    List<int>? mandatoryList,
    T? optionalList,
    Map<String, bool>? mandatoryMap,
    Map<String, bool>? optionalMap,
    Set<String>? mandatorySet,
    Set<String>? optionalSet,
  });
}

class _$CollectionClassCopy<T extends Iterable<int>>
    implements _$ICollectionClassCopy<T> {
  const _$CollectionClassCopy(this._value);

  final CollectionClass<T> _value;

  @override
  CollectionClass<T> call({
    Object? mandatoryList = const $ImCopy(),
    Object? optionalList = const $ImCopy(),
    Object? mandatoryMap = const $ImCopy(),
    Object? optionalMap = const $ImCopy(),
    Object? mandatorySet = const $ImCopy(),
    Object? optionalSet = const $ImCopy(),
  }) {
    return CollectionClass<T>(
      mandatoryList: const $ImCopy() == mandatoryList || mandatoryList == null
          ? _value.mandatoryList
          : ImList(mandatoryList as List<int>),
      optionalList: const $ImCopy() == optionalList
          ? _value.optionalList
          : optionalList as T?,
      mandatoryMap: const $ImCopy() == mandatoryMap || mandatoryMap == null
          ? _value.mandatoryMap
          : ImMap(mandatoryMap as Map<String, bool>),
      optionalMap: const $ImCopy() == optionalMap
          ? _value.optionalMap
          : optionalMap == null
              ? null
              : ImMap(optionalMap as Map<String, bool>),
      mandatorySet: const $ImCopy() == mandatorySet || mandatorySet == null
          ? _value.mandatorySet
          : ImSet(mandatorySet as Set<String>),
      optionalSet: const $ImCopy() == optionalSet
          ? _value.optionalSet
          : optionalSet == null
              ? null
              : ImSet(optionalSet as Set<String>),
    );
  }
}
''')
@ImModel()
class CollectionClass<T extends Iterable<int>> {
  const CollectionClass({
    required this.mandatoryList,
    this.optionalList,
    required this.mandatoryMap,
    this.optionalMap,
    required this.mandatorySet,
    this.optionalSet,
  });

  final ImList<int> mandatoryList;
  final T? optionalList;
  final ImMap<String, bool> mandatoryMap;
  final ImMap<String, bool>? optionalMap;
  final ImSet<String> mandatorySet;
  final ImSet<String>? optionalSet;
}
