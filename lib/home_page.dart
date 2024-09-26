import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:t_minus_one/background.dart';
import 'package:t_minus_one/custome_route.dart';
import 'package:t_minus_one/level_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BackGround(
      image: "assets/first.png",
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.only(bottom: 50),
          child: Align(
            alignment: Alignment.center,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.purple.shade900,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 30,
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 20,
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  CustomRoute(
                    page: const LevelSelectionScreen(),
                  ),
                );
              },
              child: Text(
                "Explore the Climate",
                style: GoogleFonts.khand(
                  textStyle: Theme.of(context).textTheme.displayLarge,
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
