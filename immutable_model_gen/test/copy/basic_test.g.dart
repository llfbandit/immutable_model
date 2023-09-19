// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'basic_test.dart';

// **************************************************************************
// ImmutableModelGenerator
// **************************************************************************

extension $CopyNonOptionalImExt on CopyNonOptional {
  List<Object?> get _$props => [id];

  // ignore: library_private_types_in_public_api
  _$ICopyNonOptionalCopy get copyWith => _$CopyNonOptionalCopy(this);
}

mixin _$CopyNonOptionalMixin implements IEquatable {
  @override
  List<Object?> get props =>
      $CopyNonOptionalImExt(this as CopyNonOptional)._$props;

  @override
  int get hashCode => const Hash().hash(this, props);

  @override
  bool operator ==(Object other) => eq(this, other);
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
      id: id == const $ImCopy() || id == null ? _value.id : id as String,
    );
  }
}

extension $CopyOptionalImExt on CopyOptional {
  List<Object?> get _$props => [id];

  // ignore: library_private_types_in_public_api
  _$ICopyOptionalCopy get copyWith => _$CopyOptionalCopy(this);
}

mixin _$CopyOptionalMixin implements IEquatable {
  @override
  List<Object?> get props => $CopyOptionalImExt(this as CopyOptional)._$props;

  @override
  int get hashCode => const Hash().hash(this, props);

  @override
  bool operator ==(Object other) => eq(this, other);
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
      id: id == const $ImCopy() ? _value.id : id as String?,
    );
  }
}
