import 'package:movie_app_with_firebase/core/exceptions/base_exception.dart';
import 'package:movie_app_with_firebase/features/home_page/domain/entity/movie_api_entity.dart';
import 'package:movie_app_with_firebase/features/home_page/domain/repository/firestore_repository.dart';

class GetWatchListUsecase {
  final FirestoreRepository repository;
  GetWatchListUsecase({required this.repository});
  Stream<List<MovieApiEntity>> call() {
    try {
      return repository.getWatchlistFromFirestore();
    } catch (e) {
      throw BaseException(e.toString());
    }
  }
}
