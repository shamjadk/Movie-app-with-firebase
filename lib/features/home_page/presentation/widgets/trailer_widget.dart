import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app_with_firebase/core/widgets/loading_widget.dart';
import 'package:movie_app_with_firebase/features/home_page/domain/entity/movie_api_entity.dart';
import 'package:movie_app_with_firebase/features/home_page/presentation/provider/videos_provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TrailerWidget extends ConsumerWidget {
  final MovieApiEntity entity;
  const TrailerWidget({super.key, required this.entity});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
        height: 250,
        child: Center(
          child: ref.watch(trailerProvider(entity.id)).isRefreshing
              ? const LoadingWidget()
              : switch (ref.watch(trailerProvider(entity.id))) {
                  AsyncData(:final value) => CarouselSlider.builder(
                      options: CarouselOptions(
                        autoPlay: false,
                        enableInfiniteScroll: false,
                        scrollPhysics: const PageScrollPhysics(),
                        viewportFraction: 1,
                      ),
                      itemCount: value.length,
                      itemBuilder: (context, index, realIndex) => YoutubePlayer(
                        controller: YoutubePlayerController(
                          initialVideoId: value[index].key,
                          flags: const YoutubePlayerFlags(
                            autoPlay: false,
                            disableDragSeek: true,
                          ),
                        ),
                        bufferIndicator:
                            const Center(child: CircularProgressIndicator()),
                        showVideoProgressIndicator: true,
                      ),
                    ),
                  AsyncError(:final error) => Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(error.toString()),
                        IconButton(
                            onPressed: () {
                              ref.invalidate(trailerProvider);
                            },
                            icon: const Icon(
                              Icons.refresh,
                              size: 40,
                            ))
                      ],
                    ),
                  _ => const LoadingWidget()
                },
        ));
  }
}
