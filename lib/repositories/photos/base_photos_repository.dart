import 'package:photos_app/repositories/repositories.dart';
import 'package:photos_app/models/models.dart';

abstract class BasePhotosRepository extends BaseRepository {
  Future<List<Photo>> searchPhotos({String query, int page});
}
