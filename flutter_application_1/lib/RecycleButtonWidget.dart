import 'package:flutter/material.dart';
import 'package:flutter_application_1/CameraScreen.dart';

class RecycleButtonWidget extends StatelessWidget {
  const RecycleButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      label: const Text(
        'Want to recycle more?',
        style: TextStyle(
          fontFamily: 'Roboto',
          fontStyle: FontStyle.normal,
          fontSize: 25,
          color: Colors.white,
        ),
      ),
      backgroundColor: Colors.brown[800],
      icon: const Icon(
        Icons.arrow_back,
        size: 25.0,
        color: Colors.white,
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const CameraScreen()),
        );
      },
    );
  }
}
