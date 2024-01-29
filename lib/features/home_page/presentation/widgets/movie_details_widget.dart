import 'package:flutter/material.dart';
import 'package:movie_app_with_firebase/core/themes/app_theme.dart';
import 'package:movie_app_with_firebase/features/home_page/domain/entity/movie_api_entity.dart';

class MoviedetailsWidget extends StatelessWidget {
  final MovieApiEntity entity;
  const MoviedetailsWidget({super.key, required this.entity});

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context);
    return Padding(
      padding: EdgeInsets.all(appTheme.spaces.space_150),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '⭐ ${entity.voteAverage.toStringAsFixed(1)} (${entity.voteCount})',
            style: TextStyle(
                color: appTheme.colors.textSubtlest,
                fontWeight: FontWeight.w600),
          ),
          const Text('|'),
          entity.adult
              ? Text(
                  '18+',
                  style: TextStyle(
                      color: appTheme.colors.textSubtlest,
                      fontWeight: FontWeight.w600),
                )
              : Text(
                  'PG-13',
                  style: TextStyle(
                      color: appTheme.colors.textSubtlest,
                      fontWeight: FontWeight.w600),
                ),
          const Text('|'),
          Text(
            ' ${entity.releaseDate.day}-${entity.releaseDate.month}-${entity.releaseDate.year}',
            style: TextStyle(
                color: appTheme.colors.textSubtlest,
                fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}
