import 'package:movie_app_with_firebase/core/exceptions/base_exception.dart';
import 'package:movie_app_with_firebase/features/home_page/domain/entity/movie_api_entity.dart';
import 'package:movie_app_with_firebase/features/home_page/domain/repository/firestore_repository.dart';

class AddToWatchListUsecase {
  final FirestoreRepository repository;
  AddToWatchListUsecase({required this.repository});
  Future<void> call(MovieApiEntity entity) async {
    try {
      return repository.addToWatchlist(entity);
    } catch (e) {
      throw BaseException(e.toString());
    }
  }
}
