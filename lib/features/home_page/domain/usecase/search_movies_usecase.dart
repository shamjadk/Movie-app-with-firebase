import 'package:movie_app_with_firebase/core/exceptions/base_exception.dart';
import 'package:movie_app_with_firebase/features/home_page/domain/entity/movie_api_entity.dart';
import 'package:movie_app_with_firebase/features/home_page/domain/repository/movie_api_repository.dart';

class SearchMovieApiUsecase {
  final MovieApiRepository repository;
  SearchMovieApiUsecase({required this.repository});
  Future<List<MovieApiEntity>> call(String text) async {
    try {
      return repository.searchMovies(text);
    } on Exception catch (e) {
      if (e.toString().contains('connection')) {
        throw BaseException('Connection Error');
      } else {
        throw Exception(e.toString());
      }
    }
  }
}
