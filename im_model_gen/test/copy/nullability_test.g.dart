// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nullability_test.dart';

// **************************************************************************
// ImmutableModelGenerator
// **************************************************************************

extension $TestNullabilityImExt on TestNullability {
  dynamic _eq() => (dynField, coll);

  // ignore: library_private_types_in_public_api
  _$ITestNullabilityCopy get copyWith => _$TestNullabilityCopy(this);
}

mixin _$TestNullabilityMixin {
  @override
  int get hashCode => (this as TestNullability)._eq().hashCode;

  @override
  bool operator ==(covariant TestNullability other) {
    if (identical(this, other)) return true;
    return other._eq() == (this as TestNullability)._eq();
  }

  @override
  String toString() => (this as TestNullability)._eq().toString();
}

abstract interface class _$ITestNullabilityCopy {
  TestNullability call({
    dynamic dynField,
    List<int>? coll,
  });
}

class _$TestNullabilityCopy implements _$ITestNullabilityCopy {
  const _$TestNullabilityCopy(this._value);

  final TestNullability _value;

  @override
  TestNullability call({
    Object? dynField = const $ImCopy(),
    Object? coll = const $ImCopy(),
  }) {
    return TestNullability(
      const $ImCopy() == dynField || dynField == null
          ? _value.dynField
          : dynField as dynamic,
      const $ImCopy() == coll || coll == null
          ? _value.coll
          : ImList(coll as List<int>),
    );
  }
}
