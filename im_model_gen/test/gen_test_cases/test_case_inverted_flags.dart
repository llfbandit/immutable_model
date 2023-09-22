part of 'index.dart';

@ShouldGenerate(r'''
extension $InvertedImExt<T> on Inverted<T> {
  List<Object?> get _$props => [id];

  // ignore: library_private_types_in_public_api
  _$IInvertedCopy<T> get copyWith => _$InvertedCopy<T>(this);
}

mixin _$InvertedMixin implements IEquatable {
  @override
  List<Object?> get props => $InvertedImExt(this as Inverted)._$props;

  @override
  int get hashCode => const Hash().hash(this, props);

  @override
  bool operator ==(Object other) => eq(this, other);

  @override
  String toString() {
    return 'Inverted(id: ${props[0]})';
  }
}

abstract interface class _$IInvertedCopy<T> {
  Inverted<T> call({
    T? aValue,
  });
}

class _$InvertedCopy<T> implements _$IInvertedCopy<T> {
  const _$InvertedCopy(this._value);

  final Inverted<T> _value;

  @override
  Inverted<T> call({
    Object? aValue = const $ImCopy(),
  }) {
    return Inverted<T>(
      _value.id,
      aValue == const $ImCopy() ? _value.aValue : aValue as T?,
    );
  }
}
''')
@ImModel(ignoreEqual: true, ignoreCopy: true)
class Inverted<T> {
  const Inverted(this.id, this.aValue);

  @ImField(ignoreEqual: false)
  final String id;
  @ImField(ignoreCopy: false)
  final T? aValue;
}
