import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_with_firebase/core/themes/app_theme.dart';

class DpWidget extends StatelessWidget {
  final double fontSize;
  final double radius;
  const DpWidget({super.key, required this.radius,required this.fontSize});

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context);
    final currentUser = FirebaseAuth.instance.currentUser;
    return Builder(
      builder: (context) {
        if (currentUser!.emailVerified == false) {
          return CircleAvatar(
            radius: radius,
            child: Text(
              currentUser.email![0].toUpperCase(),
              style: appTheme.typography.wh500.copyWith(fontSize:fontSize ),
            ),
          );
        } else {
          return CircleAvatar(
            radius: radius,
            backgroundImage: NetworkImage(currentUser.photoURL.toString()),
          );
        }
      },
    );
  }
}
