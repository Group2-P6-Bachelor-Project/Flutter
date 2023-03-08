import 'package:flutter/material.dart';
import 'package:flutter_application_1/CameraScreen.dart';
import 'package:flutter_application_1/CustomOutputImage.dart';
import 'package:flutter_application_1/InformationScreen.dart';
import 'package:flutter_application_1/styles.dart';

class OutputScreen extends StatelessWidget {
  const OutputScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[400],
      appBar: CustomAppBar(
        title: 'SortItOut',
        trailing: IconButton(
          icon: const Icon(Icons.info_outline),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const InformationScreen()),
            );
          },
        ),
      ),
      body: Column(
        children: [
          Column(
            children: [
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(top: 100, bottom: 25),
                child: const Text('Recycle in:', style: titleTextStyle),
              ),
              const CustomOutputImage(
                imagePath: 'assets/Plast.png',
              ),
            ],
          ),
          const Spacer(),
          Container(
            height: 60,
            width: 400,
            margin: const EdgeInsets.only(bottom: 100),
            child: FloatingActionButton.extended(
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
            ),
          )
        ],
      ),
    );
  }
}
