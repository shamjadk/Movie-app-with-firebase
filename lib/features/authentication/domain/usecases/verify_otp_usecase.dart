import 'package:movie_app_with_firebase/core/exceptions/authentication_exception/authentication_exception.dart';
import 'package:movie_app_with_firebase/features/authentication/domain/repository/firebase_auth_repository.dart';

final class VerifyOtpUseCase {
  final FireBaseAuthRepository repository;
  VerifyOtpUseCase({required this.repository});
  Future<void> call(String verificationId, String otp) async {
    try {
      await repository.verifyOtp(verificationId, otp);
    } on Exception {
      throw Authenticationxception('Verification failed, please try again');
    }
  }
}
