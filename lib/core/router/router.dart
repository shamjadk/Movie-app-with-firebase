import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app_with_firebase/features/authentication/presentation/pages/login_page.dart';
import 'package:movie_app_with_firebase/features/authentication/presentation/pages/otp_verification_page.dart';
import 'package:movie_app_with_firebase/features/authentication/presentation/pages/phone_number_page.dart';
import 'package:movie_app_with_firebase/features/authentication/presentation/pages/sign_up_page.dart';
import 'package:movie_app_with_firebase/features/home_page/domain/entity/movie_api_entity.dart';
import 'package:movie_app_with_firebase/features/home_page/presentation/pages/home_page.dart';
import 'package:movie_app_with_firebase/features/home_page/presentation/pages/movie_info_page.dart';
import 'package:movie_app_with_firebase/features/home_page/presentation/pages/profile_page.dart';
import 'package:movie_app_with_firebase/features/home_page/presentation/widgets/page_view_widget.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

final _router = GoRouter(initialLocation: PageViewWidget.routePath, routes: [
  GoRoute(
    path: PageViewWidget.routePath,
    builder: (context, state) => const PageViewWidget(),
    redirect: (context, state) {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null ||
          !user.emailVerified&&user.phoneNumber==null) {
        return LoginPage.routePath;
      }
      return null;
    },
  ),
  GoRoute(
    path: HomePage.routePath,
    builder: (context, state) => const HomePage(),
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
  GoRoute(
    path: MovieInfoPage.routePath,
    builder: (context, state) =>
        MovieInfoPage(entity: state.extra as MovieApiEntity),
  ),
]);

@riverpod
GoRouter router(RouterRef ref) {
  return _router;
}
