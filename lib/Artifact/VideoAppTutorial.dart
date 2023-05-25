import 'package:flutter/material.dart';
import 'package:sort_it_out/styles.dart';
import 'package:video_player/video_player.dart';

class VideoAppTutorial extends StatelessWidget {
  const VideoAppTutorial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = VideoPlayerController.asset(
        'assets/Sample-MP4-Video-File-for-Testing.mp4');
    controller.initialize();

    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            child: AspectRatio(
              aspectRatio: controller.value.aspectRatio,
              child: VideoPlayer(controller),
            ),
          ),
          const SizedBox(height: 16.0),
          const Text('App Tutorial: How to Use the App', style: titleTextStyle),
          const SizedBox(height: 8.0),
          const Text(
            'This video will guide you through the steps to use the app. You will learn how to navigate the app and its features to make the most out of it. Follow along and get started!',
            style: subtitleTextStyle,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
