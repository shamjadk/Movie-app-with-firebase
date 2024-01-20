import 'package:movie_app_with_firebase/core/exceptions/authentication_exception/authentication_exception.dart';
import 'package:movie_app_with_firebase/features/authentication/domain/repository/firebase_auth_repository.dart';

final class ContinueWithGoogleUseCase {
  final FireBaseAuthRepository repository;
  ContinueWithGoogleUseCase({required this.repository});
  Future<void> call() async {
    try {
      await repository.continueWithGoogle();
    } on Exception {
      throw Authenticationxception('Verification failed, please try again');
    }
  }
}
