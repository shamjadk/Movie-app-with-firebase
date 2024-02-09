import 'package:movie_app_with_firebase/core/exceptions/base_exception.dart';
import 'package:movie_app_with_firebase/features/home_page/domain/repository/firestore_repository.dart';

class RemoveWatchlistUsecase {
  final FirestoreRepository repository;
  RemoveWatchlistUsecase({required this.repository});
  Future<void> call(String id) {
    try {
      return repository.removeWatchlistFromFirestore(id);
    } catch (e) {
      throw BaseException(e.toString());
    }
  }
}
