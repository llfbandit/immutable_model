import 'package:im_model/im_model.dart';

part 'deep_copy_contact.g.dart';

@ImModel()
class Contact with _$ContactMixin {
  const Contact({required this.name});

  final String name;
}
