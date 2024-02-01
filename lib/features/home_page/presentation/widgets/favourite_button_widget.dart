import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app_with_firebase/core/themes/app_theme.dart';
import 'package:movie_app_with_firebase/features/home_page/domain/entity/movie_api_entity.dart';
import 'package:movie_app_with_firebase/features/home_page/presentation/provider/movie_api_provider.dart';

class FavouriteButtonWidget extends ConsumerWidget {
  final MovieApiEntity entity;
  const FavouriteButtonWidget({super.key, required this.entity});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTheme = AppTheme.of(context);
    return TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.all(appTheme.spaces.space_125),
          backgroundColor: appTheme.colors.text,
          shape: const CircleBorder(),
        ),
        onPressed: () {
          ref.read(movieApiProvider.notifier).addFavMoviesToFirestore(entity);
        },
        child: Icon(
          Icons.favorite_border,
          size: appTheme.spaces.space_250,
          color: appTheme.colors.textInverse,
        ));
  }
}
