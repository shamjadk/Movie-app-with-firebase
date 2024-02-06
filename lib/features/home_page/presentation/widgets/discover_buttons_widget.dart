import 'package:flutter/material.dart';
import 'package:movie_app_with_firebase/core/themes/app_theme.dart';

class DiscoverButtonsWidget extends StatelessWidget {
  final String text;
  final void Function() onTap;
  const DiscoverButtonsWidget(
      {super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: appTheme.spaces.space_25),
      child: InkWell(
        onTap: onTap,
        child: Container(
          color: Colors.grey.shade300,
          width: MediaQuery.sizeOf(context).width,
          height: appTheme.spaces.space_100 * 7,
          padding: EdgeInsets.all(appTheme.spaces.space_100),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text,
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
    );
  }
}
