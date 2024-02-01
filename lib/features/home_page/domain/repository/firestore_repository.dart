import 'package:movie_app_with_firebase/features/home_page/domain/entity/movie_api_entity.dart';
import 'package:movie_app_with_firebase/features/home_page/domain/entity/review_entity.dart';

abstract class FirestoreRepository{
  Future<void> addToFirestore(MovieApiEntity entity);
  Stream<List<MovieApiEntity>> getFavMoviesFromFirestore();
  Future<void> removeFavMoviesFromFirestore(String id);
  Future<void> addReviewsToFirestore(ReviewEntity reviewEntity,String id);
  Stream<List<ReviewEntity>> getReviewsFromFirestore(String id);
}