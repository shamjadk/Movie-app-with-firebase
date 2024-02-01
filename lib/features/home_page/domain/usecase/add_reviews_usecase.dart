import 'package:movie_app_with_firebase/core/exceptions/authentication_exception/empty_input_exception.dart';
import 'package:movie_app_with_firebase/core/exceptions/base_exception.dart';
import 'package:movie_app_with_firebase/features/home_page/domain/entity/review_entity.dart';
import 'package:movie_app_with_firebase/features/home_page/domain/repository/firestore_repository.dart';

class AddReviewsUsecase {
  final FirestoreRepository repository;
  AddReviewsUsecase({required this.repository});
  Future<void> call(ReviewEntity reviewEntity,String id) async {
    if (reviewEntity.review.trim().isEmpty) {
      throw EmptyInputException();
    }
    try {
      return repository.addReviewsToFirestore(reviewEntity,id);
    } catch (e) {
      throw BaseException(e.toString());
    }
  }
}
