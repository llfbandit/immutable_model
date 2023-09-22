part of 'index.dart';

@ShouldGenerate(
    r'''
extension $CollectionClassImExt<T extends Iterable<int>> on CollectionClass<T> {
  List<Object?> get _$props => [
        mandatoryList,
        optionalList,
        mandatoryMap,
        optionalMap,
        mandatorySet,
        optionalSet
      ];

  // ignore: library_private_types_in_public_api
  _$ICollectionClassCopy<T> get copyWith => _$CollectionClassCopy<T>(this);
}

mixin _$CollectionClassMixin implements IEquatable {
  @override
  List<Object?> get props =>
      $CollectionClassImExt(this as CollectionClass)._$props;

  @override
  int get hashCode => const Hash().hash(this, props);

  @override
  bool operator ==(Object other) => eq(this, other);

  @override
  String toString() {
    return 'CollectionClass(mandatoryList: ${props[0]}, optionalList: ${props[1]}, mandatoryMap: ${props[2]}, optionalMap: ${props[3]}, mandatorySet: ${props[4]}, optionalSet: ${props[5]})';
  }
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
      mandatoryList: mandatoryList == const $ImCopy() || mandatoryList == null
          ? _value.mandatoryList
          : ImList(mandatoryList as List<int>),
      optionalList: optionalList == const $ImCopy()
          ? _value.optionalList
          : optionalList as T?,
      mandatoryMap: mandatoryMap == const $ImCopy() || mandatoryMap == null
          ? _value.mandatoryMap
          : ImMap(mandatoryMap as Map<String, bool>),
      optionalMap: optionalMap == const $ImCopy()
          ? _value.optionalMap
          : optionalMap == null
              ? null
              : ImMap(optionalMap as Map<String, bool>),
      mandatorySet: mandatorySet == const $ImCopy() || mandatorySet == null
          ? _value.mandatorySet
          : ImSet(mandatorySet as Set<String>),
      optionalSet: optionalSet == const $ImCopy()
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
