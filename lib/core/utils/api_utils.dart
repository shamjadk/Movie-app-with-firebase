class ApiUtils {
  static const baseUrl = 'https://api.themoviedb.org/3';
  static const moviesUrl = '/discover/movie';
  static const trendingMoviesUrl = '/movie/now_playing';
  static const popularMoviesUrl = '/movie/popular?language=en-US&page=3';
  static const topRatedMoviesUrl = '/movie/top_rated';
  static const upcomingMoviesUrl = '/movie/upcoming';
  static const apiToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkZDI3ZGIxMTE2NzUwZDI3NWQ5YTE0ODFiYTM3MDZiYyIsInN1YiI6IjY1ODE4ZDAzOGRiYzMzMDhiMDlhMDE3MSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.mX4ckYZJPb8GiKMwThYTBVM0guOuuENyCHthr2R5elI';
  static const imageBasePath = 'https://image.tmdb.org/t/p/w500';
}
