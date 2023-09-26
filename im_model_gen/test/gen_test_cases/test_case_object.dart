part of 'index.dart';

@ShouldGenerate(r'''
extension $CastObjectImExt on CastObject {
  dynamic _eq() => (dyn, obj, objOptional);

  // ignore: library_private_types_in_public_api
  _$ICastObjectCopy get copyWith => _$CastObjectCopy(this);
}

mixin _$CastObjectMixin {
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
      obj: obj == const $ImCopy() || obj == null ? _value.obj : obj,
      objOptional:
          objOptional == const $ImCopy() ? _value.objOptional : objOptional,
      dyn: dyn == const $ImCopy() || dyn == null ? _value.dyn : dyn as dynamic,
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
