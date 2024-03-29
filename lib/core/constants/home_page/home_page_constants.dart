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
  final txtGetDetails = 'Get Details';
  final txtDiscover = 'Discover';
  final btnNo = 'No';
  final btnYes = 'Yes';
  final txtLogOut = 'Do you want to log out?';
  final txtfldComment = 'Leave your comment';
  final txtNowPlaying = 'Now playing';
  final txtTopRated = 'Top rated movies';
  final txtUpcoming = 'Upcoming movies';
  final txtwatchlist = 'Watchlist';
  final txtFavourite = 'Favourite movies';
}

@riverpod
HomePageConstants homePageConstants(HomePageConstantsRef ref) {
  return HomePageConstants();
}
