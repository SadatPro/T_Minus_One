import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:t_minus_one/background.dart';

class LevelSelectionScreen extends StatelessWidget {
  const LevelSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BackGround(
      image: "assets/second.png",
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Positioned.fill(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Column(
                    children: List.generate(4, (index) {
                      int i = 3;
                      return Align(
                        alignment: index % 2 == 0
                            ? const Alignment(-0.2, 0.0)
                            : const Alignment(0.2, 0.0),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  shape: const CircleBorder(),
                                  padding: const EdgeInsets.all(15),
                                  backgroundColor: Colors.purple.shade900,
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        backgroundColor:
                                            Colors.black.withOpacity(0.6),
                                        behavior: SnackBarBehavior.floating,
                                        content: Text(
                                          message(i - index + 1),
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        "assets/planet-earth.png",
                                        scale: 12,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8),
                              Container(
                                width: 80,
                                height: 35,
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.7),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  'Level ${i - index + 1}',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.khand(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 28,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

String message(int level) {
  switch (level) {
    case 1:
      return 'Greeenhouse gases are increasing';
    case 2:
      return 'Carbon sequestration is decreasing';
    case 3:
      return 'Wetlands are disappearing';
    case 4:
      return 'Population is increasing';
    default:
      return 'Unknown';
  }
}
