import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:movie_app_with_firebase/core/exceptions/base_exception.dart';
import 'package:movie_app_with_firebase/core/utils/snackbar_utils.dart';
import 'package:movie_app_with_firebase/core/utils/verification_dialog_utils.dart';
import 'package:movie_app_with_firebase/features/authentication/data/repository/firebase_auth_repository_impl.dart';
import 'package:movie_app_with_firebase/features/authentication/domain/repository/firebase_auth_repository.dart';
import 'package:movie_app_with_firebase/features/authentication/domain/usecases/continue_with_google_usecase.dart';
import 'package:movie_app_with_firebase/features/authentication/domain/usecases/forgotten_password_usecase.dart';
import 'package:movie_app_with_firebase/features/authentication/domain/usecases/login_usecase.dart';
import 'package:movie_app_with_firebase/features/authentication/domain/usecases/login_with_phone_number_usecase.dart';
import 'package:movie_app_with_firebase/features/authentication/domain/usecases/logout_usecase.dart';
import 'package:movie_app_with_firebase/features/authentication/domain/usecases/sign_up_usecase.dart';
import 'package:movie_app_with_firebase/features/authentication/domain/usecases/verify_email_usecase.dart';
import 'package:movie_app_with_firebase/features/authentication/domain/usecases/verify_otp_usecase.dart';
import 'package:movie_app_with_firebase/features/authentication/presentation/pages/login_page.dart';
import 'package:movie_app_with_firebase/features/authentication/presentation/pages/otp_verification_page.dart';
import 'package:movie_app_with_firebase/features/authentication/presentation/providers/auth_state.dart';
import 'package:movie_app_with_firebase/features/home_page/presentation/pages/home_page.dart';
import 'package:movie_app_with_firebase/features/home_page/presentation/widgets/page_view_widget.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'authentication_provider.g.dart';

@Riverpod(keepAlive: true)
class Authentication extends _$Authentication {
  late final FireBaseAuthRepository repository;
  @override
  AuthState build() {
    repository = ref.read(fireBaseAuthRepositoryProvider);
    return AuthState(verificationId: '', resendToken: null);
  }

  Future<void> signUp(
      String email, String password, BuildContext context) async {
    try {
      await SignUpUseCase(repository: repository)(email, password);
      Future.sync(() => verifyEmail(context));
      Future.sync(() => context.go(LoginPage.routePath));
      Future.sync(() => VerificationDialogUtils.showDialogUtils(context, ''));
    } on BaseException catch (e) {
      Future.sync(() => SnackbarUtils.snackbar(e.message, context));
    }
  }

  Future<void> logIn(
      String email, String password, BuildContext context) async {
    try {
      await LogInUseCase(repository: repository)(email, password);
      Future.sync(() => context.go(PageViewWidget.routePath));
    } on BaseException catch (e) {
      Future.sync(() => SnackbarUtils.snackbar(e.message, context));
    }
  }

  Future<void> verifyEmail(BuildContext context) async {
    try {
      await VerifyEmailUseCase(repository: repository)();
    } on BaseException catch (e) {
      Future.sync(() => SnackbarUtils.snackbar(e.message, context));
    }
  }

  Future<void> continueWithGoogle(BuildContext context) async {
    try {
      await ContinueWithGoogleUseCase(repository: repository)();
      Future.sync(() => context.go(PageViewWidget.routePath));
    } on BaseException catch (e) {
      Future.sync(() => SnackbarUtils.snackbar(e.message, context));
    }
  }

  Future<void> loginWithPhoneNumber(
      BuildContext context, String mobileNumber) async {
    try {
      final verificationData = await LoginWithPhoneNumberUsecase(
          repository: repository)(mobileNumber);
      state = AuthState(
          verificationId: verificationData.$1,
          resendToken: verificationData.$2);
      Future.sync(() => context.push(OtpVerificationPage.routePath));
    } on BaseException catch (e) {
      Future.sync(() => SnackbarUtils.snackbar(e.message, context));
    }
  }

  Future<void> verifyOtp(BuildContext context, String otp) async {
    try {
      await VerifyOtpUseCase(repository: repository)(state.verificationId, otp);
      Future.sync(() => context.go(PageViewWidget.routePath));
    } on BaseException catch (e) {
      Future.sync(() => SnackbarUtils.snackbar(e.message, context));
    }
  }

  Future<void> forgottenPassword(BuildContext context, String email) async {
    try {
      await ForgottenPasswordUseCase(repository: repository)(email);
      Future.sync(() => context.go(HomePage.routePath));
    } on BaseException catch (e) {
      Future.sync(() => SnackbarUtils.snackbar(e.message, context));
    }
  }

  Future<void> logOut(BuildContext context) async {
    try {
      await LogOutUseCase(repository: repository)();
      Future.sync(() => context.go(LoginPage.routePath));
    } on BaseException catch (e) {
      Future.sync(() => SnackbarUtils.snackbar(e.message, context));
    }
  }
}
