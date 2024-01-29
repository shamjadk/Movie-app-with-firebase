import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app_with_firebase/core/constants/home_page/home_page_constants.dart';
import 'package:movie_app_with_firebase/core/themes/app_theme.dart';

class DiscoverListWidget extends ConsumerWidget {
  const DiscoverListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listConstants = ref.watch(homePageConstantsProvider).listDiscover;
    final appTheme = AppTheme.of(context);
    return Padding(
      padding: EdgeInsets.all(appTheme.spaces.space_100),
      child: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(
          height: appTheme.spaces.space_50,
        ),
        physics: const ClampingScrollPhysics(),
        shrinkWrap: true,
        itemCount: listConstants.length,
        itemBuilder: (context, index) => InkWell(
          onTap: null,
          child: Container(
            color: Colors.grey.shade300,
            width: MediaQuery.sizeOf(context).width,
            height: appTheme.spaces.space_100 * 7,
            padding: EdgeInsets.all(appTheme.spaces.space_100),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  listConstants[index],
                  style: appTheme.typography.h500,
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: appTheme.colors.text,
                  size: appTheme.spaces.space_200,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
