import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_with_firebase/core/themes/app_theme.dart';

class ProfileDetailsWidget extends StatelessWidget {
  const ProfileDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final currentUser = FirebaseAuth.instance.currentUser;
    final appTheme = AppTheme.of(context);

    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Builder(builder: (context) {
        if (currentUser!.photoURL == null) {
          return CircleAvatar(
            radius: appTheme.spaces.space_600,
            child: Text(
              currentUser.email![0].toUpperCase(),
              style: appTheme.typography.wh800,
            ),
          );
        } else {
          return CircleAvatar(
            radius: appTheme.spaces.space_600,
            backgroundImage: NetworkImage(currentUser.photoURL.toString()),
          );
        }
      }),
      SizedBox(
        height: appTheme.spaces.space_50,
      ),
      Builder(builder: (context) {
        if (currentUser!.displayName == null) {
          return Text(
            'Not verified',
            style: appTheme.typography.h500,
          );
        } else {
          return Text(
            currentUser.displayName!,
            style: appTheme.typography.h500,
          );
        }
      }),
      SizedBox(
        height: appTheme.spaces.space_50,
      ),
      Builder(builder: (context) {
        if (currentUser!.email == null) {
          return const Text('No email id');
        } else {
          return Text(
            currentUser.email.toString(),
            style: appTheme.typography.h400
                .copyWith(fontWeight: FontWeight.normal),
          );
        }
      })
    ]);
  }
}
