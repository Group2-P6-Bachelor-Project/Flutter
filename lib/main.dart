import 'package:flutter/material.dart';
// import 'package:flutter_application_1/OutputScreen.dart';
import 'package:flutter_application_1/firstscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => const MaterialApp(home: HomeScreen());
}
