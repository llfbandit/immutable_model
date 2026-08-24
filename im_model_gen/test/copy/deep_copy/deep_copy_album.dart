import 'package:im_model/im_model.dart';

import 'deep_copy_artist.dart';

part 'deep_copy_album.g.dart';

@ImModel()
class Album with _$AlbumMixin {
  const Album({required this.title, required this.artist});

  final String title;
  final Artist artist;
}
