/*
{
    "albumId": 1,
    "id": 1,
    "title": "accusamus beatae ad facilis cum similique qui sunt",
    "url": "https://via.placeholder.com/600/92c952",
    "thumbnailUrl": "https://via.placeholder.com/150/92c952"
  }
*/
import 'package:floor/floor.dart';

@entity
class Photo {
  num albumId;
  @primaryKey
  num id;
  String title;
  String url;
  Photo(
      {required this.albumId,
      required this.id,
      required this.title,
      required this.url});

  Map<String, dynamic> toJson(Photo photo) {
    return {
      "albumId": photo.albumId,
      "id": photo.id,
      "title": photo.title,
      "url": photo.url
    };
  }

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
        albumId: json["albumId"],
        id: json["id"],
        title: json["title"],
        url: json["url"]);
  }
}
