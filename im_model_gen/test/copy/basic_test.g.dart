// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'basic_test.dart';

// **************************************************************************
// ImmutableModelGenerator
// **************************************************************************

extension _$CopyNonOptionalImExt on CopyNonOptional {
  dynamic _eq() => (id);
}

mixin _$CopyNonOptionalMixin {
  $ICopyNonOptionalCopy<CopyNonOptional> get copyWith =>
      $CopyNonOptionalCopy(this as CopyNonOptional, (v) => v);

  @override
  int get hashCode => (this as CopyNonOptional)._eq().hashCode;

  @override
  bool operator ==(covariant CopyNonOptional other) {
    if (identical(this, other)) return true;
    return other._eq() == (this as CopyNonOptional)._eq();
  }

  @override
  String toString() => (this as CopyNonOptional)._eq().toString();
}

abstract interface class $ICopyNonOptionalCopy<$R> {
  $R call({String? id});
}

class $CopyNonOptionalCopy<$R> implements $ICopyNonOptionalCopy<$R> {
  const $CopyNonOptionalCopy(this._value, this._then);

  final CopyNonOptional _value;
  final $R Function(CopyNonOptional) _then;

  @override
  $R call({Object? id = $undefined}) {
    return _then(
      CopyNonOptional(
        id: $undefined == id || id == null ? _value.id : id as String,
      ),
    );
  }
}

extension _$CopyOptionalImExt on CopyOptional {
  dynamic _eq() => (id);
}

mixin _$CopyOptionalMixin {
  $ICopyOptionalCopy<CopyOptional> get copyWith =>
      $CopyOptionalCopy(this as CopyOptional, (v) => v);

  @override
  int get hashCode => (this as CopyOptional)._eq().hashCode;

  @override
  bool operator ==(covariant CopyOptional other) {
    if (identical(this, other)) return true;
    return other._eq() == (this as CopyOptional)._eq();
  }

  @override
  String toString() => (this as CopyOptional)._eq().toString();
}

abstract interface class $ICopyOptionalCopy<$R> {
  $R call({String? id});
}

class $CopyOptionalCopy<$R> implements $ICopyOptionalCopy<$R> {
  const $CopyOptionalCopy(this._value, this._then);

  final CopyOptional _value;
  final $R Function(CopyOptional) _then;

  @override
  $R call({Object? id = $undefined}) {
    return _then(
      CopyOptional(id: $undefined == id ? _value.id : id as String?),
    );
  }
}
