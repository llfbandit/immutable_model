// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'basic_test.dart';

// **************************************************************************
// ImmutableModelGenerator
// **************************************************************************

extension $CopyNonOptionalImExt on CopyNonOptional {
  dynamic _eq() => (id);

  // ignore: library_private_types_in_public_api
  _$ICopyNonOptionalCopy get copyWith => _$CopyNonOptionalCopy(this);
}

mixin _$CopyNonOptionalMixin {
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

abstract interface class _$ICopyNonOptionalCopy {
  CopyNonOptional call({
    String? id,
  });
}

class _$CopyNonOptionalCopy implements _$ICopyNonOptionalCopy {
  const _$CopyNonOptionalCopy(this._value);

  final CopyNonOptional _value;

  @override
  CopyNonOptional call({
    Object? id = const $ImCopy(),
  }) {
    return CopyNonOptional(
      id: const $ImCopy() == id || id == null ? _value.id : id as String,
    );
  }
}

extension $CopyOptionalImExt on CopyOptional {
  dynamic _eq() => (id);

  // ignore: library_private_types_in_public_api
  _$ICopyOptionalCopy get copyWith => _$CopyOptionalCopy(this);
}

mixin _$CopyOptionalMixin {
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

abstract interface class _$ICopyOptionalCopy {
  CopyOptional call({
    String? id,
  });
}

class _$CopyOptionalCopy implements _$ICopyOptionalCopy {
  const _$CopyOptionalCopy(this._value);

  final CopyOptional _value;

  @override
  CopyOptional call({
    Object? id = const $ImCopy(),
  }) {
    return CopyOptional(
      id: const $ImCopy() == id ? _value.id : id as String?,
    );
  }
}
