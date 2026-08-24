part of 'index.dart';

@ShouldGenerate(r'''
extension _$CastObjectImExt on CastObject {
  dynamic _eq() => (dyn, obj, objOptional);
}

mixin _$CastObjectMixin {
  $ICastObjectCopy<CastObject> get copyWith =>
      $CastObjectCopy(this as CastObject, (v) => v);

  @override
  int get hashCode => (this as CastObject)._eq().hashCode;

  @override
  bool operator ==(covariant CastObject other) {
    if (identical(this, other)) return true;
    return other._eq() == (this as CastObject)._eq();
  }

  @override
  String toString() => (this as CastObject)._eq().toString();
}

abstract interface class $ICastObjectCopy<$R> {
  $R call({Object? obj, Object? objOptional, dynamic dyn});
}

class $CastObjectCopy<$R> implements $ICastObjectCopy<$R> {
  const $CastObjectCopy(this._value, this._then);

  final CastObject _value;
  final $R Function(CastObject) _then;

  @override
  $R call({
    Object? obj = $undefined,
    Object? objOptional = $undefined,
    Object? dyn = $undefined,
  }) {
    return _then(
      CastObject(
        obj: $undefined == obj || obj == null ? _value.obj : obj,
        objOptional: $undefined == objOptional
            ? _value.objOptional
            : objOptional,
        dyn: $undefined == dyn || dyn == null ? _value.dyn : dyn as dynamic,
      ),
    );
  }
}
''')
@ImModel()
class CastObject {
  const CastObject({
    required this.obj,
    required this.objOptional,
    required this.dyn,
  });

  final dynamic dyn;
  final Object obj;
  final Object? objOptional;
}
