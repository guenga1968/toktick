import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:toktick/domain/entities/video_post.dart';
import 'package:toktick/presentation/widgets/shared/video_button.dart';
import 'package:toktick/share/video/full_screen_player.dart';

class VideoScrollableView extends StatelessWidget {
  final List<VideoPost> videos;
  const VideoScrollableView({super.key, required this.videos});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollBehavior: AppScrollBehavior(),
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      itemCount: videos.length,
      itemBuilder: (context, index) {
        final VideoPost videoPost = videos[index];
        return Stack(
          children: [
            // videoplayer y grandientes
            SizedBox.expand(
              child: FullScreenPlayer(
                caption: videoPost.caption,
                videoUrl: videoPost.imageUrl,
              ),
            ),
            Positioned(
                bottom: 40, right: 20, child: VideoButton(video: videoPost)),
          ],
        );
      },
    );
  }
}

class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
