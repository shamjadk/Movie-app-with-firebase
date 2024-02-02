import 'package:flutter/material.dart';
import 'package:movie_app_with_firebase/core/themes/app_theme.dart';
import 'package:movie_app_with_firebase/features/home_page/domain/entity/review_entity.dart';

class ReviewListWidget extends StatelessWidget {
  final List<ReviewEntity> data;
  const ReviewListWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '${data.length} comments',
            style: TextStyle(color: Colors.grey.shade700),
          ),
          SizedBox(
            height: appTheme.spaces.space_100,
          ),
          SizedBox(
            height: 331,
            child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(
                      height: appTheme.spaces.space_150,
                    ),
                shrinkWrap: true,
                itemCount: data.length,
                itemBuilder: (context, index) {
                  // int getDifference(DateTime storedTime) {
                  //   final now = DateTime.now();
                  //   double difference =
                  //       now.difference(storedTime).inSeconds.toDouble();
                  //   if (difference > 59) {
                  //     difference = difference / difference;
                  //   }

                  //   return difference.toInt();
                  // }

                  final now = DateTime.now();
                  final time = data[index].time;
                  final difference = now.difference(time).inHours;
                  return Container(
                    padding: EdgeInsets.all(appTheme.spaces.space_100),
                    decoration: BoxDecoration(
                        color: appTheme.colors.textSubtlest,
                        borderRadius:
                            BorderRadius.circular(appTheme.spaces.space_200)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                              text: data[index].userName,
                              style: TextStyle(color: Colors.grey.shade300),
                              children: [
                                TextSpan(
                                  text:
                                      '    ${time.toString().substring(10, 20)}',
                                  style: TextStyle(color: Colors.grey.shade300),
                                ),
                                TextSpan(
                                    text: ' ● $difference hours ago',
                                    style:
                                        TextStyle(color: Colors.grey.shade300))
                              ]),
                        ),
                        SizedBox(
                          height: appTheme.spaces.space_50,
                        ),
                        Text(
                          data[index].review,
                          style: appTheme.typography.wh500,
                        )
                      ],
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
