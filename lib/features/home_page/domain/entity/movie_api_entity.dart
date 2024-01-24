import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_api_entity.freezed.dart';

@freezed
class MovieApiEntity with _$MovieApiEntity {
  factory MovieApiEntity({
    required bool adult,
    required String backdropPath,
    required String originalTitle,
    required String title,
    required String overview,
    required String posterPath,
    required DateTime releaseDate,
    required double voteAverage,
    required int voteCount,
  }) = _MovieApiEntity;
}
