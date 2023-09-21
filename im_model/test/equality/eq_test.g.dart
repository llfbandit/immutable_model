// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'eq_test.dart';

// **************************************************************************
// ImmutableModelGenerator
// **************************************************************************

extension $GenericImExt<T extends Object> on Generic<T> {
  List<Object?> get _$props => [value];

  // ignore: library_private_types_in_public_api
  _$IGenericCopy<T> get copyWith => _$GenericCopy<T>(this);
}

mixin _$GenericMixin implements IEquatable {
  @override
  List<Object?> get props => $GenericImExt(this as Generic)._$props;

  @override
  int get hashCode => const Hash().hash(this, props);

  @override
  bool operator ==(Object other) => eq(this, other);
}

abstract interface class _$IGenericCopy<T extends Object> {
  Generic<T> call({
    T? value,
  });
}

class _$GenericCopy<T extends Object> implements _$IGenericCopy<T> {
  const _$GenericCopy(this._value);

  final Generic<T> _value;

  @override
  Generic<T> call({
    Object? value = const $ImCopy(),
  }) {
    return Generic<T>(
      value == const $ImCopy() || value == null ? _value.value : value as T,
    );
  }
}

extension $OtherImExt on Other {
  List<Object?> get _$props => [data];

  // ignore: library_private_types_in_public_api
  _$IOtherCopy get copyWith => _$OtherCopy(this);
}

mixin _$OtherMixin implements IEquatable {
  @override
  List<Object?> get props => $OtherImExt(this as Other)._$props;

  @override
  int get hashCode => const Hash().hash(this, props);

  @override
  bool operator ==(Object other) => eq(this, other);
}

abstract interface class _$IOtherCopy {
  Other call({
    String? data,
  });
}

class _$OtherCopy implements _$IOtherCopy {
  const _$OtherCopy(this._value);

  final Other _value;

  @override
  Other call({
    Object? data = const $ImCopy(),
  }) {
    return Other(
      data == const $ImCopy() || data == null ? _value.data : data as String,
    );
  }
}

extension $ComplexImExt on Complex {
  List<Object?> get _$props => [name, age, hairColor, children];

  // ignore: library_private_types_in_public_api
  _$IComplexCopy get copyWith => _$ComplexCopy(this);
}

mixin _$ComplexMixin implements IEquatable {
  @override
  List<Object?> get props => $ComplexImExt(this as Complex)._$props;

  @override
  int get hashCode => const Hash().hash(this, props);

  @override
  bool operator ==(Object other) => eq(this, other);
}

abstract interface class _$IComplexCopy {
  Complex call({
    String? name,
    int? age,
    Color? hairColor,
    List<String>? children,
  });
}

class _$ComplexCopy implements _$IComplexCopy {
  const _$ComplexCopy(this._value);

  final Complex _value;

  @override
  Complex call({
    Object? name = const $ImCopy(),
    Object? age = const $ImCopy(),
    Object? hairColor = const $ImCopy(),
    Object? children = const $ImCopy(),
  }) {
    return Complex(
      name: name == const $ImCopy() ? _value.name : name as String?,
      age: age == const $ImCopy() ? _value.age : age as int?,
      hairColor:
          hairColor == const $ImCopy() ? _value.hairColor : hairColor as Color?,
      children: children == const $ImCopy()
          ? _value.children
          : children == null
              ? null
              : ImList(children as List<String>),
    );
  }
}
