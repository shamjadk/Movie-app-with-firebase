import 'package:movie_app_with_firebase/core/exceptions/base_exception.dart';
import 'package:movie_app_with_firebase/features/home_page/domain/entity/movie_api_entity.dart';
import 'package:movie_app_with_firebase/features/home_page/domain/repository/firestore_repository.dart';

class AddToFirestoreUsecase {
  final FirestoreRepository repository;
  AddToFirestoreUsecase({required this.repository});
  Future<void> call(MovieApiEntity entity) async {
    try {
      return repository.addToFirestore(entity);
    } catch (e) {
      throw BaseException(e.toString());
    }
  }
}
