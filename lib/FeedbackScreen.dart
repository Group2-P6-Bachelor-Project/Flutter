import 'package:flutter/material.dart';
import 'package:flutter_application_1/styles.dart';

class FeedbackImageGrid extends StatelessWidget {
  const FeedbackImageGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[400],
      appBar: const CustomAppBar(
        title: 'SortItOut',
      ),
      body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(top: 15.0) + const EdgeInsets.all(16.0),
            child: const Text(
              'Choose the correct category',
              style: titleTextStyle,
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              children: [
                Image.asset('assets/Glas.png'),
                Image.asset('assets/Metal.png'),
                Image.asset('assets/pap2.jpg'),
                Image.asset('assets/Papir.png'),
                Image.asset('assets/Plast.png'),
                Image.asset('assets/RestAffald.png'),
              ]
                  .map((image) => IconButton(
                        icon: image,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
