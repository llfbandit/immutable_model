// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'constructor_test.dart';

// **************************************************************************
// ImmutableModelGenerator
// **************************************************************************

extension $CopyNamedConstructorImExt on CopyNamedConstructor {
  List<Object?> get _$props => [id];

  // ignore: library_private_types_in_public_api
  _$ICopyNamedConstructorCopy get copyWith => _$CopyNamedConstructorCopy(this);
}

mixin _$CopyNamedConstructorMixin implements IEquatable {
  @override
  List<Object?> get props =>
      $CopyNamedConstructorImExt(this as CopyNamedConstructor)._$props;

  @override
  int get hashCode => const Hash().hash(this, props);

  @override
  bool operator ==(Object other) => eq(this, other);

  @override
  String toString() {
    return 'CopyNamedConstructor(id: ${props[0]})';
  }
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
      id: id == const $ImCopy() ? _value.id : id as String?,
    );
  }
}

extension $CopyMultiConstructorsImExt on CopyMultiConstructors {
  List<Object?> get _$props => [id, field];

  // ignore: library_private_types_in_public_api
  _$ICopyMultiConstructorsCopy get copyWith =>
      _$CopyMultiConstructorsCopy(this);
}

mixin _$CopyMultiConstructorsMixin implements IEquatable {
  @override
  List<Object?> get props =>
      $CopyMultiConstructorsImExt(this as CopyMultiConstructors)._$props;

  @override
  int get hashCode => const Hash().hash(this, props);

  @override
  bool operator ==(Object other) => eq(this, other);

  @override
  String toString() {
    return 'CopyMultiConstructors(id: ${props[0]}, field: ${props[1]})';
  }
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
      id: id == const $ImCopy() ? _value.id : id as String?,
      field: field == const $ImCopy() || field == null
          ? _value.field
          : field as String,
    );
  }
}

extension $DefaultValuesConstructorImExt on DefaultValuesConstructor {
  List<Object?> get _$props => [id, field, anotherField];

  // ignore: library_private_types_in_public_api
  _$IDefaultValuesConstructorCopy get copyWith =>
      _$DefaultValuesConstructorCopy(this);
}

mixin _$DefaultValuesConstructorMixin implements IEquatable {
  @override
  List<Object?> get props =>
      $DefaultValuesConstructorImExt(this as DefaultValuesConstructor)._$props;

  @override
  int get hashCode => const Hash().hash(this, props);

  @override
  bool operator ==(Object other) => eq(this, other);

  @override
  String toString() {
    return 'DefaultValuesConstructor(id: ${props[0]}, field: ${props[1]}, anotherField: ${props[2]})';
  }
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
      anotherField: anotherField == const $ImCopy()
          ? _value.anotherField
          : anotherField as String?,
    );
  }
}

extension $PositionedFieldsImExt on PositionedFields {
  List<Object?> get _$props => [pOne, pTwo, namedOne];

  // ignore: library_private_types_in_public_api
  _$IPositionedFieldsCopy get copyWith => _$PositionedFieldsCopy(this);
}

mixin _$PositionedFieldsMixin implements IEquatable {
  @override
  List<Object?> get props =>
      $PositionedFieldsImExt(this as PositionedFields)._$props;

  @override
  int get hashCode => const Hash().hash(this, props);

  @override
  bool operator ==(Object other) => eq(this, other);

  @override
  String toString() {
    return 'PositionedFields(pOne: ${props[0]}, pTwo: ${props[1]}, namedOne: ${props[2]})';
  }
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
      pOne == const $ImCopy() || pOne == null ? _value.pOne : pOne as String,
      pTwo == const $ImCopy() || pTwo == null ? _value.pTwo : pTwo as String,
      namedOne:
          namedOne == const $ImCopy() ? _value.namedOne : namedOne as String?,
    );
  }
}
