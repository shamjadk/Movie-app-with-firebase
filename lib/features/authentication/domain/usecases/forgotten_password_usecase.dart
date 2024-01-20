import 'package:movie_app_with_firebase/core/exceptions/authentication_exception/authentication_exception.dart';
import 'package:movie_app_with_firebase/features/authentication/domain/repository/firebase_auth_repository.dart';

final class ForgottenPasswordUseCase {
  final FireBaseAuthRepository repository;
  ForgottenPasswordUseCase({required this.repository});
  Future<void> call(String email) async {
    try {
      await repository.forgottenPassword(email);
    } on Exception {
      throw Authenticationxception('Verification failed, please try again');
    }
  }
}
