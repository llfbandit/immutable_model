part of 'index.dart';

@ShouldGenerate(r'''
extension _$BasicClassImExt<T extends Iterable<int>> on BasicClass<T> {
  dynamic _eq() => (optional, immutable, nullableImmutable);
}

mixin _$BasicClassMixin<T extends Iterable<int>> {
  _$IBasicClassCopy<T> get copyWith =>
      _$BasicClassCopy<T>(this as BasicClass<T>);

  @override
  int get hashCode => (this as BasicClass)._eq().hashCode;

  @override
  bool operator ==(covariant BasicClass<T> other) {
    if (identical(this, other)) return true;
    return other._eq() == (this as BasicClass)._eq();
  }

  @override
  String toString() => (this as BasicClass)._eq().toString();
}

abstract interface class _$IBasicClassCopy<T extends Iterable<int>> {
  BasicClass<T> call({String? id, T? optional});
}

class _$BasicClassCopy<T extends Iterable<int>>
    implements _$IBasicClassCopy<T> {
  const _$BasicClassCopy(this._value);

  final BasicClass<T> _value;

  @override
  BasicClass<T> call({
    Object? id = const $ImCopy(),
    Object? optional = const $ImCopy(),
  }) {
    return BasicClass<T>(
      id: const $ImCopy() == id || id == null ? _value.id : id as String,
      optional: const $ImCopy() == optional ? _value.optional : optional as T?,
      immutable: _value.immutable,
      nullableImmutable: _value.nullableImmutable,
    );
  }
}
''')
@ImModel()
class BasicClass<T extends Iterable<int>> {
  const BasicClass({
    required this.id,
    this.optional,
    required this.immutable,
    required this.nullableImmutable,
  });

  @ImField(ignoreEqual: true)
  final String id;
  final T? optional;
  @ImField(ignoreCopy: true)
  final int immutable;
  @ImField(ignoreCopy: true)
  final int? nullableImmutable;
}
