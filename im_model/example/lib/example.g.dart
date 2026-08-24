// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'example.dart';

// **************************************************************************
// ImmutableModelGenerator
// **************************************************************************

extension _$BasicImExt on Basic {
  dynamic _eq() => (id, aValue);
}

mixin _$BasicMixin {
  $IBasicCopy<Basic> get copyWith => $BasicCopy(this as Basic, (v) => v);

  @override
  int get hashCode => (this as Basic)._eq().hashCode;

  @override
  bool operator ==(covariant Basic other) {
    if (identical(this, other)) return true;
    return other._eq() == (this as Basic)._eq();
  }

  @override
  String toString() => (this as Basic)._eq().toString();
}

abstract interface class $IBasicCopy<$R> {
  $R call({String? id, bool? aValue});
}

class $BasicCopy<$R> implements $IBasicCopy<$R> {
  const $BasicCopy(this._value, this._then);

  final Basic _value;
  final $R Function(Basic) _then;

  @override
  $R call({Object? id = $undefined, Object? aValue = $undefined}) {
    return _then(
      Basic(
        $undefined == id || id == null ? _value.id : id as String,
        $undefined == aValue || aValue == null ? _value.aValue : aValue as bool,
      ),
    );
  }
}

extension _$PrimaryConstructorImExt on PrimaryConstructor {
  dynamic _eq() => (id, aValue);
}

mixin _$PrimaryConstructorMixin {
  $IPrimaryConstructorCopy<PrimaryConstructor> get copyWith =>
      $PrimaryConstructorCopy(this as PrimaryConstructor, (v) => v);

  @override
  int get hashCode => (this as PrimaryConstructor)._eq().hashCode;

  @override
  bool operator ==(covariant PrimaryConstructor other) {
    if (identical(this, other)) return true;
    return other._eq() == (this as PrimaryConstructor)._eq();
  }

  @override
  String toString() => (this as PrimaryConstructor)._eq().toString();
}

abstract interface class $IPrimaryConstructorCopy<$R> {
  $R call({String? id, bool? aValue});
}

class $PrimaryConstructorCopy<$R> implements $IPrimaryConstructorCopy<$R> {
  const $PrimaryConstructorCopy(this._value, this._then);

  final PrimaryConstructor _value;
  final $R Function(PrimaryConstructor) _then;

  @override
  $R call({Object? id = $undefined, Object? aValue = $undefined}) {
    return _then(
      PrimaryConstructor(
        $undefined == id || id == null ? _value.id : id as String,
        $undefined == aValue || aValue == null ? _value.aValue : aValue as bool,
      ),
    );
  }
}

extension _$NamedConstructorImExt<T> on NamedConstructor<T> {
  dynamic _eq() => (foo);
}

mixin _$NamedConstructorMixin<T> {
  $INamedConstructorCopy<T, NamedConstructor<T>> get copyWith =>
      $NamedConstructorCopy(this as NamedConstructor<T>, (v) => v);

  @override
  int get hashCode => (this as NamedConstructor)._eq().hashCode;

  @override
  bool operator ==(covariant NamedConstructor<T> other) {
    if (identical(this, other)) return true;
    return other._eq() == (this as NamedConstructor)._eq();
  }

  @override
  String toString() => (this as NamedConstructor)._eq().toString();
}

abstract interface class $INamedConstructorCopy<T, $R> {
  $R call({bool? foo});
}

class $NamedConstructorCopy<T, $R> implements $INamedConstructorCopy<T, $R> {
  const $NamedConstructorCopy(this._value, this._then);

  final NamedConstructor<T> _value;
  final $R Function(NamedConstructor<T>) _then;

  @override
  $R call({Object? foo = $undefined}) {
    return _then(
      NamedConstructor<T>.named(
        $undefined == foo || foo == null ? _value.foo : foo as bool,
      ),
    );
  }
}

extension _$ParentImExt<T> on Parent<T> {
  dynamic _eq() => (id);
}

mixin _$ParentMixin<T> {
  $IParentCopy<T, Parent<T>> get copyWith =>
      $ParentCopy(this as Parent<T>, (v) => v);

  @override
  int get hashCode => (this as Parent)._eq().hashCode;

  @override
  bool operator ==(covariant Parent<T> other) {
    if (identical(this, other)) return true;
    return other._eq() == (this as Parent)._eq();
  }

  @override
  String toString() => (this as Parent)._eq().toString();
}

abstract interface class $IParentCopy<T, $R> {
  $R call({T? aValue});
}

class $ParentCopy<T, $R> implements $IParentCopy<T, $R> {
  const $ParentCopy(this._value, this._then);

  final Parent<T> _value;
  final $R Function(Parent<T>) _then;

  @override
  $R call({Object? aValue = $undefined}) {
    return _then(
      Parent<T>(_value.id, $undefined == aValue ? _value.aValue : aValue as T?),
    );
  }
}

extension _$ChildImExt<T> on Child<T> {
  dynamic _eq() => (id, collection);
}

mixin _$ChildMixin<T> {
  $IChildCopy<T, Child<T>> get copyWith =>
      $ChildCopy(this as Child<T>, (v) => v);

  @override
  int get hashCode => (this as Child)._eq().hashCode;

  @override
  bool operator ==(covariant Child<T> other) {
    if (identical(this, other)) return true;
    return other._eq() == (this as Child)._eq();
  }

  @override
  String toString() => (this as Child)._eq().toString();
}

abstract interface class $IChildCopy<T, $R> implements $IParentCopy<T, $R> {
  @override
  $R call({T? aValue, List<int>? collection});
}

class $ChildCopy<T, $R> implements $IChildCopy<T, $R> {
  const $ChildCopy(this._value, this._then);

  final Child<T> _value;
  final $R Function(Child<T>) _then;

  @override
  $R call({Object? aValue = $undefined, Object? collection = $undefined}) {
    return _then(
      Child<T>(
        _value.id,
        $undefined == aValue ? _value.aValue : aValue as T?,
        collection: $undefined == collection || collection == null
            ? _value.collection
            : ImList(collection as List<int>),
      ),
    );
  }
}

extension _$AlbumImExt on Album {
  dynamic _eq() => (title, artist);
}

mixin _$AlbumMixin {
  $IAlbumCopy<Album> get copyWith => $AlbumCopy(this as Album, (v) => v);

  @override
  int get hashCode => (this as Album)._eq().hashCode;

  @override
  bool operator ==(covariant Album other) {
    if (identical(this, other)) return true;
    return other._eq() == (this as Album)._eq();
  }

  @override
  String toString() => (this as Album)._eq().toString();
}

abstract interface class $IAlbumCopy<$R> {
  $R call({String? title, Artist? artist});
  $IArtistCopy<$R> get artist;
}

class $AlbumCopy<$R> implements $IAlbumCopy<$R> {
  const $AlbumCopy(this._value, this._then);

  final Album _value;
  final $R Function(Album) _then;

  @override
  $R call({Object? title = $undefined, Object? artist = $undefined}) {
    return _then(
      Album(
        title: $undefined == title || title == null
            ? _value.title
            : title as String,
        artist: $undefined == artist || artist == null
            ? _value.artist
            : artist as Artist,
      ),
    );
  }

  @override
  $IArtistCopy<$R> get artist =>
      $ArtistCopy(_value.artist, (v) => _then(_value.copyWith(artist: v)));
}

extension _$ArtistImExt on Artist {
  dynamic _eq() => (name, contact);
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
  $R call({String? name, Contact? contact});
  $IContactCopy<$R> get contact;
}

class $ArtistCopy<$R> implements $IArtistCopy<$R> {
  const $ArtistCopy(this._value, this._then);

  final Artist _value;
  final $R Function(Artist) _then;

  @override
  $R call({Object? name = $undefined, Object? contact = $undefined}) {
    return _then(
      Artist(
        name: $undefined == name || name == null ? _value.name : name as String,
        contact: $undefined == contact || contact == null
            ? _value.contact
            : contact as Contact,
      ),
    );
  }

  @override
  $IContactCopy<$R> get contact =>
      $ContactCopy(_value.contact, (v) => _then(_value.copyWith(contact: v)));
}

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
