import 'package:flutter/material.dart';
import 'package:sort_it_out/OutputScreen/CustomOutputImage.dart';
import 'package:sort_it_out/InformationScreen/InformationScreen.dart';
import 'package:sort_it_out/OutputScreen/RecycleButtonWidget.dart';
import 'package:sort_it_out/styles.dart';
import 'package:sort_it_out/FeedbackScreen/FeedbackScreen.dart';
import 'dart:math';

class OutputScreen extends StatelessWidget {
  final int index;
  const OutputScreen({Key? key, required this.index}) : super(key: key);

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
              // Ths line of code needs to be changed to the label given by the model, 
              // and then the outputscreen should work just fine.
              CustomOutputImage(index: index),
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
