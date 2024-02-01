import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_with_firebase/core/themes/app_theme.dart';
import 'package:movie_app_with_firebase/features/home_page/domain/entity/review_entity.dart';

class ReviewListWidget extends StatelessWidget {
  final List<ReviewEntity> data;
  const ReviewListWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context);
    return ListView.separated(
        separatorBuilder: (context, index) => SizedBox(
              height: appTheme.spaces.space_150,
            ),
        shrinkWrap: true,
        itemCount: data.length,
        itemBuilder: (context, index) {
          final now = DateTime.now();
          final time = data[index].time;
          final reviewTime = DateTime(time.year, time.month, time.day);
          final difference = now.difference(reviewTime).inMinutes;
          return Container(
            padding: EdgeInsets.all(appTheme.spaces.space_100),
            decoration: BoxDecoration(
                color: appTheme.colors.textSubtle,
                borderRadius: BorderRadius.circular(appTheme.spaces.space_200)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                      text: FirebaseAuth.instance.currentUser!.displayName
                          .toString(),
                      style: appTheme.typography.wh600,
                      children: [
                        TextSpan(
                          text: '    ${time.toString().substring(0, 10)}',
                          style: appTheme.typography.wh200,
                        )
                      ]),
                ),
                Text(
                  data[index].review,
                  style: appTheme.typography.wh500,
                )
              ],
            ),
          );
        });
  }
}
