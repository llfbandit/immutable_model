part of 'index.dart';

@ShouldGenerate(r'''
extension $InvertedImExt<T> on Inverted<T> {
  dynamic _eq() => (id);

  // ignore: library_private_types_in_public_api
  _$IInvertedCopy<T> get copyWith => _$InvertedCopy<T>(this);
}

mixin _$InvertedMixin<T> {
  @override
  int get hashCode => (this as Inverted)._eq().hashCode;

  @override
  bool operator ==(covariant Inverted<T> other) {
    if (identical(this, other)) return true;
    return other._eq() == (this as Inverted)._eq();
  }

  @override
  String toString() => (this as Inverted)._eq().toString();
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
