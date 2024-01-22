import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app_with_firebase/features/authentication/presentation/pages/login_page.dart';
import 'package:movie_app_with_firebase/features/authentication/presentation/pages/otp_verification_page.dart';
import 'package:movie_app_with_firebase/features/authentication/presentation/pages/phone_number_page.dart';
import 'package:movie_app_with_firebase/features/authentication/presentation/pages/sign_up_page.dart';
import 'package:movie_app_with_firebase/features/home_page/presentation/pages/home_page.dart';
import 'package:movie_app_with_firebase/features/home_page/presentation/pages/profile_page.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

final _router = GoRouter(initialLocation: HomePage.routePath, routes: [
  GoRoute(
    path: HomePage.routePath,
    builder: (context, state) => const HomePage(),
    redirect: (context, state) {
      if (FirebaseAuth.instance.currentUser == null ||
          !FirebaseAuth.instance.currentUser!.emailVerified) {
        return LoginPage.routePath;
      }
      return null;
    },
  ),
  GoRoute(
    path: LoginPage.routePath,
    builder: (context, state) => const LoginPage(),
  ),
  GoRoute(
    path: SignUpPage.routePath,
    builder: (context, state) => const SignUpPage(),
  ),
  GoRoute(
    path: OtpVerificationPage.routePath,
    builder: (context, state) => const OtpVerificationPage(),
  ),
  GoRoute(
    path: PhoneNumberPage.routePath,
    builder: (context, state) => const PhoneNumberPage(),
  ),
  GoRoute(
    path: ProfilePage.routePath,
    builder: (context, state) => const ProfilePage(),
  ),
]);

@riverpod
GoRouter router(RouterRef ref) {
  return _router;
}
