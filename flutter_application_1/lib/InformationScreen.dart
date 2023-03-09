import 'package:flutter/material.dart';
// import 'package:flutter_application_1/VideoAppTutorial.dart';
import 'package:flutter_application_1/styles.dart';
import 'package:flutter_application_1/CustomCategoryListTile.dart';
import 'EnvironmentalImpactSection.dart';

class InformationScreen extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const InformationScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[400],
      appBar: CustomAppBar(
        title: 'Information',
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: const <Widget>[
                CustomCategoryListTile(
                  title: 'Paper',
                  subtitle:
                      'Recycle newspapers, magazines, phone books, paper packaging and wrapping paper',
                  imagePath: 'assets/Papir.png',
                ),
                CustomCategoryListTile(
                  title: 'Cardboard',
                  subtitle:
                      'Recyclable items: cardboard boxes, cereal boxes, etc.',
                  imagePath: 'assets/pap2.jpg',
                ),
                CustomCategoryListTile(
                  title: 'Plastic',
                  subtitle:
                      'Recyclable items: water bottles, milk jugs, plastic bags, etc.',
                  imagePath: 'assets/Plast.png',
                ),
                CustomCategoryListTile(
                  title: 'Metal',
                  subtitle: 'Recyclable items: aluminum cans, steel cans, etc.',
                  imagePath: 'assets/Metal.png',
                ),
                CustomCategoryListTile(
                  title: 'Glass',
                  subtitle: 'Recyclable items: glass bottles, jars, etc.',
                  imagePath: 'assets/Glas.png',
                ),
                CustomCategoryListTile(
                  title: 'Other',
                  subtitle: 'Recyclable items: batteries, electronics, etc.',
                  imagePath: 'assets/RestAffald.png',
                ),
              ],
            ),
            const EnvironmentalImpactSection(),
          ],
        ),
      ),
    );
  }
}
