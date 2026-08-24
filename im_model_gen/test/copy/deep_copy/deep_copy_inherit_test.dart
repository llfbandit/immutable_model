import 'package:im_model/im_model.dart';
import 'package:test/test.dart' hide equals;

import 'deep_copy_contact.dart';

part 'deep_copy_inherit_test.g.dart';

@ImModel()
abstract class HasContact with _$HasContactMixin {
  const HasContact({required this.contact});

  final Contact contact;
}

@ImModel()
class Producer extends HasContact with _$ProducerMixin {
  const Producer({required super.contact, required this.role});

  final String role;
}

void main() {
  test('inherited nested-model field can be chained from the subclass', () {
    const producer = Producer(
      contact: Contact(name: 'Alice'),
      role: 'Mixing',
    );

    final chained = producer.copyWith.contact(name: 'Zoe');
    final manual = producer.copyWith(
      contact: producer.contact.copyWith(name: 'Zoe'),
    );

    expect(chained, manual);
    expect(chained.contact.name, 'Zoe');
  });
}
