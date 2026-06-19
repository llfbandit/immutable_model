part of 'index.dart';

@ShouldGenerate(r'''
extension _$PrivateNamedParametersClassImExt<T extends Iterable<int>>
    on PrivateNamedParametersClass<T> {
  dynamic _eq() => (_optional, _immutable, _nullableImmutable);
}

mixin _$PrivateNamedParametersClassMixin<T extends Iterable<int>> {
  _$IPrivateNamedParametersClassCopy<T> get copyWith =>
      _$PrivateNamedParametersClassCopy<T>(
        this as PrivateNamedParametersClass<T>,
      );

  @override
  int get hashCode => (this as PrivateNamedParametersClass)._eq().hashCode;

  @override
  bool operator ==(covariant PrivateNamedParametersClass<T> other) {
    if (identical(this, other)) return true;
    return other._eq() == (this as PrivateNamedParametersClass)._eq();
  }

  @override
  String toString() => (this as PrivateNamedParametersClass)._eq().toString();
}

abstract interface class _$IPrivateNamedParametersClassCopy<
  T extends Iterable<int>
> {
  PrivateNamedParametersClass<T> call({String? id, T? optional});
}

class _$PrivateNamedParametersClassCopy<T extends Iterable<int>>
    implements _$IPrivateNamedParametersClassCopy<T> {
  const _$PrivateNamedParametersClassCopy(this._value);

  final PrivateNamedParametersClass<T> _value;

  @override
  PrivateNamedParametersClass<T> call({
    Object? id = const $ImCopy(),
    Object? optional = const $ImCopy(),
  }) {
    return PrivateNamedParametersClass<T>(
      id: const $ImCopy() == id || id == null ? _value._id : id as String,
      optional: const $ImCopy() == optional ? _value._optional : optional as T?,
      immutable: _value._immutable,
      nullableImmutable: _value._nullableImmutable,
    );
  }
}
''')
@ImModel()
class PrivateNamedParametersClass<T extends Iterable<int>> {
  const PrivateNamedParametersClass({
    required this._id,
    this._optional,
    required this._immutable,
    required this._nullableImmutable,
  });

  @ImField(ignoreEqual: true)
  final String _id;
  final T? _optional;
  @ImField(ignoreCopy: true)
  final int _immutable;
  @ImField(ignoreCopy: true)
  final int? _nullableImmutable;

  @override
  String toString() {
    return 'PrivateNamedParametersClass(_id: $_id, _optional: $_optional, _immutable: $_immutable, _nullableImmutable: $_nullableImmutable)';
  }
}
