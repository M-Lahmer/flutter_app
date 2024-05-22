import 'package:e_shop/models/photo.dart';
import 'package:floor/floor.dart';

@dao
abstract class PhotoDao {
  @Query('SELECT * FROM Photo')
  Future<List<Photo>> findAllPhotos();

  @Query('SELECT * FROM Photo WHERE id = :id')
  Stream<Photo?> findPhotoById(int id);

  @insert
  Future<void> insertPhoto(Photo photo);

  @update
  Future<void> updatePhoto(Photo photo);

  @delete
  Future<void> deletePhoto(Photo photo);
}
