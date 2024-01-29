import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app_with_firebase/core/themes/app_theme.dart';
import 'package:movie_app_with_firebase/core/utils/api_utils.dart';
import 'package:movie_app_with_firebase/features/home_page/domain/entity/movie_api_entity.dart';
import 'package:movie_app_with_firebase/features/home_page/presentation/widgets/favourite_button_widget.dart';
import 'package:movie_app_with_firebase/features/home_page/presentation/widgets/home_pop_button_widget.dart';

class SliverInfoPageWidget extends ConsumerWidget {
  final MovieApiEntity entity;
  const SliverInfoPageWidget({super.key, required this.entity});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTheme = AppTheme.of(context);
    return SliverAppBar(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(15))),
      leadingWidth: appTheme.spaces.space_900,
      elevation: 0,
      backgroundColor: appTheme.colors.textSubtle,
      automaticallyImplyLeading: false,
      pinned: true,
      leading: Padding(
        padding: EdgeInsets.symmetric(vertical: appTheme.spaces.space_100),
        child: const HomePopButtonWidget(),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: appTheme.spaces.space_100),
          child: FavouriteButtonWidget(
            entity: entity,
          ),
        )
      ],
      expandedHeight: appTheme.spaces.space_700 * 10,
      flexibleSpace: LayoutBuilder(
        builder: (context, contraints) {
          final top = contraints.biggest.height;
          return FlexibleSpaceBar(
            background: ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(bottom: Radius.circular(15)),
              child: Image.network(
                ApiUtils.imageBasePath + entity.posterPath,
                fit: BoxFit.cover,
              ),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Opacity(
                  opacity:
                      top == MediaQuery.of(context).padding.top + kToolbarHeight
                          ? 1
                          : 0,
                  child: SizedBox(
                    width: 150,
                    child: Text(
                      '${entity.title} (${entity.releaseDate.year})',
                      style: appTheme.typography.wh600,
                    ),
                  ),
                ),
                Opacity(
                  opacity:
                      top == MediaQuery.of(context).padding.top + kToolbarHeight
                          ? 0
                          : 1,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
