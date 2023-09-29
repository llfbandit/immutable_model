// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'constructor_test.dart';

// **************************************************************************
// ImmutableModelGenerator
// **************************************************************************

extension $CopyNamedConstructorImExt on CopyNamedConstructor {
  dynamic _eq() => (id);

  // ignore: library_private_types_in_public_api
  _$ICopyNamedConstructorCopy get copyWith => _$CopyNamedConstructorCopy(this);
}

mixin _$CopyNamedConstructorMixin {
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

abstract interface class _$ICopyNamedConstructorCopy {
  CopyNamedConstructor call({
    String? id,
  });
}

class _$CopyNamedConstructorCopy implements _$ICopyNamedConstructorCopy {
  const _$CopyNamedConstructorCopy(this._value);

  final CopyNamedConstructor _value;

  @override
  CopyNamedConstructor call({
    Object? id = const $ImCopy(),
  }) {
    return CopyNamedConstructor._(
      id: const $ImCopy() == id ? _value.id : id as String?,
    );
  }
}

extension $CopyMultiConstructorsImExt on CopyMultiConstructors {
  dynamic _eq() => (id, field);

  // ignore: library_private_types_in_public_api
  _$ICopyMultiConstructorsCopy get copyWith =>
      _$CopyMultiConstructorsCopy(this);
}

mixin _$CopyMultiConstructorsMixin {
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

abstract interface class _$ICopyMultiConstructorsCopy {
  CopyMultiConstructors call({
    String? id,
    String? field,
  });
}

class _$CopyMultiConstructorsCopy implements _$ICopyMultiConstructorsCopy {
  const _$CopyMultiConstructorsCopy(this._value);

  final CopyMultiConstructors _value;

  @override
  CopyMultiConstructors call({
    Object? id = const $ImCopy(),
    Object? field = const $ImCopy(),
  }) {
    return CopyMultiConstructors.first(
      id: const $ImCopy() == id ? _value.id : id as String?,
      field: const $ImCopy() == field || field == null
          ? _value.field
          : field as String,
    );
  }
}

extension $DefaultValuesConstructorImExt on DefaultValuesConstructor {
  dynamic _eq() => (id, field, anotherField);

  // ignore: library_private_types_in_public_api
  _$IDefaultValuesConstructorCopy get copyWith =>
      _$DefaultValuesConstructorCopy(this);
}

mixin _$DefaultValuesConstructorMixin {
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

abstract interface class _$IDefaultValuesConstructorCopy {
  DefaultValuesConstructor call({
    String? anotherField,
  });
}

class _$DefaultValuesConstructorCopy
    implements _$IDefaultValuesConstructorCopy {
  const _$DefaultValuesConstructorCopy(this._value);

  final DefaultValuesConstructor _value;

  @override
  DefaultValuesConstructor call({
    Object? anotherField = const $ImCopy(),
  }) {
    return DefaultValuesConstructor._(
      anotherField: const $ImCopy() == anotherField
          ? _value.anotherField
          : anotherField as String?,
    );
  }
}

extension $PositionedFieldsImExt on PositionedFields {
  dynamic _eq() => (pOne, pTwo, namedOne);

  // ignore: library_private_types_in_public_api
  _$IPositionedFieldsCopy get copyWith => _$PositionedFieldsCopy(this);
}

mixin _$PositionedFieldsMixin {
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

abstract interface class _$IPositionedFieldsCopy {
  PositionedFields call({
    String? pOne,
    String? pTwo,
    String? namedOne,
  });
}

class _$PositionedFieldsCopy implements _$IPositionedFieldsCopy {
  const _$PositionedFieldsCopy(this._value);

  final PositionedFields _value;

  @override
  PositionedFields call({
    Object? pOne = const $ImCopy(),
    Object? pTwo = const $ImCopy(),
    Object? namedOne = const $ImCopy(),
  }) {
    return PositionedFields(
      const $ImCopy() == pOne || pOne == null ? _value.pOne : pOne as String,
      const $ImCopy() == pTwo || pTwo == null ? _value.pTwo : pTwo as String,
      namedOne:
          const $ImCopy() == namedOne ? _value.namedOne : namedOne as String?,
    );
  }
}
