import 'package:flutter/material.dart';

class PictureButton extends StatelessWidget {
  final IconData icon;
  final Alignment alignment;

  const PictureButton(this.icon, this.alignment, {super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: alignment,
        child: Container(
            margin: const EdgeInsets.only(
              left: 20,
              bottom: 60,
            ),
            height: 70,
            width: 70,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  offset: Offset(2, 2),
                  blurRadius: 10,
                ),
              ],
            ),
            child: Center(
              child: Icon(
                icon,
                color: Colors.black54,
                size: 50,
              ),
            )));
  }
}
