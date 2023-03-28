import 'package:flutter/material.dart';
import 'package:vezeeta_app/view/pages/homePage.dart';

void main() {
  runApp(const VezeetaApp());
}

class VezeetaApp extends StatelessWidget {
  const VezeetaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(brightness: Brightness.dark),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
