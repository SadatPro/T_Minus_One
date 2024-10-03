import 'package:flutter/material.dart';

class AnimatedCo2 extends StatelessWidget {
  const AnimatedCo2({
    super.key,
    required this.isCO2Added,
    required this.left,
  });

  final bool isCO2Added;
  final double left;

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: const Duration(seconds: 4),
      top: isCO2Added ? 270 : 100,
      left: left,
      child: Image.asset(
        'assets/co2.png',
        height: 60,
      ),
    );
  }
}
