// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nullability_test.dart';

// **************************************************************************
// ImmutableModelGenerator
// **************************************************************************

extension $TestNullabilityImExt on TestNullability {
  List<Object?> get _$props => [dynField, coll];

  // ignore: library_private_types_in_public_api
  _$ITestNullabilityCopy get copyWith => _$TestNullabilityCopy(this);
}

mixin _$TestNullabilityMixin implements IEquatable {
  @override
  List<Object?> get props =>
      $TestNullabilityImExt(this as TestNullability)._$props;

  @override
  int get hashCode => const Hash().hash(this, props);

  @override
  bool operator ==(Object other) => eq(this, other);

  @override
  String toString() {
    return 'TestNullability(dynField: ${props[0]}, coll: ${props[1]})';
  }
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
      dynField == const $ImCopy() || dynField == null
          ? _value.dynField
          : dynField as dynamic,
      coll == const $ImCopy() || coll == null
          ? _value.coll
          : ImList(coll as List<int>),
    );
  }
}
