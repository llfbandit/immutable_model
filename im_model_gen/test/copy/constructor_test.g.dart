// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'constructor_test.dart';

// **************************************************************************
// ImmutableModelGenerator
// **************************************************************************

extension _$CopyNamedConstructorImExt on CopyNamedConstructor {
  dynamic _eq() => (id);
}

mixin _$CopyNamedConstructorMixin {
  $ICopyNamedConstructorCopy<CopyNamedConstructor> get copyWith =>
      $CopyNamedConstructorCopy(this as CopyNamedConstructor, (v) => v);

  @override
  int get hashCode => (this as CopyNamedConstructor)._eq().hashCode;

  @override
  bool operator ==(covariant CopyNamedConstructor other) {
    if (identical(this, other)) return true;
    return other._eq() == (this as CopyNamedConstructor)._eq();
  }

  @override
  String toString() => (this as CopyNamedConstructor)._eq().toString();
}

abstract interface class $ICopyNamedConstructorCopy<$R> {
  $R call({String? id});
}

class $CopyNamedConstructorCopy<$R> implements $ICopyNamedConstructorCopy<$R> {
  const $CopyNamedConstructorCopy(this._value, this._then);

  final CopyNamedConstructor _value;
  final $R Function(CopyNamedConstructor) _then;

  @override
  $R call({Object? id = $undefined}) {
    return _then(
      CopyNamedConstructor._(id: $undefined == id ? _value.id : id as String?),
    );
  }
}

extension _$CopyMultiConstructorsImExt on CopyMultiConstructors {
  dynamic _eq() => (id, field);
}

mixin _$CopyMultiConstructorsMixin {
  $ICopyMultiConstructorsCopy<CopyMultiConstructors> get copyWith =>
      $CopyMultiConstructorsCopy(this as CopyMultiConstructors, (v) => v);

  @override
  int get hashCode => (this as CopyMultiConstructors)._eq().hashCode;

  @override
  bool operator ==(covariant CopyMultiConstructors other) {
    if (identical(this, other)) return true;
    return other._eq() == (this as CopyMultiConstructors)._eq();
  }

  @override
  String toString() => (this as CopyMultiConstructors)._eq().toString();
}

abstract interface class $ICopyMultiConstructorsCopy<$R> {
  $R call({String? id, String? field});
}

class $CopyMultiConstructorsCopy<$R>
    implements $ICopyMultiConstructorsCopy<$R> {
  const $CopyMultiConstructorsCopy(this._value, this._then);

  final CopyMultiConstructors _value;
  final $R Function(CopyMultiConstructors) _then;

  @override
  $R call({Object? id = $undefined, Object? field = $undefined}) {
    return _then(
      CopyMultiConstructors.first(
        id: $undefined == id ? _value.id : id as String?,
        field: $undefined == field || field == null
            ? _value.field
            : field as String,
      ),
    );
  }
}

extension _$DefaultValuesConstructorImExt on DefaultValuesConstructor {
  dynamic _eq() => (id, field, anotherField);
}

mixin _$DefaultValuesConstructorMixin {
  $IDefaultValuesConstructorCopy<DefaultValuesConstructor> get copyWith =>
      $DefaultValuesConstructorCopy(this as DefaultValuesConstructor, (v) => v);

  @override
  int get hashCode => (this as DefaultValuesConstructor)._eq().hashCode;

  @override
  bool operator ==(covariant DefaultValuesConstructor other) {
    if (identical(this, other)) return true;
    return other._eq() == (this as DefaultValuesConstructor)._eq();
  }

  @override
  String toString() => (this as DefaultValuesConstructor)._eq().toString();
}

abstract interface class $IDefaultValuesConstructorCopy<$R> {
  $R call({String? anotherField});
}

class $DefaultValuesConstructorCopy<$R>
    implements $IDefaultValuesConstructorCopy<$R> {
  const $DefaultValuesConstructorCopy(this._value, this._then);

  final DefaultValuesConstructor _value;
  final $R Function(DefaultValuesConstructor) _then;

  @override
  $R call({Object? anotherField = $undefined}) {
    return _then(
      DefaultValuesConstructor._(
        anotherField: $undefined == anotherField
            ? _value.anotherField
            : anotherField as String?,
      ),
    );
  }
}

extension _$PositionedFieldsImExt on PositionedFields {
  dynamic _eq() => (pOne, pTwo, namedOne);
}

mixin _$PositionedFieldsMixin {
  $IPositionedFieldsCopy<PositionedFields> get copyWith =>
      $PositionedFieldsCopy(this as PositionedFields, (v) => v);

  @override
  int get hashCode => (this as PositionedFields)._eq().hashCode;

  @override
  bool operator ==(covariant PositionedFields other) {
    if (identical(this, other)) return true;
    return other._eq() == (this as PositionedFields)._eq();
  }

  @override
  String toString() => (this as PositionedFields)._eq().toString();
}

abstract interface class $IPositionedFieldsCopy<$R> {
  $R call({String? pOne, String? pTwo, String? namedOne});
}

class $PositionedFieldsCopy<$R> implements $IPositionedFieldsCopy<$R> {
  const $PositionedFieldsCopy(this._value, this._then);

  final PositionedFields _value;
  final $R Function(PositionedFields) _then;

  @override
  $R call({
    Object? pOne = $undefined,
    Object? pTwo = $undefined,
    Object? namedOne = $undefined,
  }) {
    return _then(
      PositionedFields(
        $undefined == pOne || pOne == null ? _value.pOne : pOne as String,
        $undefined == pTwo || pTwo == null ? _value.pTwo : pTwo as String,
        namedOne: $undefined == namedOne
            ? _value.namedOne
            : namedOne as String?,
      ),
    );
  }
}
