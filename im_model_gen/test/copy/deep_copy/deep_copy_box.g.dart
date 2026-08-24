// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deep_copy_box.dart';

// **************************************************************************
// ImmutableModelGenerator
// **************************************************************************

extension _$BoxImExt<T> on Box<T> {
  dynamic _eq() => (value);
}

mixin _$BoxMixin<T> {
  $IBoxCopy<T, Box<T>> get copyWith => $BoxCopy(this as Box<T>, (v) => v);

  @override
  int get hashCode => (this as Box)._eq().hashCode;

  @override
  bool operator ==(covariant Box<T> other) {
    if (identical(this, other)) return true;
    return other._eq() == (this as Box)._eq();
  }

  @override
  String toString() => (this as Box)._eq().toString();
}

abstract interface class $IBoxCopy<T, $R> {
  $R call({T? value});
}

class $BoxCopy<T, $R> implements $IBoxCopy<T, $R> {
  const $BoxCopy(this._value, this._then);

  final Box<T> _value;
  final $R Function(Box<T>) _then;

  @override
  $R call({Object? value = $undefined}) {
    return _then(
      Box<T>(
        value: $undefined == value || value == null ? _value.value : value as T,
      ),
    );
  }
}
