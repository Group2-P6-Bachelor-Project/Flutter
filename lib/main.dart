import 'package:flutter/material.dart';
// import 'package:sort_it_out/OutputScreen.dart';
import 'package:sort_it_out/WelcomeScreen/firstscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => const MaterialApp(
          home: HomeScreen(
        Key: null,
      ));
}
