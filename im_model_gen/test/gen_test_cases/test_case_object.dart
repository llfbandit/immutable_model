part of 'index.dart';

@ShouldGenerate(r'''
extension _$CastObjectImExt on CastObject {
  dynamic _eq() => (dyn, obj, objOptional);
}

mixin _$CastObjectMixin {
  _$ICastObjectCopy get copyWith => _$CastObjectCopy(this as CastObject);

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

abstract interface class _$ICastObjectCopy {
  CastObject call({
    Object? obj,
    Object? objOptional,
    dynamic dyn,
  });
}

class _$CastObjectCopy implements _$ICastObjectCopy {
  const _$CastObjectCopy(this._value);

  final CastObject _value;

  @override
  CastObject call({
    Object? obj = const $ImCopy(),
    Object? objOptional = const $ImCopy(),
    Object? dyn = const $ImCopy(),
  }) {
    return CastObject(
      obj: const $ImCopy() == obj || obj == null ? _value.obj : obj,
      objOptional:
          const $ImCopy() == objOptional ? _value.objOptional : objOptional,
      dyn: const $ImCopy() == dyn || dyn == null ? _value.dyn : dyn as dynamic,
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
