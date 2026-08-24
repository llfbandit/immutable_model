// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deep_copy_prefixed_import.dart';

// **************************************************************************
// ImmutableModelGenerator
// **************************************************************************

extension _$ManagerImExt on Manager {
  dynamic _eq() => (name, contact, contacts, boxedContact);
}

mixin _$ManagerMixin {
  $IManagerCopy<Manager> get copyWith =>
      $ManagerCopy(this as Manager, (v) => v);

  @override
  int get hashCode => (this as Manager)._eq().hashCode;

  @override
  bool operator ==(covariant Manager other) {
    if (identical(this, other)) return true;
    return other._eq() == (this as Manager)._eq();
  }

  @override
  String toString() => (this as Manager)._eq().toString();
}

abstract interface class $IManagerCopy<$R> {
  $R call({
    String? name,
    c.Contact? contact,
    List<c.Contact>? contacts,
    Box<c.Contact>? boxedContact,
  });
  c.$IContactCopy<$R> get contact;
  $IBoxCopy<c.Contact, $R> get boxedContact;
}

class $ManagerCopy<$R> implements $IManagerCopy<$R> {
  const $ManagerCopy(this._value, this._then);

  final Manager _value;
  final $R Function(Manager) _then;

  @override
  $R call({
    Object? name = $undefined,
    Object? contact = $undefined,
    Object? contacts = $undefined,
    Object? boxedContact = $undefined,
  }) {
    return _then(
      Manager(
        name: $undefined == name || name == null ? _value.name : name as String,
        contact: $undefined == contact || contact == null
            ? _value.contact
            : contact as c.Contact,
        contacts: $undefined == contacts || contacts == null
            ? _value.contacts
            : ImList(contacts as List<c.Contact>),
        boxedContact: $undefined == boxedContact || boxedContact == null
            ? _value.boxedContact
            : boxedContact as Box<c.Contact>,
      ),
    );
  }

  @override
  c.$IContactCopy<$R> get contact =>
      c.$ContactCopy(_value.contact, (v) => _then(_value.copyWith(contact: v)));

  @override
  $IBoxCopy<c.Contact, $R> get boxedContact => $BoxCopy(
    _value.boxedContact,
    (v) => _then(_value.copyWith(boxedContact: v)),
  );
}
