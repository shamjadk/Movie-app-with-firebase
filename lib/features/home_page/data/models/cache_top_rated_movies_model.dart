import 'package:objectbox/objectbox.dart';

@Entity()
class CacheTopRatedMoviesentityModel {
  @Id()
  int id = 0;
  bool? adult;
  String? backdropPath;
  String? originalTitle;
  int? movieId;
  String? title;
  double? popularity;
  String? overview;
  String? posterPath;
  DateTime? releaseDate;
  double? voteAverage;
  int? voteCount;
  bool? video;
  CacheTopRatedMoviesentityModel({
    required this.movieId,
    required this.adult,
    required this.backdropPath,
    required this.originalTitle,
    required this.title,
    required this.popularity,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    required this.voteAverage,
    required this.voteCount,
    required this.video,
  });
}
