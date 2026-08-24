import 'package:im_model/im_model.dart';

import 'deep_copy_box.dart';
import 'deep_copy_contact.dart' as c;

part 'deep_copy_prefixed_import.g.dart';

@ImModel()
class Manager with _$ManagerMixin {
  const Manager({
    required this.name,
    required this.contact,
    required this.contacts,
    required this.boxedContact,
  });

  final String name;
  final c.Contact contact;
  final ImList<c.Contact> contacts;
  final Box<c.Contact> boxedContact;
}
