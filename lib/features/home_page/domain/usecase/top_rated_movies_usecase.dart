import 'package:movie_app_with_firebase/core/exceptions/base_exception.dart';
import 'package:movie_app_with_firebase/core/utils/api_utils.dart';
import 'package:movie_app_with_firebase/features/home_page/domain/entity/movie_api_entity.dart';
import 'package:movie_app_with_firebase/features/home_page/domain/repository/movie_api_repository.dart';

class TopRatedMoviesUsecase {
  final MovieApiRepository repository;
  TopRatedMoviesUsecase({required this.repository});
  Future<List<MovieApiEntity>> call() async {
    try {
      return repository.fetchMovies(ApiUtils.topRatedMoviesUrl);
    } catch (e) {
      throw BaseException(e.toString());
    }
  }
}
