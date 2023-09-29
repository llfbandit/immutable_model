// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'im_model_test.dart';

// **************************************************************************
// ImmutableModelGenerator
// **************************************************************************

extension $FooImExt on Foo {
  dynamic _eq() => (id);

  // ignore: library_private_types_in_public_api
  _$IFooCopy get copyWith => _$FooCopy(this);
}

mixin _$FooMixin {
  @override
  int get hashCode => (this as Foo)._eq().hashCode;

  @override
  bool operator ==(covariant Foo other) {
    if (identical(this, other)) return true;
    return other._eq() == (this as Foo)._eq();
  }

  @override
  String toString() => (this as Foo)._eq().toString();
}

abstract interface class _$IFooCopy {
  Foo call({
    String? id,
  });
}

class _$FooCopy implements _$IFooCopy {
  const _$FooCopy(this._value);

  final Foo _value;

  @override
  Foo call({
    Object? id = const $ImCopy(),
  }) {
    return Foo(
      id: const $ImCopy() == id || id == null ? _value.id : id as String,
    );
  }
}

extension $BarImExt on Bar {
  dynamic _eq() => (foo);

  // ignore: library_private_types_in_public_api
  _$IBarCopy get copyWith => _$BarCopy(this);
}

mixin _$BarMixin {
  @override
  int get hashCode => (this as Bar)._eq().hashCode;

  @override
  bool operator ==(covariant Bar other) {
    if (identical(this, other)) return true;
    return other._eq() == (this as Bar)._eq();
  }

  @override
  String toString() => (this as Bar)._eq().toString();
}

abstract interface class _$IBarCopy {
  Bar call({
    Foo? foo,
  });
}

class _$BarCopy implements _$IBarCopy {
  const _$BarCopy(this._value);

  final Bar _value;

  @override
  Bar call({
    Object? foo = const $ImCopy(),
  }) {
    return Bar(
      foo: const $ImCopy() == foo || foo == null ? _value.foo : foo as Foo,
    );
  }
}
