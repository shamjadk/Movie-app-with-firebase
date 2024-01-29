import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app_with_firebase/features/home_page/domain/entity/movie_api_entity.dart';
import 'package:movie_app_with_firebase/features/home_page/presentation/widgets/sliver_body_info_page_widget.dart';
import 'package:movie_app_with_firebase/features/home_page/presentation/widgets/sliver_info_page_widget.dart';

class MovieInfoPage extends ConsumerWidget {
  static const routePath = '/info';
  final MovieApiEntity entity;
  const MovieInfoPage({super.key, required this.entity});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverInfoPageWidget(entity: entity),
          SliverBodyInfoPageWidget(entity: entity)
        ],
      ),
    );
  }
}
