part of 'index.dart';

@ShouldGenerate(r'''
extension _$StaticImExt on Static {
  dynamic _eq() => (id, integer);
}

mixin _$StaticMixin {
  _$IStaticCopy get copyWith => _$StaticCopy(this as Static);

  @override
  int get hashCode => (this as Static)._eq().hashCode;

  @override
  bool operator ==(covariant Static other) {
    if (identical(this, other)) return true;
    return other._eq() == (this as Static)._eq();
  }

  @override
  String toString() => (this as Static)._eq().toString();
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
      id: const $ImCopy() == id || id == null ? _value.id : id as String,
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
