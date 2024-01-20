import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sign_up_page_constants.g.dart';

class SignUpPageConstants {
  final getStarted = 'Get Started !!';
  final createAnAccount = 'Create an account and\nEntertain yourself';
  final allreadyHaveanAccount = 'Already have an account?';
  final userNameTextField = 'Enter your name';
  final mobileNUmberTextField = 'Enter your mobile number';
  final emailTextField = 'Enter your email id';
  final passwordTextField = 'Create your password';
  final passwordConfirm = 'Confirm your password';
  final txtVerificationDialogue =
      'Click the link we have sent to your email id to verify, and log in ';
}

@riverpod
SignUpPageConstants signUpPageConstants(SignUpPageConstantsRef ref) {
  return SignUpPageConstants();
}
