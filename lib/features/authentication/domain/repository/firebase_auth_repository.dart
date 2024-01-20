
import 'package:firebase_auth/firebase_auth.dart';

abstract class FireBaseAuthRepository {
  Future<UserCredential> signUpWithEmail(String email, String password);
  Future<UserCredential> logInWithEmail(String email, String password);
  Future<void> verifyEmail();
  Future<void> continueWithGoogle();
  Future<(String,int?)> logInWithPhoneNumber(String mobileNUmber);
  Future<void> verifyOtp(String verificationId,String otp);
  Future<void> forgottenPassword(String email);
  Future<void> logOut();
}