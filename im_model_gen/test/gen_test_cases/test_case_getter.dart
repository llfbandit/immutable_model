part of 'index.dart';

@ShouldGenerate(r'''
extension $GetterImExt on Getter {
  List<Object?> get _$props => [id];

  // ignore: library_private_types_in_public_api
  _$IGetterCopy get copyWith => _$GetterCopy(this);
}

mixin _$GetterMixin implements IEquatable {
  @override
  List<Object?> get props => $GetterImExt(this as Getter)._$props;

  @override
  int get hashCode => const Hash().hash(this, props);

  @override
  bool operator ==(Object other) => eq(this, other);
}

abstract interface class _$IGetterCopy {
  Getter call({
    String? id,
  });
}

class _$GetterCopy implements _$IGetterCopy {
  const _$GetterCopy(this._value);

  final Getter _value;

  @override
  Getter call({
    Object? id = const $ImCopy(),
  }) {
    return Getter(
      id: id == const $ImCopy() || id == null ? _value.id : id as String,
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
