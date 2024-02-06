import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app_with_firebase/core/constants/home_page/home_page_constants.dart';
import 'package:movie_app_with_firebase/core/themes/app_theme.dart';
import 'package:movie_app_with_firebase/features/home_page/presentation/widgets/normal_app_bar_widget.dart';

class NowPlayingPage extends ConsumerWidget {
  static const routePath = '/nowplaying';
  const NowPlayingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTheme = AppTheme.of(context);
    return Scaffold(
      appBar: NormalAppBarWidget(
          title: ref.watch(homePageConstantsProvider).listDiscover[0],
          toolBarHeight: appTheme.spaces.space_50 * 15),
    );
  }
}
