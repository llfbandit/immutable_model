import 'package:im_model/im_model.dart';
import 'package:test/test.dart' hide equals;

import 'deep_copy_box.dart';
import 'deep_copy_contact.dart' as c;
import 'deep_copy_prefixed_import.dart';

void main() {
  const contact = c.Contact(name: 'Alice');
  final manager = Manager(
    name: 'Bob',
    contact: contact,
    contacts: ImList([contact]),
    boxedContact: const Box(value: contact),
  );

  test('flat copyWith works when the nested field type is prefix-imported', () {
    final updated = manager.copyWith(contact: const c.Contact(name: 'Carol'));

    expect(updated.contact.name, 'Carol');
    expect(manager.contact.name, 'Alice');
  });

  test(
    'chained copyWith works when the nested field type is prefix-imported',
    () {
      final chained = manager.copyWith.contact(name: 'Dave');
      final manualNested = manager.copyWith(
        contact: manager.contact.copyWith(name: 'Dave'),
      );

      expect(chained, manualNested);
      expect(chained.contact.name, 'Dave');
      // Original tree is untouched.
      expect(manager.contact.name, 'Alice');
    },
  );

  test('copyWith works when a prefix-imported type is a collection element '
      '(ImList<c.Contact>)', () {
    final updated = manager.copyWith(contacts: [const c.Contact(name: 'Erin')]);

    expect(updated.contacts.first.name, 'Erin');
    expect(manager.contacts.first.name, 'Alice');
  });

  test("chained copyWith works when a prefix-imported type is a generic "
      "nested model's type argument (Box<c.Contact>)", () {
    final chained = manager.copyWith.boxedContact(
      value: const c.Contact(name: 'Frank'),
    );

    expect(chained.boxedContact.value.name, 'Frank');
    // Original tree is untouched.
    expect(manager.boxedContact.value.name, 'Alice');
  });
}
