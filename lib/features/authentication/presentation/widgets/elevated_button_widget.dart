import 'package:flutter/material.dart';
import 'package:movie_app_with_firebase/core/themes/app_theme.dart';

class ElevatedButtonWidget extends StatelessWidget {
  final String buttonName;
  final void Function() onTap;
  final TextEditingController? emailController;
  final TextEditingController? passwordController;
  const ElevatedButtonWidget(
      {super.key,
      required this.buttonName,
      required this.onTap,
      required this.emailController,
      required this.passwordController});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      height: AppTheme.of(context).spaces.space_600,
      child: ElevatedButton(
        style: const ButtonStyle(elevation: MaterialStatePropertyAll(0)),
        onPressed: onTap,
        child: Text(buttonName),
      ),
    );
  }
}
