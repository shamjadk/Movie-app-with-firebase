import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_page_constants.g.dart';

class LoginPageConstants {
  final txtappName = 'Movie Base';
  final txtuserNameTextField = 'Enter your email id';
  final txtpasswordTextField = 'Enter your password';
  final txtloginButton = 'Log in';
  final logoPath = 'assets/images/movie_base_logo.png';
  final googleLogoPath = 'assets/images/google_logo.png';
  final txtgoogleLoginButton = 'Continue with Google';
  final txtPhoneLoginButton = 'Continue with mobile number';
  final txtsendOtp = 'Send OTP';
  final txtVerifyOtp = 'Verify OTP';
  final txtforgottenPassword = 'Forgotten password ?';
  final txtdontHaveAnAccount = 'Don\'t have an account?';
  final txtsignUpButton = 'Sign Up';
  final txtOr = 'OR';
}

@riverpod
LoginPageConstants loginPageConstants(LoginPageConstantsRef ref) {
  return LoginPageConstants();
}
