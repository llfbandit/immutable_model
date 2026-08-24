import 'package:im_model/im_model.dart';
import 'package:test/test.dart' hide equals;

part 'deep_copy_self_test.g.dart';

@ImModel()
class Genre with _$GenreMixin {
  const Genre({required this.name, this.parent});

  final String name;
  final Genre? parent;
}

void main() {
  test('self-referential nested-model field chains recursively', () {
    const rock = Genre(name: 'Rock');
    const punkRock = Genre(name: 'Punk Rock', parent: rock);
    const postPunk = Genre(name: 'Post-Punk', parent: punkRock);

    final chained = postPunk.copyWith.parent!.parent!(name: 'Hard Rock');
    final manual = postPunk.copyWith(
      parent: postPunk.parent!.copyWith(
        parent: postPunk.parent!.parent!.copyWith(name: 'Hard Rock'),
      ),
    );

    expect(chained, manual);
    expect(chained.parent!.parent!.name, 'Hard Rock');
  });

  test('self-referential nested-model field is null when absent', () {
    const root = Genre(name: 'Rock');
    expect(root.copyWith.parent, null);
  });
}
