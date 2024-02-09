import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app_with_firebase/features/authentication/presentation/pages/login_page.dart';
import 'package:movie_app_with_firebase/features/authentication/presentation/pages/otp_verification_page.dart';
import 'package:movie_app_with_firebase/features/authentication/presentation/pages/phone_number_page.dart';
import 'package:movie_app_with_firebase/features/authentication/presentation/pages/sign_up_page.dart';
import 'package:movie_app_with_firebase/features/home_page/domain/entity/movie_api_entity.dart';
import 'package:movie_app_with_firebase/features/home_page/presentation/pages/favourite_page.dart';
import 'package:movie_app_with_firebase/features/home_page/presentation/pages/home_page.dart';
import 'package:movie_app_with_firebase/features/home_page/presentation/pages/movie_info_page.dart';
import 'package:movie_app_with_firebase/features/home_page/presentation/pages/discover_pages/now_playing_page.dart';
import 'package:movie_app_with_firebase/features/home_page/presentation/pages/discover_pages/popular_page.dart';
import 'package:movie_app_with_firebase/features/home_page/presentation/pages/profile_page.dart';
import 'package:movie_app_with_firebase/features/home_page/presentation/pages/page_view_page.dart';
import 'package:movie_app_with_firebase/features/home_page/presentation/pages/discover_pages/top_rated_movies_page.dart';
import 'package:movie_app_with_firebase/features/home_page/presentation/pages/discover_pages/up_coming_movies_page.dart';
import 'package:movie_app_with_firebase/features/home_page/presentation/pages/watchlist_page.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

final _router = GoRouter(initialLocation: PageViewPage.routePath, routes: [
  GoRoute(
    path: PageViewPage.routePath,
    builder: (context, state) => const PageViewPage(),
    redirect: (context, state) {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null || !user.emailVerified && user.phoneNumber == null) {
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
  GoRoute(
    path: NowPlayingPage.routePath,
    builder: (context, state) => const NowPlayingPage(),
  ),
  GoRoute(
    path: PopularPage.routePath,
    builder: (context, state) => const PopularPage(),
  ),
  GoRoute(
    path: TopRatedPage.routePath,
    builder: (context, state) => const TopRatedPage(),
  ),
  GoRoute(
    path: UpComingPage.routePath,
    builder: (context, state) => const UpComingPage(),
  ),
  GoRoute(
    path: WatchListPage.routePath,
    builder: (context, state) => const UpComingPage(),
  ),
  GoRoute(
    path: FavouritePage.routePath,
    builder: (context, state) => const FavouritePage(),
  ),
]);

@riverpod
GoRouter router(RouterRef ref) {
  return _router;
}
