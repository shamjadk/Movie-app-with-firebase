import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app_with_firebase/core/themes/app_theme.dart';

class FavouriteButtonWidget extends ConsumerWidget {
  const FavouriteButtonWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTheme = AppTheme.of(context);
    return IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.favorite_border,
          size: appTheme.spaces.space_250,
        ));
  }
}
