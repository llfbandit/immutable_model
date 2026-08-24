// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deep_copy_contact.dart';

// **************************************************************************
// ImmutableModelGenerator
// **************************************************************************

extension _$ContactImExt on Contact {
  dynamic _eq() => (name);
}

mixin _$ContactMixin {
  $IContactCopy<Contact> get copyWith =>
      $ContactCopy(this as Contact, (v) => v);

  @override
  int get hashCode => (this as Contact)._eq().hashCode;

  @override
  bool operator ==(covariant Contact other) {
    if (identical(this, other)) return true;
    return other._eq() == (this as Contact)._eq();
  }

  @override
  String toString() => (this as Contact)._eq().toString();
}

abstract interface class $IContactCopy<$R> {
  $R call({String? name});
}

class $ContactCopy<$R> implements $IContactCopy<$R> {
  const $ContactCopy(this._value, this._then);

  final Contact _value;
  final $R Function(Contact) _then;

  @override
  $R call({Object? name = $undefined}) {
    return _then(
      Contact(
        name: $undefined == name || name == null ? _value.name : name as String,
      ),
    );
  }
}
