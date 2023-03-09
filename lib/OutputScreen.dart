import 'package:flutter/material.dart';
import 'package:flutter_application_1/CustomOutputImage.dart';
import 'package:flutter_application_1/InformationScreen.dart';
import 'package:flutter_application_1/RecycleButtonWidget.dart';
import 'package:flutter_application_1/styles.dart';
import 'FeedbackScreen.dart';

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
          Container(
            height: 60,
            width: 400,
            margin: const EdgeInsets.only(top: 50),
            child: const RecycleButtonWidget(),
          ),
          const SizedBox(height: 20),
          InkWell(
            child: const Text(
              'Wrong category? Click here!',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.blue,
                decoration: TextDecoration.underline,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const FeedbackImageGrid()),
              );
            },
          ),
        ],
      ),
    );
  }
}
