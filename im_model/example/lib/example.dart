import 'package:im_model/im_model.dart';

part 'example.g.dart';

/// Standard usage.
@ImModel(/*ignoreCopy: false, ignoreEqual: false*/)
class Basic with _$BasicMixin {
  final String id;
  final bool aValue;

  Basic(this.id, this.aValue);
}

/// Usage of primary constructor.
@ImModel()
class PrimaryConstructor(final String id, final bool aValue)
    with _$PrimaryConstructorMixin;

/// Usage of named constructor to make copies.
@ImModel(copyConstructor: 'named')
class NamedConstructor<T> with _$NamedConstructorMixin {
  final bool foo;

  const NamedConstructor.named(this.foo);
}

///////////////////////////////////////////////////////////////
/// Inheritance - Generics
///////////////////////////////////////////////////////////////

/// [id] is not part of `copyWith`.
/// Only [id] is part of equality.
@ImModel()
class Parent<T> with _$ParentMixin<T> {
  @ImField(ignoreCopy: true)
  final String id;
  @ImField(ignoreEqual: true)
  final T? aValue;

  const Parent(this.id, this.aValue);
}

/// [collection] class member is immutable (you can't use add, remove, ...).
/// [id] is not part of `copyWith`.
/// Only [id] and [collection] are part of equality.
@ImModel()
class Child<T> extends Parent<T> with _$ChildMixin<T> {
  final ImList<int> collection;

  const Child(super.id, super.aValue, {required this.collection});
}

///////////////////////////////////////////////////////////////
/// Copy chaining
///////////////////////////////////////////////////////////////

@ImModel()
class Album with _$AlbumMixin {
  const Album({required this.title, required this.artist});

  final String title;
  final Artist artist;
}

@ImModel()
class Artist with _$ArtistMixin {
  const Artist({required this.name, required this.contact});

  final String name;
  final Contact contact;
}

@ImModel()
class Contact with _$ContactMixin {
  const Contact({required this.name});

  final String name;
}

void main() {
  var obj1 = Child('a', 0, collection: [1].immut);
  var obj2 = Child('a', 0, collection: ImList([1]));
  print(obj1 == obj2 ? '\u2705 equal!' : '\u274C Not equal');

  // obj1.collection.add(2);
  // The method 'add' isn't defined for the type 'ImList'.

  // So now that we have a clear view in our source code, it's time to fix this!
  obj1 = obj1.copyWith(collection: obj1.collection.mut..add(2));
  print(obj1 == obj2 ? '\u274C equal!' : '\u2705 Not equal');

  // Two things to notice here:
  // - we used `mut` getter to mutate the initial collection for shorter syntax. This is a shortcut (forward method) for `List.of`.
  // - we didn't had to wrap again the collection to be immutable, this is done in generated code.

  // obj1.copyWith(id: 'b');
  // The named parameter 'id' isn't defined.

  // Deep copy
  const originalContact = 'Alice';
  const contact = Contact(name: originalContact);
  const artist = Artist(name: 'Bob', contact: contact);
  var album = Album(title: 'Acme', artist: artist);

  album = album.copyWith.artist.contact(name: 'Eve');

  print(
    'album.artist.contact changed from "$originalContact"'
    ' to "${album.artist.contact.name}"',
  );
}
