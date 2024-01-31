import 'package:movie_app_with_firebase/core/exceptions/base_exception.dart';
import 'package:movie_app_with_firebase/features/home_page/domain/entity/movie_api_entity.dart';
import 'package:movie_app_with_firebase/features/home_page/domain/repository/firestore_repository.dart';

class GetFavMoviesFromFirestoreUsecase {
  final FirestoreRepository repository;
  GetFavMoviesFromFirestoreUsecase({required this.repository});
  Stream<List<MovieApiEntity>> call(MovieApiEntity entity) {
    try {
      return repository.getFavMoviesFromFirestore();
    } catch (e) {
      throw BaseException(e.toString());
    }
  }
}
