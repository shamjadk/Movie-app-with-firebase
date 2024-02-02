import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app_with_firebase/core/themes/app_theme.dart';
import 'package:movie_app_with_firebase/features/home_page/presentation/pages/profile_page.dart';
import 'package:movie_app_with_firebase/features/home_page/presentation/widgets/profile_details_widget.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context);
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
          const ListTile()
        ],
      ),
    );
  }
}
