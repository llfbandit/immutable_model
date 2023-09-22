part of 'index.dart';

@ShouldGenerate(
    r'''
extension $FactoryImExt on Factory {
  List<Object?> get _$props => [coll];

  // ignore: library_private_types_in_public_api
  _$IFactoryCopy get copyWith => _$FactoryCopy(this);
}

mixin _$FactoryMixin implements IEquatable {
  @override
  List<Object?> get props => $FactoryImExt(this as Factory)._$props;

  @override
  int get hashCode => const Hash().hash(this, props);

  @override
  bool operator ==(Object other) => eq(this, other);

  @override
  String toString() {
    return 'Factory(coll: ${props[0]})';
  }
}

abstract interface class _$IFactoryCopy {
  Factory call({
    List<String>? coll,
  });
}

class _$FactoryCopy implements _$IFactoryCopy {
  const _$FactoryCopy(this._value);

  final Factory _value;

  @override
  Factory call({
    Object? coll = const $ImCopy(),
  }) {
    return Factory(
      coll: coll == const $ImCopy() || coll == null
          ? _value.coll
          : ImList(coll as List<String>),
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
