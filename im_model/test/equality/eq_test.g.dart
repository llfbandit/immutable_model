// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'eq_test.dart';

// **************************************************************************
// ImmutableModelGenerator
// **************************************************************************

extension $GenericImExt<T extends Object> on Generic<T> {
  dynamic _eq() => (value);

  // ignore: library_private_types_in_public_api
  _$IGenericCopy<T> get copyWith => _$GenericCopy<T>(this);
}

mixin _$GenericMixin<T extends Object> {
  @override
  int get hashCode => (this as Generic)._eq().hashCode;

  @override
  bool operator ==(covariant Generic<T> other) {
    if (identical(this, other)) return true;
    return other._eq() == (this as Generic)._eq();
  }

  @override
  String toString() => (this as Generic)._eq().toString();
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
  dynamic _eq() => (data);

  // ignore: library_private_types_in_public_api
  _$IOtherCopy get copyWith => _$OtherCopy(this);
}

mixin _$OtherMixin {
  @override
  int get hashCode => (this as Other)._eq().hashCode;

  @override
  bool operator ==(covariant Other other) {
    if (identical(this, other)) return true;
    return other._eq() == (this as Other)._eq();
  }

  @override
  String toString() => (this as Other)._eq().toString();
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
  dynamic _eq() => (name, age, hairColor, children);

  // ignore: library_private_types_in_public_api
  _$IComplexCopy get copyWith => _$ComplexCopy(this);
}

mixin _$ComplexMixin {
  @override
  int get hashCode => (this as Complex)._eq().hashCode;

  @override
  bool operator ==(covariant Complex other) {
    if (identical(this, other)) return true;
    return other._eq() == (this as Complex)._eq();
  }

  @override
  String toString() => (this as Complex)._eq().toString();
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
