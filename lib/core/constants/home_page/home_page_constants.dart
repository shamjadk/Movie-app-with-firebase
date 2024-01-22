import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_page_constants.g.dart';

class HomePageConstants {
  String txtLogOutButton = 'Log Out';
  String txtAppTitle = 'Movie Base';
  String txtProfileTitle = 'Profile';
  String pathAppTitle = 'assets/images/movie_base_label.png';
  String pathAppLogo = 'assets/images/movie_base_logo.png';
}

@riverpod
HomePageConstants homePageConstants(HomePageConstantsRef ref) {
  return HomePageConstants();
}
