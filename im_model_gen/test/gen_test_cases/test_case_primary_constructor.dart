part of 'index.dart';

// Positional primary constructor
@ShouldGenerate(r'''
extension _$PrimaryPositionalImExt on PrimaryPositional {
  dynamic _eq() => (id, value);
}

mixin _$PrimaryPositionalMixin {
  $IPrimaryPositionalCopy<PrimaryPositional> get copyWith =>
      $PrimaryPositionalCopy(this as PrimaryPositional, (v) => v);

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

abstract interface class $IPrimaryPositionalCopy<$R> {
  $R call({String? id, int? value});
}

class $PrimaryPositionalCopy<$R> implements $IPrimaryPositionalCopy<$R> {
  const $PrimaryPositionalCopy(this._value, this._then);

  final PrimaryPositional _value;
  final $R Function(PrimaryPositional) _then;

  @override
  $R call({Object? id = $undefined, Object? value = $undefined}) {
    return _then(
      PrimaryPositional(
        $undefined == id || id == null ? _value.id : id as String,
        $undefined == value || value == null ? _value.value : value as int,
      ),
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
  $IPrimaryNamedCopy<PrimaryNamed> get copyWith =>
      $PrimaryNamedCopy(this as PrimaryNamed, (v) => v);

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

abstract interface class $IPrimaryNamedCopy<$R> {
  $R call({String? id, int? optional});
}

class $PrimaryNamedCopy<$R> implements $IPrimaryNamedCopy<$R> {
  const $PrimaryNamedCopy(this._value, this._then);

  final PrimaryNamed _value;
  final $R Function(PrimaryNamed) _then;

  @override
  $R call({Object? id = $undefined, Object? optional = $undefined}) {
    return _then(
      PrimaryNamed(
        id: $undefined == id || id == null ? _value.id : id as String,
        optional: $undefined == optional ? _value.optional : optional as int?,
        immutable: _value.immutable,
        nullableImmutable: _value.nullableImmutable,
      ),
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
