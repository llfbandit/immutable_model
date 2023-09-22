part of 'index.dart';

@ShouldGenerate(r'''
extension $AbtractImExt<T> on Abtract<T> {
  List<Object?> get _$props => [id, aValue];
}

mixin _$AbtractMixin implements IEquatable {
  @override
  List<Object?> get props => $AbtractImExt(this as Abtract)._$props;

  @override
  int get hashCode => const Hash().hash(this, props);

  @override
  bool operator ==(Object other) => eq(this, other);

  @override
  String toString() {
    return 'Abtract(id: ${props[0]}, aValue: ${props[1]})';
  }
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
extension $AbtractChildImExt<T> on AbtractChild<T> {
  List<Object?> get _$props => [integer];

  // ignore: library_private_types_in_public_api
  _$IAbtractChildCopy<T> get copyWith => _$AbtractChildCopy<T>(this);
}

mixin _$AbtractChildMixin on IEquatable {
  @override
  List<Object?> get props =>
      [...super.props, ...$AbtractChildImExt(this as AbtractChild)._$props];

  @override
  int get hashCode => const Hash().hash(this, props);

  @override
  bool operator ==(Object other) => eq(this, other);

  @override
  String toString() {
    return 'AbtractChild(integer: ${props[0]})';
  }
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
      id == const $ImCopy() || id == null ? _value.id : id as String,
      aValue == const $ImCopy() ? _value.aValue : aValue as T?,
      integer == const $ImCopy() || integer == null
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
