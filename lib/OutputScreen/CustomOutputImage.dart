import 'package:flutter/material.dart';

class CustomOutputImage extends StatelessWidget {
  final int index;

  const CustomOutputImage({Key? key, required this.index}) : super(key: key);

  static const List<String> _imagePaths = [
    'assets/Pap.png',
    'assets/Glas.png',
    'assets/Metal.png',
    'assets/Papir.png',
    'assets/Plast.png',
    'assets/RestAffald.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.brown.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 7,
            offset: const Offset(20, 20),
          ),
        ],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Image.asset(
        _imagePaths[index],
        width: 300,
      ),
    );
  }
}
