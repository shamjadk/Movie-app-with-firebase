import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_app_with_firebase/core/constants/home_page/movie_info_page.dart';
import 'package:movie_app_with_firebase/core/themes/app_theme.dart';
import 'package:movie_app_with_firebase/core/widgets/text_field_widget.dart';
import 'package:movie_app_with_firebase/features/home_page/domain/entity/movie_api_entity.dart';
import 'package:movie_app_with_firebase/features/home_page/domain/entity/review_entity.dart';
import 'package:movie_app_with_firebase/features/home_page/presentation/provider/movie_api_provider.dart';
import 'package:movie_app_with_firebase/features/home_page/presentation/widgets/review_list_widget.dart';
import 'package:movie_app_with_firebase/features/home_page/presentation/widgets/try_again_button_widget.dart';

class Reviewsectionwidget extends HookConsumerWidget {
  final MovieApiEntity movieEntity;
  const Reviewsectionwidget({super.key, required this.movieEntity});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reviewController = useTextEditingController();
    final appTheme = AppTheme.of(context);
    return InkWell(
      child: Container(
          margin: EdgeInsets.only(top: appTheme.spaces.space_200),
          padding: EdgeInsets.all(appTheme.spaces.space_150),
          width: MediaQuery.sizeOf(context).width,
          height: appTheme.spaces.space_600,
          decoration: BoxDecoration(
              color: appTheme.colors.textSubtle.withOpacity(0.2),
              borderRadius: BorderRadius.circular(appTheme.spaces.space_200)),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                MovieInfoPageConstants.txtReview,
                style: appTheme.typography.pDefault,
              ),
              const Icon(Icons.arrow_circle_down_outlined)
            ],
          )),
      onTap: () => showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) => Container(
          padding: EdgeInsets.all(appTheme.spaces.space_100),
          height: appTheme.spaces.space_800 * 10,
          decoration: BoxDecoration(
              color: appTheme.colors.scaffoldBackground,
              borderRadius: BorderRadius.vertical(
                  top: Radius.circular(appTheme.spaces.space_300))),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width / 1.2,
                      child: TextFieldWidget(
                          controller: reviewController,
                          labelText: MovieInfoPageConstants.txtFldReview),
                    ),
                    IconButton(
                        onPressed: () {
                          ref.read(movieApiProvider.notifier).addReviews(
                              ReviewEntity(
                                review: reviewController.text,
                                userName: FirebaseAuth.instance.currentUser
                                    .toString(),
                                time: DateTime.now(),
                              ),
                              '${movieEntity.title}${movieEntity.id}');
                          reviewController.clear();
                        },
                        icon: const Icon(Icons.send_outlined))
                  ],
                ),
                StreamBuilder(
                  stream: ref
                      .watch(movieApiProvider.notifier)
                      .getReviewsFromFirestore(
                          '${movieEntity.title}${movieEntity.id}'),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final data = snapshot.data!;
                      return ReviewListWidget(data: data);
                    } else if (snapshot.connectionState ==
                        ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                        child: TryAgainButtonWidget(snapshot.error.toString()),
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
