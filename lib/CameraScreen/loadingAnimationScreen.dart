import 'package:flutter/material.dart';
import 'package:sort_it_out/CameraScreen/rainbowProgressIndicator.dart';

class LoadingAnimationScreen extends StatelessWidget {
  const LoadingAnimationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[400],
      body: const Center(
        child: SizedBox(
          width: 100,
          height: 100,
          child: RainbowProgressIndicator(),
        ),
      ),
    );
  }
}
