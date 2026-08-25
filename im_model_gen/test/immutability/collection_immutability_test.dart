import 'package:im_model/im_model.dart';
import 'package:meta/meta.dart';
import 'package:test/test.dart';

part 'collection_immutability_test.g.dart';

enum Flavor { sweet, sour }

@immutable
class Point {
  const Point(this.x, this.y);

  final int x;
  final int y;
}

@ImModel()
class CollectionImmutabilityClass with _$CollectionImmutabilityClassMixin {
  const CollectionImmutabilityClass({
    required this.flavors,
    required this.points,
    required this.coordinates,
    required this.byFlavor,
  });

  final ImList<Flavor> flavors;
  final ImList<Point> points;
  final ImList<(int, String)> coordinates;
  final ImMap<Flavor, Point> byFlavor;
}

@ImModel()
class SelfRefNode with _$SelfRefNodeMixin {
  const SelfRefNode({required this.name, required this.children});

  final String name;
  final ImList<SelfRefNode> children;
}

// Plain class, no @immutable/@ImModel — proven immutable structurally, by
// having only final fields, not by name.
class PlainFinal {
  const PlainFinal(this.value);

  final int value;
}

// Self-referential plain class (not wrapped in an ImList itself) — exercises
// the cycle guard directly, independent of the collection-recursion path.
class PlainSelfRef {
  const PlainSelfRef(this.name, this.next);

  final String name;
  final PlainSelfRef? next;
}

// A plain class nesting another plain class — exercises structural
// recursion through more than one level, not just a class's own fields.
class PlainOuter {
  const PlainOuter(this.inner, this.label);

  final PlainInner inner;
  final String label;
}

class PlainInner {
  const PlainInner(this.value);

  final int value;
}

// A plain class hierarchy — exercises the inherited-field walk in
// CheckImmutability._instanceFields.
class PlainBase {
  const PlainBase(this.id);

  final int id;
}

class PlainDerived extends PlainBase {
  const PlainDerived(super.id, this.extra);

  final String extra;
}

@ImModel()
class StructuralImmutabilityClass with _$StructuralImmutabilityClassMixin {
  const StructuralImmutabilityClass({
    required this.plain,
    required this.timestamps,
    required this.durations,
    required this.chain,
    required this.nested,
    required this.derived,
  });

  final ImList<PlainFinal> plain;
  final ImList<DateTime> timestamps;
  final ImList<Duration> durations;
  final ImList<PlainSelfRef> chain;
  final ImList<PlainOuter> nested;
  final ImList<PlainDerived> derived;
}

void main() {
  test('generates successfully for enum / Record / @immutable-class collection '
      'elements', () {
    final instance = CollectionImmutabilityClass(
      flavors: ImList([Flavor.sweet]),
      points: ImList([Point(1, 2)]),
      coordinates: ImList([(1, 'a')]),
      byFlavor: ImMap({Flavor.sweet: Point(1, 2)}),
    );

    expect(instance.flavors.first, Flavor.sweet);
    expect(instance.points.first.x, 1);
    expect(instance.coordinates.first, (1, 'a'));
    expect(instance.byFlavor[Flavor.sweet]?.y, 2);

    final updated = instance.copyWith(flavors: [Flavor.sour]);
    expect(updated.flavors.first, Flavor.sour);
  });

  test('a self-referential ImList<Self> field generates without infinite '
      'recursion', () {
    final node = SelfRefNode(
      name: 'root',
      children: ImList([SelfRefNode(name: 'leaf', children: ImList([]))]),
    );

    expect(node.children.first.name, 'leaf');
  });

  test('generates successfully for structurally-immutable collection '
      'elements (no @immutable/@ImModel/name-allowlist involved)', () {
    final instance = StructuralImmutabilityClass(
      plain: ImList([PlainFinal(1)]),
      timestamps: ImList([DateTime(2024)]),
      durations: ImList([Duration(seconds: 1)]),
      chain: ImList([PlainSelfRef('a', PlainSelfRef('b', null))]),
      nested: ImList([PlainOuter(PlainInner(42), 'x')]),
      derived: ImList([PlainDerived(1, 'y')]),
    );

    expect(instance.plain.first.value, 1);
    expect(instance.timestamps.first.year, 2024);
    expect(instance.durations.first.inSeconds, 1);
    expect(instance.chain.first.next?.name, 'b');
    expect(instance.nested.first.inner.value, 42);
    expect(instance.derived.first.id, 1);
    expect(instance.derived.first.extra, 'y');
  });
}
