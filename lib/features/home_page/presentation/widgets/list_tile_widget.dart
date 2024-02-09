import 'package:flutter/material.dart';
import 'package:movie_app_with_firebase/core/themes/app_theme.dart';

class ListTileWidget extends StatelessWidget {
  final String title;
  final void Function() onTap;
  const ListTileWidget({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: AppTheme.of(context)
            .typography
            .h600
            .copyWith(fontSize: 20, fontWeight: FontWeight.normal),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 18,
      ),
      onTap: () => onTap,
    );
  }
}
