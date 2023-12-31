// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generic_test.dart';

// **************************************************************************
// ImmutableModelGenerator
// **************************************************************************

extension $GenericsImExt<G, T extends Iterable<G>> on Generics<G, T> {
  dynamic _eq() =>
      (basicGeneric, genericTemplate, nullableGeneric, deepNestedGeneric);

  // ignore: library_private_types_in_public_api
  _$IGenericsCopy<G, T> get copyWith => _$GenericsCopy<G, T>(this);
}

mixin _$GenericsMixin<G, T extends Iterable<G>> {
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

abstract interface class _$IGenericsCopy<G, T extends Iterable<G>> {
  Generics<G, T> call({
    List<int>? basicGeneric,
    List<T>? genericTemplate,
    List<ImList<ImList<int?>?>>? deepNestedGeneric,
    List<String?>? nullableGeneric,
  });
}

class _$GenericsCopy<G, T extends Iterable<G>>
    implements _$IGenericsCopy<G, T> {
  const _$GenericsCopy(this._value);

  final Generics<G, T> _value;

  @override
  Generics<G, T> call({
    Object? basicGeneric = const $ImCopy(),
    Object? genericTemplate = const $ImCopy(),
    Object? deepNestedGeneric = const $ImCopy(),
    Object? nullableGeneric = const $ImCopy(),
  }) {
    return Generics<G, T>(
      basicGeneric: const $ImCopy() == basicGeneric || basicGeneric == null
          ? _value.basicGeneric
          : ImList(basicGeneric as List<int>),
      genericTemplate:
          const $ImCopy() == genericTemplate || genericTemplate == null
              ? _value.genericTemplate
              : ImList(genericTemplate as List<T>),
      deepNestedGeneric: const $ImCopy() == deepNestedGeneric
          ? _value.deepNestedGeneric
          : deepNestedGeneric == null
              ? null
              : ImList(deepNestedGeneric as List<ImList<ImList<int?>?>>),
      nullableGeneric:
          const $ImCopy() == nullableGeneric || nullableGeneric == null
              ? _value.nullableGeneric
              : ImList(nullableGeneric as List<String?>),
    );
  }
}
