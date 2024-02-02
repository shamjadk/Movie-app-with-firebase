import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_app_with_firebase/features/home_page/presentation/pages/favourite_page.dart';
import 'package:movie_app_with_firebase/features/home_page/presentation/pages/home_page.dart';
import 'package:movie_app_with_firebase/features/home_page/presentation/pages/profile_page.dart';
import 'package:movie_app_with_firebase/features/home_page/presentation/pages/search_page.dart';
import 'package:movie_app_with_firebase/features/home_page/presentation/provider/movie_api_provider.dart';
import 'package:movie_app_with_firebase/features/home_page/presentation/widgets/bottom_navigation_bar_widget.dart';

class PageViewPage extends ConsumerWidget {
  static const routePath = '/';
  const PageViewPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: PageView(
        
        controller: ref.watch(movieApiProvider.notifier).pageController,
        onPageChanged: (value) {
          ref.read(selectedProvider.notifier).state = value;
        },
        children: const [
          HomePage(),
          SearchPage(),
          FavouritePage(),
          ProfilePage(),
        ],
      ),
      bottomNavigationBar: const BottomNavigationBarWidget(),
    );
  }
}
