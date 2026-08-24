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
    optionalSet,
  );
}

mixin _$CollectionClassMixin<T extends Iterable<int>> {
  $ICollectionClassCopy<T, CollectionClass<T>> get copyWith =>
      $CollectionClassCopy(this as CollectionClass<T>, (v) => v);

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

abstract interface class $ICollectionClassCopy<T extends Iterable<int>, $R> {
  $R call({
    List<int>? mandatoryList,
    T? optionalList,
    Map<String, bool>? mandatoryMap,
    Map<String, bool>? optionalMap,
    Set<String>? mandatorySet,
    Set<String>? optionalSet,
  });
}

class $CollectionClassCopy<T extends Iterable<int>, $R>
    implements $ICollectionClassCopy<T, $R> {
  const $CollectionClassCopy(this._value, this._then);

  final CollectionClass<T> _value;
  final $R Function(CollectionClass<T>) _then;

  @override
  $R call({
    Object? mandatoryList = $undefined,
    Object? optionalList = $undefined,
    Object? mandatoryMap = $undefined,
    Object? optionalMap = $undefined,
    Object? mandatorySet = $undefined,
    Object? optionalSet = $undefined,
  }) {
    return _then(
      CollectionClass<T>(
        mandatoryList: $undefined == mandatoryList || mandatoryList == null
            ? _value.mandatoryList
            : ImList(mandatoryList as List<int>),
        optionalList: $undefined == optionalList
            ? _value.optionalList
            : optionalList as T?,
        mandatoryMap: $undefined == mandatoryMap || mandatoryMap == null
            ? _value.mandatoryMap
            : ImMap(mandatoryMap as Map<String, bool>),
        optionalMap: $undefined == optionalMap
            ? _value.optionalMap
            : optionalMap == null
            ? null
            : ImMap(optionalMap as Map<String, bool>),
        mandatorySet: $undefined == mandatorySet || mandatorySet == null
            ? _value.mandatorySet
            : ImSet(mandatorySet as Set<String>),
        optionalSet: $undefined == optionalSet
            ? _value.optionalSet
            : optionalSet == null
            ? null
            : ImSet(optionalSet as Set<String>),
      ),
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
