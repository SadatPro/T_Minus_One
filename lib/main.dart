import 'package:flutter/material.dart';
import 'package:t_minus_one/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Nasa Space Apps Challenge',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
