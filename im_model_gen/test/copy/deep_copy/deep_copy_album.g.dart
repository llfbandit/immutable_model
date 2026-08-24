// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deep_copy_album.dart';

// **************************************************************************
// ImmutableModelGenerator
// **************************************************************************

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
