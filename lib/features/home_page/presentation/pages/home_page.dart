import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app_with_firebase/core/themes/app_theme.dart';
import 'package:movie_app_with_firebase/features/home_page/presentation/widgets/app_bar_widget.dart';

class HomePage extends ConsumerWidget {
  static const routePath = '/';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTheme = AppTheme.of(context);
    return Scaffold(
      appBar: AppBarWidget(
        toolBarHeight: appTheme.spaces.space_50 * 15,
      ),
      // body: switch (ref.watch(movieApiProvider)) {
      //   AsyncData(:final value) => ListView.builder(
      //       itemCount: value.length,
      //       itemBuilder: (context, index) => Text(value[index].originalTitle),
      //     ),
      //   AsyncError(:final error) => Center(
      //       child: Text(error.toString()),
      //     ),
      //   _ => const Center(
      //       child: CircularProgressIndicator(),
      //     )
      // },
    );
  }
}
