// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deep_copy_artist.dart';

// **************************************************************************
// ImmutableModelGenerator
// **************************************************************************

extension _$ArtistImExt on Artist {
  dynamic _eq() => (name, contact, backupContact);
}

mixin _$ArtistMixin {
  $IArtistCopy<Artist> get copyWith => $ArtistCopy(this as Artist, (v) => v);

  @override
  int get hashCode => (this as Artist)._eq().hashCode;

  @override
  bool operator ==(covariant Artist other) {
    if (identical(this, other)) return true;
    return other._eq() == (this as Artist)._eq();
  }

  @override
  String toString() => (this as Artist)._eq().toString();
}

abstract interface class $IArtistCopy<$R> {
  $R call({String? name, Contact? contact, Contact? backupContact});
  $IContactCopy<$R> get contact;
  $IContactCopy<$R>? get backupContact;
}

class $ArtistCopy<$R> implements $IArtistCopy<$R> {
  const $ArtistCopy(this._value, this._then);

  final Artist _value;
  final $R Function(Artist) _then;

  @override
  $R call({
    Object? name = $undefined,
    Object? contact = $undefined,
    Object? backupContact = $undefined,
  }) {
    return _then(
      Artist(
        name: $undefined == name || name == null ? _value.name : name as String,
        contact: $undefined == contact || contact == null
            ? _value.contact
            : contact as Contact,
        backupContact: $undefined == backupContact
            ? _value.backupContact
            : backupContact as Contact?,
      ),
    );
  }

  @override
  $IContactCopy<$R> get contact =>
      $ContactCopy(_value.contact, (v) => _then(_value.copyWith(contact: v)));

  @override
  $IContactCopy<$R>? get backupContact => _value.backupContact == null
      ? null
      : $ContactCopy(
          _value.backupContact!,
          (v) => _then(_value.copyWith(backupContact: v)),
        );
}
