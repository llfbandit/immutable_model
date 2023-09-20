part of 'index.dart';

@ShouldGenerate(r'''
extension $BasicClassImExt<T extends Iterable<int>> on BasicClass<T> {
  List<Object?> get _$props => [optional, immutable, nullableImmutable];

  // ignore: library_private_types_in_public_api
  _$IBasicClassCopy<T> get copyWith => _$BasicClassCopy<T>(this);
}

mixin _$BasicClassMixin implements IEquatable {
  @override
  List<Object?> get props => $BasicClassImExt(this as BasicClass)._$props;

  @override
  int get hashCode => const Hash().hash(this, props);

  @override
  bool operator ==(Object other) => eq(this, other);
}

abstract interface class _$IBasicClassCopy<T extends Iterable<int>> {
  BasicClass<T> call({
    String? id,
    T? optional,
  });
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
      id: id == const $ImCopy() || id == null ? _value.id : id as String,
      optional: optional == const $ImCopy() ? _value.optional : optional as T?,
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
