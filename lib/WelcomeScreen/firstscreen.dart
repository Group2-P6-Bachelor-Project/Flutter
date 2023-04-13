import 'package:flutter/material.dart';
import 'package:flutter_application_1/CameraScreen/CameraScreen.dart';
import 'package:flutter_application_1/styles.dart';
import 'package:flutter/rendering.dart' show TextShadow;

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required Key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/chopstick.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black.withOpacity(0.7),
                  Colors.black.withOpacity(0.9),
                ],
                stops: const [0.4, 0.6, 1],
              ),
            ),
          ),
          Positioned.fill(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.15),
                Text(
                  'Welcome to SortItOut!',
                  style: titleTextStyle.copyWith(shadows: [
                    const Shadow(
                      color: Colors.black,
                      offset: Offset(1, 1),
                      blurRadius: 3,
                    ),
                  ]),
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Recycle with ease and help save the planet!',
                        style: subtitleTextStyle.copyWith(shadows: [
                          const Shadow(
                            color: Colors.black,
                            offset: Offset(1, 1),
                            blurRadius: 3,
                          ),
                        ]),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Join the revolution and sort your waste today.',
                        style: subtitleTextStyle.copyWith(shadows: [
                          const Shadow(
                            color: Colors.black,
                            offset: Offset(1, 1),
                            blurRadius: 3,
                          ),
                        ]),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.4),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CameraScreen(),
                      ),
                      (route) => false,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 16,
                    ),
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    'Begin Recycling',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
