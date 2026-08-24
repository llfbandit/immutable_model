import 'package:test/test.dart' hide equals;

import 'deep_copy_album.dart';
import 'deep_copy_artist.dart';
import 'deep_copy_contact.dart';

void main() {
  const contact = Contact(name: 'Alice');
  const artist = Artist(name: 'Bob', contact: contact);
  const album = Album(title: 'Acme', artist: artist);

  test('chained leaf call matches manually nested copyWith, across files', () {
    final chained = album.copyWith.artist.contact(name: 'John Smith');
    final manual = album.copyWith(
      artist: album.artist.copyWith(
        contact: album.artist.contact.copyWith(name: 'John Smith'),
      ),
    );

    expect(chained, manual);
    expect(chained.artist.contact.name, 'John Smith');
    // Original tree is untouched.
    expect(album.artist.contact.name, 'Alice');
  });

  test(
    'mid-chain call rebuilds the whole tree from one level short of the leaf',
    () {
      final chained = album.copyWith.artist(name: 'Dave');
      final manual = album.copyWith(
        artist: album.artist.copyWith(name: 'Dave'),
      );

      expect(chained, manual);
      expect(chained.artist.name, 'Dave');
    },
  );

  test('flat copyWith still works unchanged', () {
    const newArtist = Artist(name: 'Carol', contact: contact);
    expect(album.copyWith(artist: newArtist).artist.name, 'Carol');
  });

  test(
    'nullable nested field: chain getter is null when the value is null',
    () {
      expect(album.copyWith.artist.backupContact, null);
    },
  );

  test('nullable nested field: chaining works when the value is present', () {
    const withBackup = Artist(
      name: 'Bob',
      contact: contact,
      backupContact: Contact(name: 'Eve'),
    );
    final withAlbum = album.copyWith(artist: withBackup);

    final chained = withAlbum.copyWith.artist.backupContact!(name: 'Frank');
    final manual = withAlbum.copyWith(
      artist: withAlbum.artist.copyWith(
        backupContact: withAlbum.artist.backupContact!.copyWith(name: 'Frank'),
      ),
    );

    expect(chained, manual);
    expect(chained.artist.backupContact!.name, 'Frank');
  });
}
