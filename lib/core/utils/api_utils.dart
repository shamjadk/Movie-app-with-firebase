import 'dart:io';

class ApiUtils {
  static const baseUrl = 'https://api.themoviedb.org/3';
  static const moviesUrl = '/discover/movie';
  static const trendingMoviesUrl = '/movie/now_playing';
  static const popularMoviesUrl = '/movie/popular?language=en-US&page=3';
  static const topRatedMoviesUrl = '/movie/top_rated';
  static const upcomingMoviesUrl = '/movie/upcoming';
  static const searchMoviesUrl = 'https://api.themoviedb.org/3/search/movie';
  static const apiToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkZDI3ZGIxMTE2NzUwZDI3NWQ5YTE0ODFiYTM3MDZiYyIsInN1YiI6IjY1ODE4ZDAzOGRiYzMzMDhiMDlhMDE3MSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.mX4ckYZJPb8GiKMwThYTBVM0guOuuENyCHthr2R5elI';
  static const imageBasePath = 'https://image.tmdb.org/t/p/w500';

  static Future<bool> hasNetwork() async {
    try {
      final result = await InternetAddress.lookup('image.tmdb.org');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }

  static int getTimeDifference(DateTime storedTime) {
    // int hourInSeconds = 3600;
    // int dayInSeconds = 86400;
    // int weekInSeconds = 604800;
    // int yearInSeconds = 31449600;
    DateTime now = DateTime.now();
    var difference = now.difference(storedTime).inSeconds;
    // String result;
    // if (difference > 60) {
    //   result = '${now.difference(storedTime).inMinutes} minutes ago';
    // }
    // if (difference > hourInSeconds) {
    //   result = '${now.difference(storedTime).inHours} hours ago';
    // }
    // if (difference > dayInSeconds) {
    //   result = '${now.difference(storedTime).inDays} days ago';
    // }
    // if (difference > weekInSeconds) {
    //   result = '${difference / 604800} weeks ago';
    // }
    // if (difference > yearInSeconds) {
    //   result = '${difference / 31449600} years ago';
    // } else {
    //   result = '$difference seconds ago';
    // }
    // return result;
    if (difference > 60) {
      difference = now.difference(storedTime).inMinutes;
    }
    if (difference > 60) {
      difference = now.difference(storedTime).inHours;
    }
    if (difference > 24) {
      difference = now.difference(storedTime).inDays;
    }
    if (difference > 7) {
      difference = difference ~/ 7;
    }
    if (difference > 52) {
      difference = difference ~/ 52;
    }
    return difference;
  }
}
