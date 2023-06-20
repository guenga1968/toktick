
import 'package:flutter/material.dart';
import 'package:toktick/share/video/video_background.dart';
import 'package:video_player/video_player.dart';


class FullScreenPlayer extends StatefulWidget {
  const FullScreenPlayer(
      {super.key, required this.caption, required this.videoUrl});

  final String caption;
  final String videoUrl;
  

  @override
  State<FullScreenPlayer> createState() => _FullScreenPlayerState();
}

class _FullScreenPlayerState extends State<FullScreenPlayer> {

  
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
   
    _controller = VideoPlayerController.asset(widget.videoUrl)
      ..setVolume(10)
      ..setLooping(true)
      ..play();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    return FutureBuilder(
      future:_controller.initialize(),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(
            child: CircularProgressIndicator(
              strokeWidth: 2,
            ),
          );
        } else {
          return GestureDetector(
            onDoubleTap: () {
              if(_controller.value.isPlaying){
                _controller.pause();
                return;
              }
              _controller.play();
             },
            child: AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: Stack(children: [
                
                VideoPlayer(_controller),
                VideoBackground( stops: const [0.8,1.0],),
                Positioned(
                    bottom: 50,
                    left: 20,
                    child: _VideoCaption(
                      videoCaption: widget.caption,
                    )),
              ]),
            ),
          );
        }
      },
    );
  }
}

class _VideoCaption extends StatelessWidget {
  final String videoCaption;

  const _VideoCaption({required this.videoCaption});

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.titleLarge;
    final size = MediaQuery.of(context).size;
    return SizedBox(
        width: size.width * 0.60,
        child: Text(
          videoCaption,
          maxLines: 2,
          style: style,
        ));
  }
}
