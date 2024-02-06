import 'package:freezed_annotation/freezed_annotation.dart';

part 'review_entity.freezed.dart';

@freezed
class ReviewEntity with _$ReviewEntity {
  factory ReviewEntity({
    required String review,
    required String userName,
    required DateTime time,
    required String dp,
  }) = _ReviewEntity;
}
