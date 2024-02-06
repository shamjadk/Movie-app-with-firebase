import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'review_section_model.g.dart';
part 'review_section_model.freezed.dart';

@freezed
class ReviewModel with _$ReviewModel {
  const ReviewModel._();
  factory ReviewModel(
      {required String review,
      required String userName,
      required DateTime time,
      required String dp}) = _ReviewModel;
  factory ReviewModel.fromJson(Map<String, dynamic> json) =>
      _$ReviewModelFromJson(json);
  factory ReviewModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data()!;
    return ReviewModel.fromJson(data);
  }
  Map<String, dynamic> toFirestore() {
    return toJson();
  }
}
