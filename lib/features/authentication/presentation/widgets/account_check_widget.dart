import 'package:flutter/material.dart';

class AccountCheckWidget extends StatelessWidget {
  final String text;
  final String buttonName;
  final Widget navigation;
  const AccountCheckWidget(
      {super.key, required this.text, required this.buttonName,required this.navigation});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text),
        TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>  navigation,
                  ));
            },
            child: Text(buttonName))
      ],
    );
  }
}
