// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generic_test.dart';

// **************************************************************************
// ImmutableModelGenerator
// **************************************************************************

extension _$GenericsImExt<G, T extends Iterable<G>> on Generics<G, T> {
  dynamic _eq() =>
      (basicGeneric, genericTemplate, nullableGeneric, deepNestedGeneric);
}

mixin _$GenericsMixin<G, T extends Iterable<G>> {
  $IGenericsCopy<G, T, Generics<G, T>> get copyWith =>
      $GenericsCopy(this as Generics<G, T>, (v) => v);

  @override
  int get hashCode => (this as Generics)._eq().hashCode;

  @override
  bool operator ==(covariant Generics<G, T> other) {
    if (identical(this, other)) return true;
    return other._eq() == (this as Generics)._eq();
  }

  @override
  String toString() => (this as Generics)._eq().toString();
}

abstract interface class $IGenericsCopy<G, T extends Iterable<G>, $R> {
  $R call({
    List<int>? basicGeneric,
    List<T>? genericTemplate,
    List<ImList<ImList<int?>?>>? deepNestedGeneric,
    List<String?>? nullableGeneric,
  });
}

class $GenericsCopy<G, T extends Iterable<G>, $R>
    implements $IGenericsCopy<G, T, $R> {
  const $GenericsCopy(this._value, this._then);

  final Generics<G, T> _value;
  final $R Function(Generics<G, T>) _then;

  @override
  $R call({
    Object? basicGeneric = $undefined,
    Object? genericTemplate = $undefined,
    Object? deepNestedGeneric = $undefined,
    Object? nullableGeneric = $undefined,
  }) {
    return _then(
      Generics<G, T>(
        basicGeneric: $undefined == basicGeneric || basicGeneric == null
            ? _value.basicGeneric
            : ImList(basicGeneric as List<int>),
        genericTemplate:
            $undefined == genericTemplate || genericTemplate == null
            ? _value.genericTemplate
            : ImList(genericTemplate as List<T>),
        deepNestedGeneric: $undefined == deepNestedGeneric
            ? _value.deepNestedGeneric
            : deepNestedGeneric == null
            ? null
            : ImList(deepNestedGeneric as List<ImList<ImList<int?>?>>),
        nullableGeneric:
            $undefined == nullableGeneric || nullableGeneric == null
            ? _value.nullableGeneric
            : ImList(nullableGeneric as List<String?>),
      ),
    );
  }
}
