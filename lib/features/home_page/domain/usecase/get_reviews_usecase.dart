import 'package:movie_app_with_firebase/core/exceptions/base_exception.dart';
import 'package:movie_app_with_firebase/features/home_page/domain/entity/review_entity.dart';
import 'package:movie_app_with_firebase/features/home_page/domain/repository/firestore_repository.dart';

class GetReviewsFromFirestoreUsecase {
  final FirestoreRepository repository;
  GetReviewsFromFirestoreUsecase({required this.repository});
  Stream<List<ReviewEntity>> call(String id) {
    try {
      return repository.getReviewsFromFirestore(id);
    } catch (e) {
      throw BaseException(e.toString());
    }
  }
}
