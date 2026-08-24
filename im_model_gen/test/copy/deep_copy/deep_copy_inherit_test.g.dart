// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deep_copy_inherit_test.dart';

// **************************************************************************
// ImmutableModelGenerator
// **************************************************************************

extension _$HasContactImExt on HasContact {
  dynamic _eq() => (contact);
}

mixin _$HasContactMixin {
  @override
  int get hashCode => (this as HasContact)._eq().hashCode;

  @override
  bool operator ==(covariant HasContact other) {
    if (identical(this, other)) return true;
    return other._eq() == (this as HasContact)._eq();
  }

  @override
  String toString() => (this as HasContact)._eq().toString();
}

extension _$ProducerImExt on Producer {
  dynamic _eq() => (contact, role);
}

mixin _$ProducerMixin {
  $IProducerCopy<Producer> get copyWith =>
      $ProducerCopy(this as Producer, (v) => v);

  @override
  int get hashCode => (this as Producer)._eq().hashCode;

  @override
  bool operator ==(covariant Producer other) {
    if (identical(this, other)) return true;
    return other._eq() == (this as Producer)._eq();
  }

  @override
  String toString() => (this as Producer)._eq().toString();
}

abstract interface class $IProducerCopy<$R> {
  $R call({Contact? contact, String? role});
  $IContactCopy<$R> get contact;
}

class $ProducerCopy<$R> implements $IProducerCopy<$R> {
  const $ProducerCopy(this._value, this._then);

  final Producer _value;
  final $R Function(Producer) _then;

  @override
  $R call({Object? contact = $undefined, Object? role = $undefined}) {
    return _then(
      Producer(
        contact: $undefined == contact || contact == null
            ? _value.contact
            : contact as Contact,
        role: $undefined == role || role == null ? _value.role : role as String,
      ),
    );
  }

  @override
  $IContactCopy<$R> get contact =>
      $ContactCopy(_value.contact, (v) => _then(_value.copyWith(contact: v)));
}
