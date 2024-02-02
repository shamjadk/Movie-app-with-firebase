import 'package:movie_app_with_firebase/features/home_page/domain/entity/movie_api_entity.dart';

abstract class MovieApiRepository {
  Future<List<MovieApiEntity>> fetchMovies(String postPath);
  Future<List<MovieApiEntity>> searchMovies(String text);
}
