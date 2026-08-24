part of 'index.dart';

@ShouldGenerate(r'''
extension _$InvertedImExt<T> on Inverted<T> {
  dynamic _eq() => (id);
}

mixin _$InvertedMixin<T> {
  $IInvertedCopy<T, Inverted<T>> get copyWith =>
      $InvertedCopy(this as Inverted<T>, (v) => v);

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

abstract interface class $IInvertedCopy<T, $R> {
  $R call({T? aValue});
}

class $InvertedCopy<T, $R> implements $IInvertedCopy<T, $R> {
  const $InvertedCopy(this._value, this._then);

  final Inverted<T> _value;
  final $R Function(Inverted<T>) _then;

  @override
  $R call({Object? aValue = $undefined}) {
    return _then(
      Inverted<T>(
        _value.id,
        $undefined == aValue ? _value.aValue : aValue as T?,
      ),
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
