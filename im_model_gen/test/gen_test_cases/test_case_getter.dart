part of 'index.dart';

@ShouldGenerate(r'''
extension _$GetterImExt on Getter {
  dynamic _eq() => (id);
}

mixin _$GetterMixin {
  $IGetterCopy<Getter> get copyWith => $GetterCopy(this as Getter, (v) => v);

  @override
  int get hashCode => (this as Getter)._eq().hashCode;

  @override
  bool operator ==(covariant Getter other) {
    if (identical(this, other)) return true;
    return other._eq() == (this as Getter)._eq();
  }

  @override
  String toString() => (this as Getter)._eq().toString();
}

abstract interface class $IGetterCopy<$R> {
  $R call({String? id});
}

class $GetterCopy<$R> implements $IGetterCopy<$R> {
  const $GetterCopy(this._value, this._then);

  final Getter _value;
  final $R Function(Getter) _then;

  @override
  $R call({Object? id = $undefined}) {
    return _then(
      Getter(id: $undefined == id || id == null ? _value.id : id as String),
    );
  }
}
''')
@ImModel()
class Getter {
  const Getter({required this.id});

  final String id;

  bool get isEmpty => id.isEmpty;

  set setter(String name) {}
}
