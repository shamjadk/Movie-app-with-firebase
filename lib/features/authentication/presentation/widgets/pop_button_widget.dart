import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PopButtonWidget extends StatelessWidget {
  const PopButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => context.pop(),
      icon: const Icon(Icons.arrow_back),
    );
  }
}
