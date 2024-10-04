import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:t_minus_one/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeRight,
    ]);
    return const MaterialApp(
      title: 'Nasa Space Apps Challenge',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
