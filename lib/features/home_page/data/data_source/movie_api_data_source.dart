import 'package:movie_app_with_firebase/features/home_page/data/models/movie_api_model.dart';

abstract class MovieApiDataSource {
  Future<MovieApiModel?> fetchMovies();
  Future<MovieApiModel?> fetchTrendingMovies();
}
