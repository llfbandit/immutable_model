part of 'index.dart';

// Positional primary constructor
@ShouldGenerate(r'''
extension _$PrimaryPositionalImExt on PrimaryPositional {
  dynamic _eq() => (id, value);
}

mixin _$PrimaryPositionalMixin {
  _$IPrimaryPositionalCopy get copyWith =>
      _$PrimaryPositionalCopy(this as PrimaryPositional);

  @override
  int get hashCode => (this as PrimaryPositional)._eq().hashCode;

  @override
  bool operator ==(covariant PrimaryPositional other) {
    if (identical(this, other)) return true;
    return other._eq() == (this as PrimaryPositional)._eq();
  }

  @override
  String toString() => (this as PrimaryPositional)._eq().toString();
}

abstract interface class _$IPrimaryPositionalCopy {
  PrimaryPositional call({String? id, int? value});
}

class _$PrimaryPositionalCopy implements _$IPrimaryPositionalCopy {
  const _$PrimaryPositionalCopy(this._value);

  final PrimaryPositional _value;

  @override
  PrimaryPositional call({
    Object? id = const $ImCopy(),
    Object? value = const $ImCopy(),
  }) {
    return PrimaryPositional(
      const $ImCopy() == id || id == null ? _value.id : id as String,
      const $ImCopy() == value || value == null ? _value.value : value as int,
    );
  }
}
''')
@ImModel()
class PrimaryPositional(final String id, final int value) {}

// Named primary constructor
@ShouldGenerate(r'''
extension _$PrimaryNamedImExt on PrimaryNamed {
  dynamic _eq() => (optional, immutable, nullableImmutable);
}

mixin _$PrimaryNamedMixin {
  _$IPrimaryNamedCopy get copyWith => _$PrimaryNamedCopy(this as PrimaryNamed);

  @override
  int get hashCode => (this as PrimaryNamed)._eq().hashCode;

  @override
  bool operator ==(covariant PrimaryNamed other) {
    if (identical(this, other)) return true;
    return other._eq() == (this as PrimaryNamed)._eq();
  }

  @override
  String toString() => (this as PrimaryNamed)._eq().toString();
}

abstract interface class _$IPrimaryNamedCopy {
  PrimaryNamed call({String? id, int? optional});
}

class _$PrimaryNamedCopy implements _$IPrimaryNamedCopy {
  const _$PrimaryNamedCopy(this._value);

  final PrimaryNamed _value;

  @override
  PrimaryNamed call({
    Object? id = const $ImCopy(),
    Object? optional = const $ImCopy(),
  }) {
    return PrimaryNamed(
      id: const $ImCopy() == id || id == null ? _value.id : id as String,
      optional: const $ImCopy() == optional
          ? _value.optional
          : optional as int?,
      immutable: _value.immutable,
      nullableImmutable: _value.nullableImmutable,
    );
  }
}
''')
@ImModel()
class PrimaryNamed({
  @ImField(ignoreEqual: true) required final String id,
  final int? optional,
  @ImField(ignoreCopy: true) required final int immutable,
  @ImField(ignoreCopy: true) required final int? nullableImmutable,
}) {}
