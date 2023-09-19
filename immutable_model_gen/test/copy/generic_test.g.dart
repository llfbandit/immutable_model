// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generic_test.dart';

// **************************************************************************
// ImmutableModelGenerator
// **************************************************************************

extension $GenericsImExt<G, T extends Iterable<G>> on Generics<G, T> {
  List<Object?> get _$props =>
      [basicGeneric, genericTemplate, nullableGeneric, deepNestedGeneric];

  // ignore: library_private_types_in_public_api
  _$IGenericsCopy<G, T> get copyWith => _$GenericsCopy<G, T>(this);
}

mixin _$GenericsMixin implements IEquatable {
  @override
  List<Object?> get props => $GenericsImExt(this as Generics)._$props;

  @override
  int get hashCode => const Hash().hash(this, props);

  @override
  bool operator ==(Object other) => eq(this, other);
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
      basicGeneric: basicGeneric == const $ImCopy() || basicGeneric == null
          ? _value.basicGeneric
          : ImList(basicGeneric as List<int>),
      genericTemplate:
          genericTemplate == const $ImCopy() || genericTemplate == null
              ? _value.genericTemplate
              : ImList(genericTemplate as List<T>),
      deepNestedGeneric: deepNestedGeneric == const $ImCopy()
          ? _value.deepNestedGeneric
          : deepNestedGeneric == null
              ? null
              : ImList(deepNestedGeneric as List<ImList<ImList<int?>?>>),
      nullableGeneric:
          nullableGeneric == const $ImCopy() || nullableGeneric == null
              ? _value.nullableGeneric
              : ImList(nullableGeneric as List<String?>),
    );
  }
}
