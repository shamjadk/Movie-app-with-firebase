import 'package:movie_app_with_firebase/core/exceptions/authentication_exception/authentication_exception.dart';
import 'package:movie_app_with_firebase/features/authentication/domain/repository/firebase_auth_repository.dart';

final class LogOutUseCase {
  final FireBaseAuthRepository repository;
  LogOutUseCase({required this.repository});
  Future<void> call() async {
    try {
      await repository.logOut();
    } on Exception {
      throw Authenticationxception('Log out failed, please try again');
    }
  }
}
