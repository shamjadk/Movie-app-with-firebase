import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_page_constants.g.dart';

class HomePageConstants {
  String txtLogOutButton = 'Log Out';
}

@riverpod
HomePageConstants homePageConstants(HomePageConstantsRef ref) {
  return HomePageConstants();
}
