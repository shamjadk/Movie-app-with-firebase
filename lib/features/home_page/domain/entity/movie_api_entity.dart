import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_api_entity.freezed.dart';

@freezed
class MovieApiEntity with _$MovieApiEntity {
  factory MovieApiEntity({
    required int id,
    required bool adult,
    required String backdropPath,
    required String originalTitle,
    required String title,
    required double popularity,
    required String overview,
    required String posterPath,
    required DateTime releaseDate,
    required double voteAverage,
    required int voteCount,
    required bool video,
  }) = _MovieApiEntity;
}
