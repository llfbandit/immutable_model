part of 'index.dart';

@ShouldGenerate(r'''
extension $GetterImExt on Getter {
  dynamic _eq() => (id);

  // ignore: library_private_types_in_public_api
  _$IGetterCopy get copyWith => _$GetterCopy(this);
}

mixin _$GetterMixin {
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
      id: const $ImCopy() == id || id == null ? _value.id : id as String,
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
