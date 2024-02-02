import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_app_with_firebase/core/themes/app_theme.dart';
import 'package:movie_app_with_firebase/core/widgets/text_field_widget.dart';

import 'package:movie_app_with_firebase/features/home_page/presentation/provider/movie_api_provider.dart';
import 'package:movie_app_with_firebase/features/home_page/presentation/widgets/normal_app_bar_widget.dart';
import 'package:movie_app_with_firebase/features/home_page/presentation/widgets/search_gridview_widget.dart';

class SearchPage extends HookConsumerWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchController = useTextEditingController();
    final appTheme = AppTheme.of(context);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
          appBar: NormalAppBarWidget(
            title: 'Search',
            toolBarHeight: appTheme.spaces.space_50 * 15,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(appTheme.spaces.space_100),
              child: Column(
                children: [
                  TextFieldWidget(
                    controller: searchController,
                    labelText: 'Search here',
                    suffixicon: IconButton(
                        onPressed: () {
                          ref
                              .read(movieApiProvider.notifier)
                              .searchMovies(searchController.text, context);
                        },
                        icon: const Icon(Icons.search)),
                  ),
                  Builder(
                    builder: (context) {
                      return ref.watch(movieApiProvider).isLoading
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : ref.watch(movieApiProvider).when(
                              data: (data) {
                                final search = data.search;
                                if (search == null) {
                                  return const Align(
                                    child: Text('Search here'),
                                  );
                                } else {
                                  return SearchGridViewWidget(search: search);
                                }
                              },
                              error: (error, stackTrace) =>
                                  Text(error.toString()),
                              loading: () => const Center(
                                    child: CircularProgressIndicator(),
                                  ));
                    },
                  )
                ],
              ),
            ),
          )),
    );
  }
}
