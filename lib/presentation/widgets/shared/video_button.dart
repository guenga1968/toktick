import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:toktick/domain/entities/video_post.dart';

import '../../../config/helpers/human_formats.dart';

class VideoButton extends StatelessWidget {
  const VideoButton({super.key, required this.video});
  final VideoPost video;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _CustomButton(value: video.likes, icon: Icons.favorite, iconColor: Colors.red),
        const SizedBox(height: 3,),
        _CustomButton(value: video.views,icon: Icons.remove_red_eye_outlined, ),
        const SizedBox(height: 3,),
        SpinPerfect(
          infinite: true,
          duration: const Duration(seconds: 2),
          child: const _CustomButton(value: 0, icon: Icons.play_circle_outline),),
       
      ],
    );
  }
}

class _CustomButton extends StatelessWidget {
  const _CustomButton(
      {required this.value, 
       required this.icon, 
      iconColor,
      }): color = iconColor ?? Colors.white;
  final int value;
  final IconData icon;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              icon,
              color: color,
              size: 30,
            )),
        if(value >0) Text(HumanFormats.humanRedableNumber(value.toDouble())), 
      ],
    );
  }
}
