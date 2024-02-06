import 'package:movie_app_with_firebase/core/exceptions/base_exception.dart';
import 'package:movie_app_with_firebase/features/home_page/domain/entity/trailer_api_entity.dart';
import 'package:movie_app_with_firebase/features/home_page/domain/repository/movie_api_repository.dart';

class TrailerUsecase {
  final MovieApiRepository repository;
  TrailerUsecase({required this.repository});
  Future<List<TrailerApiEntity>> call(int id) async {
    try {
      final videos = await repository.fetchTrailers(id);
      final trailers =
          videos.where((element) => element.type.trim() == 'trailer').toList();
      return trailers;
    } on Exception catch (e) {
      if (e.toString().contains('connection')) {
        throw BaseException('Connection Error');
      } else {
        throw BaseException(e.toString());
      }
    }
  }
}
