// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nullability_test.dart';

// **************************************************************************
// ImmutableModelGenerator
// **************************************************************************

extension _$TestNullabilityImExt on TestNullability {
  dynamic _eq() => (dynField, coll);
}

mixin _$TestNullabilityMixin {
  $ITestNullabilityCopy<TestNullability> get copyWith =>
      $TestNullabilityCopy(this as TestNullability, (v) => v);

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

abstract interface class $ITestNullabilityCopy<$R> {
  $R call({dynamic dynField, List<int>? coll});
}

class $TestNullabilityCopy<$R> implements $ITestNullabilityCopy<$R> {
  const $TestNullabilityCopy(this._value, this._then);

  final TestNullability _value;
  final $R Function(TestNullability) _then;

  @override
  $R call({Object? dynField = $undefined, Object? coll = $undefined}) {
    return _then(
      TestNullability(
        $undefined == dynField || dynField == null
            ? _value.dynField
            : dynField as dynamic,
        $undefined == coll || coll == null
            ? _value.coll
            : ImList(coll as List<int>),
      ),
    );
  }
}
