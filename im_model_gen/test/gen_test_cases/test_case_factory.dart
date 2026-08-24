part of 'index.dart';

@ShouldGenerate(r'''
extension _$FactoryImExt on Factory {
  dynamic _eq() => (coll);
}

mixin _$FactoryMixin {
  $IFactoryCopy<Factory> get copyWith =>
      $FactoryCopy(this as Factory, (v) => v);

  @override
  int get hashCode => (this as Factory)._eq().hashCode;

  @override
  bool operator ==(covariant Factory other) {
    if (identical(this, other)) return true;
    return other._eq() == (this as Factory)._eq();
  }

  @override
  String toString() => (this as Factory)._eq().toString();
}

abstract interface class $IFactoryCopy<$R> {
  $R call({List<String>? coll});
}

class $FactoryCopy<$R> implements $IFactoryCopy<$R> {
  const $FactoryCopy(this._value, this._then);

  final Factory _value;
  final $R Function(Factory) _then;

  @override
  $R call({Object? coll = $undefined}) {
    return _then(
      Factory(
        coll: $undefined == coll || coll == null
            ? _value.coll
            : ImList(coll as List<String>),
      ),
    );
  }
}
''')
@ImModel()
class Factory {
  const Factory({required this.coll});

  factory Factory.from(List<String> coll) {
    return Factory(coll: coll.immut);
  }

  final ImList<String> coll;
}
