part of 'index.dart';

@ShouldGenerate(r'''
extension _$BasicClassImExt<T extends Iterable<int>> on BasicClass<T> {
  dynamic _eq() => (optional, immutable, nullableImmutable);
}

mixin _$BasicClassMixin<T extends Iterable<int>> {
  $IBasicClassCopy<T, BasicClass<T>> get copyWith =>
      $BasicClassCopy(this as BasicClass<T>, (v) => v);

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

abstract interface class $IBasicClassCopy<T extends Iterable<int>, $R> {
  $R call({String? id, T? optional});
}

class $BasicClassCopy<T extends Iterable<int>, $R>
    implements $IBasicClassCopy<T, $R> {
  const $BasicClassCopy(this._value, this._then);

  final BasicClass<T> _value;
  final $R Function(BasicClass<T>) _then;

  @override
  $R call({Object? id = $undefined, Object? optional = $undefined}) {
    return _then(
      BasicClass<T>(
        id: $undefined == id || id == null ? _value.id : id as String,
        optional: $undefined == optional ? _value.optional : optional as T?,
        immutable: _value.immutable,
        nullableImmutable: _value.nullableImmutable,
      ),
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
