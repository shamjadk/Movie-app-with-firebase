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
        child: ref.watch(trailerProvider(entity.id)).isRefreshing
            ? const LoadingWidget()
            : switch (ref.watch(trailerProvider(entity.id))) {
                AsyncData(:final value) => YoutubePlayer(
                    controller: YoutubePlayerController(
                      initialVideoId: value[0].id,
                      flags: const YoutubePlayerFlags(
                        autoPlay: false,
                        disableDragSeek: true,
                      ),
                    ),
                    bufferIndicator:
                        const Center(child: CircularProgressIndicator()),
                    showVideoProgressIndicator: true,
                  ),
                AsyncError(:final error) => Column(
                    children: [
                      Text(error.toString()),
                      IconButton(
                          onPressed: () {
                            ref.invalidate(trailerProvider);
                          },
                          icon: const Icon(Icons.refresh))
                    ],
                  ),
                _ => const LoadingWidget()
              });
  }
}