// To parse this JSON data, do
//
//     final trailerApiModel = trailerApiModelFromJson(jsonString);

// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'trailer_api_model.freezed.dart';
part 'trailer_api_model.g.dart';


@freezed
class TrailerApiModel with _$TrailerApiModel {
    const factory TrailerApiModel({
        required int id,
        required List<Result> results,
    }) = _TrailerApiModel;

    factory TrailerApiModel.fromJson(Map<String, dynamic> json) => _$TrailerApiModelFromJson(json);
}

@freezed
class Result with _$Result {
    const factory Result({
        @JsonKey(name: "iso_639_1")
        required String iso6391,
        @JsonKey(name: "iso_3166_1")
        required String iso31661,
        required String name,
        required String key,
        required String site,
        required int size,
        required String type,
        required bool official,
        @JsonKey(name: "published_at")
        required DateTime publishedAt,
        required String id,
    }) = _Result;

    factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
}
