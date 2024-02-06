import 'package:movie_app_with_firebase/core/exceptions/base_exception.dart';
import 'package:movie_app_with_firebase/features/home_page/domain/entity/trailer_api_entity.dart';
import 'package:movie_app_with_firebase/features/home_page/domain/repository/movie_api_repository.dart';

class VideoUsecase {
  final MovieApiRepository repository;
  VideoUsecase({required this.repository});
  Future<List<TrailerApiEntity>> call(int id) async {
    try {
      return repository.fetchTrailers(id);
    } on Exception catch (e) {
      if (e.toString().contains('connection')) {
        throw BaseException('Connection Error');
      } else {
        throw BaseException(e.toString());
      }
    }
  }
}
