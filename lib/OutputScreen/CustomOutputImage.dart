import 'package:flutter/material.dart';

class CustomOutputImage extends StatelessWidget {
  final String imagePath;

  const CustomOutputImage({Key? key, required this.imagePath})
      : super(key: key);

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
        imagePath,
        width: 300,
      ),
    );
  }
}
