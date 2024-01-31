import 'package:movie_app_with_firebase/core/exceptions/base_exception.dart';
import 'package:movie_app_with_firebase/features/home_page/domain/repository/firestore_repository.dart';

class RemoveFavFromFirestoreUsecase {
  final FirestoreRepository repository;
  RemoveFavFromFirestoreUsecase({required this.repository});
  Future<void> call(String id) {
    try {
      return repository.removeFavMoviesFromFirestore(id);
    } catch (e) {
      throw BaseException(e.toString());
    }
  }
}
