part of 'index.dart';

@ShouldGenerate(r'''
extension _$StaticImExt on Static {
  dynamic _eq() => (id, integer);
}

mixin _$StaticMixin {
  $IStaticCopy<Static> get copyWith => $StaticCopy(this as Static, (v) => v);

  @override
  int get hashCode => (this as Static)._eq().hashCode;

  @override
  bool operator ==(covariant Static other) {
    if (identical(this, other)) return true;
    return other._eq() == (this as Static)._eq();
  }

  @override
  String toString() => (this as Static)._eq().toString();
}

abstract interface class $IStaticCopy<$R> {
  $R call({String? id});
}

class $StaticCopy<$R> implements $IStaticCopy<$R> {
  const $StaticCopy(this._value, this._then);

  final Static _value;
  final $R Function(Static) _then;

  @override
  $R call({Object? id = $undefined}) {
    return _then(
      Static(id: $undefined == id || id == null ? _value.id : id as String),
    );
  }
}
''')
@ImModel()
class Static {
  const Static({required this.id});

  final String id;
  final int integer = 0;

  static const values = <int>[1, 2, 3];

  static const foo = '';
}
