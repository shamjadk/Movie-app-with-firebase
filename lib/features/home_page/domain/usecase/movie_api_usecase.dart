import 'package:movie_app_with_firebase/core/exceptions/base_exception.dart';
import 'package:movie_app_with_firebase/features/home_page/domain/entity/movie_api_entity.dart';
import 'package:movie_app_with_firebase/features/home_page/domain/repository/movie_api_repository.dart';

class MovieApiUsecase {
  final MovieApiRepository repository;
  MovieApiUsecase({required this.repository});
  Future<List<MovieApiEntity>> call() async {
    try {
      return repository.fetchMovies();
    } catch (e) {
      throw BaseException(e.toString());
    }
  }
}
