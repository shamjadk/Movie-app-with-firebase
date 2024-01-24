import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app_with_firebase/features/home_page/presentation/provider/movie_api_provider.dart';

class TryAgainButtonWidget extends ConsumerWidget {
  const TryAgainButtonWidget({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return  Center(
            child: TextButton(
                onPressed: () {
                  ref.invalidate(movieApiProvider);
                },
                child: const Text('Try again')),
          );
  }
}