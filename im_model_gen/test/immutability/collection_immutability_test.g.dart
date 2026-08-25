// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collection_immutability_test.dart';

// **************************************************************************
// ImmutableModelGenerator
// **************************************************************************

extension _$CollectionImmutabilityClassImExt on CollectionImmutabilityClass {
  dynamic _eq() => (flavors, points, coordinates, byFlavor);
}

mixin _$CollectionImmutabilityClassMixin {
  $ICollectionImmutabilityClassCopy<CollectionImmutabilityClass> get copyWith =>
      $CollectionImmutabilityClassCopy(
        this as CollectionImmutabilityClass,
        (v) => v,
      );

  @override
  int get hashCode => (this as CollectionImmutabilityClass)._eq().hashCode;

  @override
  bool operator ==(covariant CollectionImmutabilityClass other) {
    if (identical(this, other)) return true;
    return other._eq() == (this as CollectionImmutabilityClass)._eq();
  }

  @override
  String toString() => (this as CollectionImmutabilityClass)._eq().toString();
}

abstract interface class $ICollectionImmutabilityClassCopy<$R> {
  $R call({
    List<Flavor>? flavors,
    List<Point>? points,
    List<(int, String)>? coordinates,
    Map<Flavor, Point>? byFlavor,
  });
}

class $CollectionImmutabilityClassCopy<$R>
    implements $ICollectionImmutabilityClassCopy<$R> {
  const $CollectionImmutabilityClassCopy(this._value, this._then);

  final CollectionImmutabilityClass _value;
  final $R Function(CollectionImmutabilityClass) _then;

  @override
  $R call({
    Object? flavors = $undefined,
    Object? points = $undefined,
    Object? coordinates = $undefined,
    Object? byFlavor = $undefined,
  }) {
    return _then(
      CollectionImmutabilityClass(
        flavors: $undefined == flavors || flavors == null
            ? _value.flavors
            : ImList(flavors as List<Flavor>),
        points: $undefined == points || points == null
            ? _value.points
            : ImList(points as List<Point>),
        coordinates: $undefined == coordinates || coordinates == null
            ? _value.coordinates
            : ImList(coordinates as List<(int, String)>),
        byFlavor: $undefined == byFlavor || byFlavor == null
            ? _value.byFlavor
            : ImMap(byFlavor as Map<Flavor, Point>),
      ),
    );
  }
}

extension _$SelfRefNodeImExt on SelfRefNode {
  dynamic _eq() => (name, children);
}

mixin _$SelfRefNodeMixin {
  $ISelfRefNodeCopy<SelfRefNode> get copyWith =>
      $SelfRefNodeCopy(this as SelfRefNode, (v) => v);

  @override
  int get hashCode => (this as SelfRefNode)._eq().hashCode;

  @override
  bool operator ==(covariant SelfRefNode other) {
    if (identical(this, other)) return true;
    return other._eq() == (this as SelfRefNode)._eq();
  }

  @override
  String toString() => (this as SelfRefNode)._eq().toString();
}

abstract interface class $ISelfRefNodeCopy<$R> {
  $R call({String? name, List<SelfRefNode>? children});
}

class $SelfRefNodeCopy<$R> implements $ISelfRefNodeCopy<$R> {
  const $SelfRefNodeCopy(this._value, this._then);

  final SelfRefNode _value;
  final $R Function(SelfRefNode) _then;

  @override
  $R call({Object? name = $undefined, Object? children = $undefined}) {
    return _then(
      SelfRefNode(
        name: $undefined == name || name == null ? _value.name : name as String,
        children: $undefined == children || children == null
            ? _value.children
            : ImList(children as List<SelfRefNode>),
      ),
    );
  }
}

extension _$StructuralImmutabilityClassImExt on StructuralImmutabilityClass {
  dynamic _eq() => (plain, timestamps, durations, chain, nested, derived);
}

mixin _$StructuralImmutabilityClassMixin {
  $IStructuralImmutabilityClassCopy<StructuralImmutabilityClass> get copyWith =>
      $StructuralImmutabilityClassCopy(
        this as StructuralImmutabilityClass,
        (v) => v,
      );

  @override
  int get hashCode => (this as StructuralImmutabilityClass)._eq().hashCode;

  @override
  bool operator ==(covariant StructuralImmutabilityClass other) {
    if (identical(this, other)) return true;
    return other._eq() == (this as StructuralImmutabilityClass)._eq();
  }

  @override
  String toString() => (this as StructuralImmutabilityClass)._eq().toString();
}

abstract interface class $IStructuralImmutabilityClassCopy<$R> {
  $R call({
    List<PlainFinal>? plain,
    List<DateTime>? timestamps,
    List<Duration>? durations,
    List<PlainSelfRef>? chain,
    List<PlainOuter>? nested,
    List<PlainDerived>? derived,
  });
}

class $StructuralImmutabilityClassCopy<$R>
    implements $IStructuralImmutabilityClassCopy<$R> {
  const $StructuralImmutabilityClassCopy(this._value, this._then);

  final StructuralImmutabilityClass _value;
  final $R Function(StructuralImmutabilityClass) _then;

  @override
  $R call({
    Object? plain = $undefined,
    Object? timestamps = $undefined,
    Object? durations = $undefined,
    Object? chain = $undefined,
    Object? nested = $undefined,
    Object? derived = $undefined,
  }) {
    return _then(
      StructuralImmutabilityClass(
        plain: $undefined == plain || plain == null
            ? _value.plain
            : ImList(plain as List<PlainFinal>),
        timestamps: $undefined == timestamps || timestamps == null
            ? _value.timestamps
            : ImList(timestamps as List<DateTime>),
        durations: $undefined == durations || durations == null
            ? _value.durations
            : ImList(durations as List<Duration>),
        chain: $undefined == chain || chain == null
            ? _value.chain
            : ImList(chain as List<PlainSelfRef>),
        nested: $undefined == nested || nested == null
            ? _value.nested
            : ImList(nested as List<PlainOuter>),
        derived: $undefined == derived || derived == null
            ? _value.derived
            : ImList(derived as List<PlainDerived>),
      ),
    );
  }
}
