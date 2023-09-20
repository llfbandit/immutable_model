part of 'index.dart';

@ShouldGenerate(r'''
extension $StaticImExt on Static {
  List<Object?> get _$props => [id, integer];

  // ignore: library_private_types_in_public_api
  _$IStaticCopy get copyWith => _$StaticCopy(this);
}

mixin _$StaticMixin implements IEquatable {
  @override
  List<Object?> get props => $StaticImExt(this as Static)._$props;

  @override
  int get hashCode => const Hash().hash(this, props);

  @override
  bool operator ==(Object other) => eq(this, other);
}

abstract interface class _$IStaticCopy {
  Static call({
    String? id,
  });
}

class _$StaticCopy implements _$IStaticCopy {
  const _$StaticCopy(this._value);

  final Static _value;

  @override
  Static call({
    Object? id = const $ImCopy(),
  }) {
    return Static(
      id: id == const $ImCopy() || id == null ? _value.id : id as String,
    );
  }
}
''')
@ImModel()
class Static {
  const Static({required this.id});

  final String id;
  final int integer = 0;

  static const values = <int>[1, 2, 3];

  static const foo = '';
}
