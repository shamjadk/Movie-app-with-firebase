import 'package:movie_app_with_firebase/core/exceptions/authentication_exception/authentication_exception.dart';
import 'package:movie_app_with_firebase/core/exceptions/authentication_exception/empty_input_exception.dart';
import 'package:movie_app_with_firebase/features/authentication/domain/repository/firebase_auth_repository.dart';

final class SignUpUseCase {
  final FireBaseAuthRepository repository;
  SignUpUseCase({required this.repository});
  Future<void> call(String email, String password) async {
    if (email.trim().isEmpty || password.trim().isEmpty) {
      throw EmptyInputException();
    }
    try {
      await repository.signUpWithEmail(email, password);
    } on Exception {
      throw Authenticationxception('Cannot sign up, please try again');
    }
  }
}
