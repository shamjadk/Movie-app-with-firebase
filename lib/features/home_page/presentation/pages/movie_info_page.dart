import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app_with_firebase/core/themes/app_theme.dart';
import 'package:movie_app_with_firebase/core/utils/api_utils.dart';
import 'package:movie_app_with_firebase/features/authentication/presentation/widgets/pop_button_widget.dart';
import 'package:movie_app_with_firebase/features/home_page/domain/entity/movie_api_entity.dart';
import 'package:movie_app_with_firebase/features/home_page/presentation/widgets/favourite_button_widget.dart';
import 'package:movie_app_with_firebase/features/home_page/presentation/widgets/home_pop_button_widget.dart';

class MovieInfoPage extends ConsumerWidget {
  static const routePath = '/info';
  final MovieApiEntity entity;
  const MovieInfoPage({super.key, required this.entity});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTheme = AppTheme.of(context);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            elevation: 0,
            backgroundColor: appTheme.colors.text,
            automaticallyImplyLeading: false,
            pinned: true,
            leading: const HomePopButtonWidget(),
            // title: Text('dddd'),
            actions: const [FavouriteButtonWidget()],
            expandedHeight: appTheme.spaces.space_700 * 10,
            flexibleSpace: LayoutBuilder(
              builder: (context, contraints) {
                final top = contraints.biggest.height;
                return FlexibleSpaceBar(
                  background: Image.network(
                    ApiUtils.imageBasePath + entity.posterPath,
                    fit: BoxFit.cover,
                  ),
                  title: Opacity(
                    opacity: top ==
                            MediaQuery.of(context).padding.top + kToolbarHeight
                        ? 1
                        : 0,
                    child: Text('dddd'),
                  ),
                );
              },
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [],
            ),
          )
        ],
      ),
    );
  }
}
