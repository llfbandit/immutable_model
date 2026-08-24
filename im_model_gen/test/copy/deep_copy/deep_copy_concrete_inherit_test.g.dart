// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deep_copy_concrete_inherit_test.dart';

// **************************************************************************
// ImmutableModelGenerator
// **************************************************************************

extension _$BaseImExt on Base {
  dynamic _eq() => (id);
}

mixin _$BaseMixin {
  $IBaseCopy<Base> get copyWith => $BaseCopy(this as Base, (v) => v);

  @override
  int get hashCode => (this as Base)._eq().hashCode;

  @override
  bool operator ==(covariant Base other) {
    if (identical(this, other)) return true;
    return other._eq() == (this as Base)._eq();
  }

  @override
  String toString() => (this as Base)._eq().toString();
}

abstract interface class $IBaseCopy<$R> {
  $R call({String? id});
}

class $BaseCopy<$R> implements $IBaseCopy<$R> {
  const $BaseCopy(this._value, this._then);

  final Base _value;
  final $R Function(Base) _then;

  @override
  $R call({Object? id = $undefined}) {
    return _then(
      Base(id: $undefined == id || id == null ? _value.id : id as String),
    );
  }
}

extension _$DerivedImExt on Derived {
  dynamic _eq() => (id, label);
}

mixin _$DerivedMixin {
  $IDerivedCopy<Derived> get copyWith =>
      $DerivedCopy(this as Derived, (v) => v);

  @override
  int get hashCode => (this as Derived)._eq().hashCode;

  @override
  bool operator ==(covariant Derived other) {
    if (identical(this, other)) return true;
    return other._eq() == (this as Derived)._eq();
  }

  @override
  String toString() => (this as Derived)._eq().toString();
}

abstract interface class $IDerivedCopy<$R> implements $IBaseCopy<$R> {
  @override
  $R call({String? id, String? label});
}

class $DerivedCopy<$R> implements $IDerivedCopy<$R> {
  const $DerivedCopy(this._value, this._then);

  final Derived _value;
  final $R Function(Derived) _then;

  @override
  $R call({Object? id = $undefined, Object? label = $undefined}) {
    return _then(
      Derived(
        id: $undefined == id || id == null ? _value.id : id as String,
        label: $undefined == label || label == null
            ? _value.label
            : label as String,
      ),
    );
  }
}
