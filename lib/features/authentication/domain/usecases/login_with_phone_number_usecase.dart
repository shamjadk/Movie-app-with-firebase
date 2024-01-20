import 'package:movie_app_with_firebase/core/exceptions/authentication_exception/authentication_exception.dart';
import 'package:movie_app_with_firebase/core/exceptions/authentication_exception/empty_input_exception.dart';
import 'package:movie_app_with_firebase/features/authentication/domain/repository/firebase_auth_repository.dart';

final class LoginWithPhoneNumberUsecase {
  final FireBaseAuthRepository repository;
  LoginWithPhoneNumberUsecase({required this.repository});
  Future<(String, int?)> call(String mobileNumber) async {
    if (mobileNumber.trim().isEmpty) {
      throw EmptyInputException();
    } else {
      try {
        return  repository.logInWithPhoneNumber(mobileNumber);
      } on Exception {
        throw Authenticationxception('Log in failed, please try again');
      }
    }
  }
}
