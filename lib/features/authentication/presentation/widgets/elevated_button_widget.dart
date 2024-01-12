import 'package:flutter/material.dart';
import 'package:movie_app_with_firebase/core/themes/app_theme.dart';

class ElevatedButtonWidget extends StatelessWidget {
  final String buttonName;
  const ElevatedButtonWidget({super.key, required this.buttonName});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      height: AppTheme.of(context).spaces.space_600,
      child: ElevatedButton(
        style: const ButtonStyle(elevation: MaterialStatePropertyAll(0)),
        onPressed: () {},
        child: Text(buttonName),
      ),
    );
  }
}
