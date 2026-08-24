// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'eq_test.dart';

// **************************************************************************
// ImmutableModelGenerator
// **************************************************************************

extension _$GenericImExt<T extends Object> on Generic<T> {
  dynamic _eq() => (value);
}

mixin _$GenericMixin<T extends Object> {
  $IGenericCopy<T, Generic<T>> get copyWith =>
      $GenericCopy(this as Generic<T>, (v) => v);

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

abstract interface class $IGenericCopy<T extends Object, $R> {
  $R call({T? value});
}

class $GenericCopy<T extends Object, $R> implements $IGenericCopy<T, $R> {
  const $GenericCopy(this._value, this._then);

  final Generic<T> _value;
  final $R Function(Generic<T>) _then;

  @override
  $R call({Object? value = $undefined}) {
    return _then(
      Generic<T>(
        $undefined == value || value == null ? _value.value : value as T,
      ),
    );
  }
}

extension _$OtherImExt on Other {
  dynamic _eq() => (data);
}

mixin _$OtherMixin {
  $IOtherCopy<Other> get copyWith => $OtherCopy(this as Other, (v) => v);

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

abstract interface class $IOtherCopy<$R> {
  $R call({String? data});
}

class $OtherCopy<$R> implements $IOtherCopy<$R> {
  const $OtherCopy(this._value, this._then);

  final Other _value;
  final $R Function(Other) _then;

  @override
  $R call({Object? data = $undefined}) {
    return _then(
      Other($undefined == data || data == null ? _value.data : data as String),
    );
  }
}

extension _$ComplexImExt on Complex {
  dynamic _eq() => (name, age, hairColor, children);
}

mixin _$ComplexMixin {
  $IComplexCopy<Complex> get copyWith =>
      $ComplexCopy(this as Complex, (v) => v);

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

abstract interface class $IComplexCopy<$R> {
  $R call({String? name, int? age, Color? hairColor, List<String>? children});
}

class $ComplexCopy<$R> implements $IComplexCopy<$R> {
  const $ComplexCopy(this._value, this._then);

  final Complex _value;
  final $R Function(Complex) _then;

  @override
  $R call({
    Object? name = $undefined,
    Object? age = $undefined,
    Object? hairColor = $undefined,
    Object? children = $undefined,
  }) {
    return _then(
      Complex(
        name: $undefined == name ? _value.name : name as String?,
        age: $undefined == age ? _value.age : age as int?,
        hairColor: $undefined == hairColor
            ? _value.hairColor
            : hairColor as Color?,
        children: $undefined == children
            ? _value.children
            : children == null
            ? null
            : ImList(children as List<String>),
      ),
    );
  }
}
