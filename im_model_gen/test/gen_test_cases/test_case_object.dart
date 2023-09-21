part of 'index.dart';

@ShouldGenerate(r'''
extension $CastObjectImExt on CastObject {
  List<Object?> get _$props => [dyn, obj, objOptional];

  // ignore: library_private_types_in_public_api
  _$ICastObjectCopy get copyWith => _$CastObjectCopy(this);
}

mixin _$CastObjectMixin implements IEquatable {
  @override
  List<Object?> get props => $CastObjectImExt(this as CastObject)._$props;

  @override
  int get hashCode => const Hash().hash(this, props);

  @override
  bool operator ==(Object other) => eq(this, other);
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
