// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'im_model_test.dart';

// **************************************************************************
// ImmutableModelGenerator
// **************************************************************************

extension _$FooImExt on Foo {
  dynamic _eq() => (id);
}

mixin _$FooMixin {
  $IFooCopy<Foo> get copyWith => $FooCopy(this as Foo, (v) => v);

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

abstract interface class $IFooCopy<$R> {
  $R call({String? id});
}

class $FooCopy<$R> implements $IFooCopy<$R> {
  const $FooCopy(this._value, this._then);

  final Foo _value;
  final $R Function(Foo) _then;

  @override
  $R call({Object? id = $undefined}) {
    return _then(
      Foo(id: $undefined == id || id == null ? _value.id : id as String),
    );
  }
}

extension _$BarImExt on Bar {
  dynamic _eq() => (foo);
}

mixin _$BarMixin {
  $IBarCopy<Bar> get copyWith => $BarCopy(this as Bar, (v) => v);

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

abstract interface class $IBarCopy<$R> {
  $R call({Foo? foo});
  $IFooCopy<$R> get foo;
}

class $BarCopy<$R> implements $IBarCopy<$R> {
  const $BarCopy(this._value, this._then);

  final Bar _value;
  final $R Function(Bar) _then;

  @override
  $R call({Object? foo = $undefined}) {
    return _then(
      Bar(foo: $undefined == foo || foo == null ? _value.foo : foo as Foo),
    );
  }

  @override
  $IFooCopy<$R> get foo =>
      $FooCopy(_value.foo, (v) => _then(_value.copyWith(foo: v)));
}
