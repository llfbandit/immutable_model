import 'package:im_model/im_model.dart';

import 'deep_copy_contact.dart';

part 'deep_copy_artist.g.dart';

@ImModel()
class Artist with _$ArtistMixin {
  const Artist({required this.name, required this.contact, this.backupContact});

  final String name;
  final Contact contact;
  final Contact? backupContact;
}
