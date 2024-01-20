import 'package:firebase_auth/firebase_auth.dart';
import 'package:movie_app_with_firebase/features/authentication/data/data_source/firebase_auth_data_source.dart';
import 'package:movie_app_with_firebase/features/authentication/data/data_source/firebase_auth_data_source_impl.dart';
import 'package:movie_app_with_firebase/features/authentication/domain/repository/firebase_auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'firebase_auth_repository_impl.g.dart';

class FireBaseAuthRepositryImpl implements FireBaseAuthRepository {
  final FireBaseAuthDataSource dataSource;
  FireBaseAuthRepositryImpl({required this.dataSource});
  @override
  Future<UserCredential> signUpWithEmail(String email, String password) async {
    return await dataSource.signUpWithEmail(email, password);
  }

  @override
  Future<UserCredential> logInWithEmail(String email, String password) async {
    return await dataSource.loginWithEmail(email, password);
  }

  @override
  Future<void> verifyEmail() async {
    await dataSource.verifyEmail();
  }

  @override
  Future<void> continueWithGoogle() async {
    await dataSource.continueWithGoogle();
  }

  @override
  Future<(String, int?)> logInWithPhoneNumber(String mobileNUmber) async {
    return dataSource.logInWithPhoneNumber(mobileNUmber);
  }

  @override
  Future<void> verifyOtp(String verificationId, String otp) async {
    await dataSource.verifyOtp(verificationId, otp);
  }

  @override
  Future<void> forgottenPassword(String email) async {
    await dataSource.forgottenPassword(email);
  }

  @override
  Future<void> logOut() async {
    await dataSource.logOut();
  }
}

@riverpod
FireBaseAuthRepository fireBaseAuthRepository(FireBaseAuthRepositoryRef ref) {
  return FireBaseAuthRepositryImpl(
      dataSource: ref.watch(fireBaseAuthDataSourceProvider));
}
