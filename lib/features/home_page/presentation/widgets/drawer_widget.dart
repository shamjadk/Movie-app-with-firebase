import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app_with_firebase/core/constants/home_page/home_page_constants.dart';
import 'package:movie_app_with_firebase/core/themes/app_theme.dart';
import 'package:movie_app_with_firebase/features/home_page/presentation/pages/favourite_page.dart';
import 'package:movie_app_with_firebase/features/home_page/presentation/pages/profile_page.dart';
import 'package:movie_app_with_firebase/features/home_page/presentation/pages/watchlist_page.dart';
import 'package:movie_app_with_firebase/features/home_page/presentation/widgets/list_tile_widget.dart';
import 'package:movie_app_with_firebase/features/home_page/presentation/widgets/profile_details_widget.dart';

class DrawerWidget extends ConsumerWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTheme = AppTheme.of(context);
    final constants = ref.watch(homePageConstantsProvider);
    // final fireInstance = FirebaseAuth.instance;
    return Drawer(
      backgroundColor: appTheme.colors.textInverse,
      child: ListView(
        children: [
          InkWell(
            onTap: () => context.push(ProfilePage.routePath),
            child: const DrawerHeader(
                padding: EdgeInsets.all(0), child: ProfileDetailsWidget()),
          ),
          ListTileWidget(
            title: constants.txtwatchlist,
            onTap: () => context.push(WatchListPage.routePath),
          ),
          ListTileWidget(
            title: constants.txtFavourite,
            onTap: () => context.push(FavouritePage.routePath),
          ),
        ],
      ),
    );
  }
}
