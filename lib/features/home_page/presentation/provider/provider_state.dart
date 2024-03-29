import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_app_with_firebase/features/home_page/domain/entity/movie_api_entity.dart';

part 'provider_state.freezed.dart';

@freezed
class ProviderState with _$ProviderState {
  factory ProviderState({
    required List<MovieApiEntity> movies,
    required List<MovieApiEntity> trending,
    required List<MovieApiEntity> popular,
    required List<MovieApiEntity> topRated,
    required List<MovieApiEntity> upcoming,
    required List<MovieApiEntity>? search,
  }) = _ProviderState;
}
