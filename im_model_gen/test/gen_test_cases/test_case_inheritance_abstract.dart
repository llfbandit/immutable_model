part of 'index.dart';

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

@ShouldGenerate(r'''
extension _$AbtractChildImExt<T> on AbtractChild<T> {
  dynamic _eq() => (id, aValue, integer);
}

mixin _$AbtractChildMixin<T> {
  _$IAbtractChildCopy<T> get copyWith =>
      _$AbtractChildCopy<T>(this as AbtractChild<T>);

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

abstract interface class _$IAbtractChildCopy<T> {
  AbtractChild<T> call({
    String? id,
    T? aValue,
    int? integer,
  });
}

class _$AbtractChildCopy<T> implements _$IAbtractChildCopy<T> {
  const _$AbtractChildCopy(this._value);

  final AbtractChild<T> _value;

  @override
  AbtractChild<T> call({
    Object? id = const $ImCopy(),
    Object? aValue = const $ImCopy(),
    Object? integer = const $ImCopy(),
  }) {
    return AbtractChild<T>(
      const $ImCopy() == id || id == null ? _value.id : id as String,
      const $ImCopy() == aValue ? _value.aValue : aValue as T?,
      const $ImCopy() == integer || integer == null
          ? _value.integer
          : integer as int,
    );
  }
}
''')
@ImModel()
class AbtractChild<T> extends Abtract<T> {
  const AbtractChild(super.id, super.aValue, this.integer);

  final int integer;
}
