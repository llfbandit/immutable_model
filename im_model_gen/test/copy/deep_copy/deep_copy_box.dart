import 'package:im_model/im_model.dart';

part 'deep_copy_box.g.dart';

@ImModel()
class Box<T> with _$BoxMixin<T> {
  const Box({required this.value});

  final T value;
}
