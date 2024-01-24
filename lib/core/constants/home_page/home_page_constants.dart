import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_page_constants.g.dart';

class HomePageConstants {
  final txtLogOutButton = 'Log Out';
  final txtAppTitle = 'Movie Base';
  final txtProfileTitle = 'Profile';
  final pathAppTitle = 'assets/images/movie_base_label.png';
  final pathAppLogo = 'assets/images/movie_base_logo.png';
  final txtWatchNow = 'Watch Now';
  final txtTrending = 'Trending now';
  final txtPopular = 'Popular Movies';
}

@riverpod
HomePageConstants homePageConstants(HomePageConstantsRef ref) {
  return HomePageConstants();
}
