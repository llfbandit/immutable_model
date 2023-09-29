part of 'index.dart';

@ShouldGenerate(r'''
extension $FactoryImExt on Factory {
  dynamic _eq() => (coll);

  // ignore: library_private_types_in_public_api
  _$IFactoryCopy get copyWith => _$FactoryCopy(this);
}

mixin _$FactoryMixin {
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
      coll: const $ImCopy() == coll || coll == null
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
