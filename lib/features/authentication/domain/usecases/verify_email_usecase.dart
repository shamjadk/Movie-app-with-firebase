import 'package:movie_app_with_firebase/core/exceptions/authentication_exception/authentication_exception.dart';
import 'package:movie_app_with_firebase/features/authentication/domain/repository/firebase_auth_repository.dart';

final class VerifyEmailUseCase {
  final FireBaseAuthRepository repository;
  VerifyEmailUseCase({required this.repository});
  Future<void> call() async {
    try {
      await repository.verifyEmail();
    } on Exception {
      throw Authenticationxception('Verification failed, please try again');
    }
  }
}
