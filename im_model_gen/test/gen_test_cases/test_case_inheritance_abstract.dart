part of 'index.dart';

@ShouldGenerate(r'''
extension _$AbtractChildImExt<T> on AbtractChild<T> {
  dynamic _eq() => (id, aValue, integer);
}

mixin _$AbtractChildMixin<T> {
  $IAbtractChildCopy<T, AbtractChild<T>> get copyWith =>
      $AbtractChildCopy(this as AbtractChild<T>, (v) => v);

  @override
  int get hashCode => (this as AbtractChild)._eq().hashCode;

  @override
  bool operator ==(covariant AbtractChild<T> other) {
    if (identical(this, other)) return true;
    return other._eq() == (this as AbtractChild)._eq();
  }

  @override
  String toString() => (this as AbtractChild)._eq().toString();
}

abstract interface class $IAbtractChildCopy<T, $R> {
  $R call({String? id, T? aValue, int? integer});
}

class $AbtractChildCopy<T, $R> implements $IAbtractChildCopy<T, $R> {
  const $AbtractChildCopy(this._value, this._then);

  final AbtractChild<T> _value;
  final $R Function(AbtractChild<T>) _then;

  @override
  $R call({
    Object? id = $undefined,
    Object? aValue = $undefined,
    Object? integer = $undefined,
  }) {
    return _then(
      AbtractChild<T>(
        $undefined == id || id == null ? _value.id : id as String,
        $undefined == aValue ? _value.aValue : aValue as T?,
        $undefined == integer || integer == null
            ? _value.integer
            : integer as int,
      ),
    );
  }
}
''')
@ImModel()
class AbtractChild<T> extends Abtract<T> {
  const AbtractChild(super.id, super.aValue, this.integer);

  final int integer;
}

@ShouldGenerate(r'''
extension _$AbtractImExt<T> on Abtract<T> {
  dynamic _eq() => (id, aValue);
}

mixin _$AbtractMixin<T> {
  @override
  int get hashCode => (this as Abtract)._eq().hashCode;

  @override
  bool operator ==(covariant Abtract<T> other) {
    if (identical(this, other)) return true;
    return other._eq() == (this as Abtract)._eq();
  }

  @override
  String toString() => (this as Abtract)._eq().toString();
}
''')
@ImModel()
abstract class Abtract<T> {
  const Abtract(this.id, this.aValue);

  @ImField(ignoreCopy: false)
  final String id;
  final T? aValue;
}
