import 'package:flutter/material.dart';
import 'package:flutter_application_1/styles.dart';
import 'package:video_player/video_player.dart';

class VideoAppTutorial extends StatefulWidget {
  const VideoAppTutorial({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _VideoAppTutorialState createState() => _VideoAppTutorialState();
}

class _VideoAppTutorialState extends State<VideoAppTutorial> {
  late VideoPlayerController _controller;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(
        'assets/Sample-MP4-Video-File-for-Testing.mp4');
    _controller.initialize().then((_) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Tutorial'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              child: _controller.value.isInitialized
                  ? GestureDetector(
                      onTap: () {
                        setState(() {
                          _isPlaying ? _controller.pause() : _controller.play();
                          _isPlaying = !_isPlaying;
                        });
                      },
                      child: AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        child: VideoPlayer(_controller),
                      ),
                    )
                  : const Center(
                      child: CircularProgressIndicator(),
                    ),
            ),
            const SizedBox(height: 16.0),
            const Text('App Tutorial: How to Use the App',
                style: titleTextStyle),
            const SizedBox(height: 8.0),
            const Text(
                'This video will guide you through the steps to use the app. You will learn how to navigate the app and its features to make the most out of it. Follow along and get started!',
                style: subtitleTextStyle),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
