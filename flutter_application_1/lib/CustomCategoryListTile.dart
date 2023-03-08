import 'package:flutter/material.dart';
import 'package:flutter_application_1/styles.dart';

class CustomCategoryListTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imagePath;

  const CustomCategoryListTile(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.imagePath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.shade300,
            width: 1,
          ),
        ),
      ),
      child: ListTile(
        leading: Image.asset(
          imagePath,
          width: 50,
          height: 50,
        ),
        title: Text(title, style: titleTextStyle),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
          child: Text(subtitle, style: subtitleTextStyle),
        ),
      ),
    );
  }
}
