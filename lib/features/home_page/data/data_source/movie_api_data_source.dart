import 'package:movie_app_with_firebase/features/home_page/data/models/firestore_model.dart';
import 'package:movie_app_with_firebase/features/home_page/data/models/movie_api_model.dart';

abstract class MovieApiDataSource {
  Future<MovieApiModel?> fetchMovies(String postPath);
  Future<void> addToFirestore(FireStoreModel model);
}
