import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:t_minus_one/chat_screen.dart';
import 'package:t_minus_one/custome_route.dart';
import 'package:t_minus_one/user_interection.dart';
import 'package:video_player/video_player.dart';
import 'package:t_minus_one/background.dart';

class LevelSelectionScreen extends StatelessWidget {
  const LevelSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BackGround(
      image: "assets/second.png",
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              CustomRoute(
                page: ChatScreen(),
              ),
            );
          },
          backgroundColor: Colors.purple.shade900,
          child: const Icon(Icons.chat, color: Colors.white),
        ),
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Positioned.fill(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Column(
                    children: List.generate(4, (index) {
                      return Align(
                        alignment: index % 2 == 0
                            ? const Alignment(-0.2, 0.0)
                            : const Alignment(0.2, 0.0),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  if (index == 1) {
                                    Navigator.push(
                                      context,
                                      CustomRoute(
                                        page: const CO2Interaction(),
                                      ),
                                    );
                                  } else {
                                    AlertDialog alert = AlertDialog(
                                      contentPadding: const EdgeInsets.all(0),

                                      // title: Text("Level ${index + 1}"),
                                      content: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: VideoPlayerWidget(
                                          videoPath: message((index + 1)),
                                        ),
                                      ),
                                    );

                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return alert;
                                      },
                                    );
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  shape: const CircleBorder(),
                                  padding: const EdgeInsets.all(15),
                                  backgroundColor: Colors.purple.shade900,
                                ),
                                child: Column(
                                  children: [
                                    Image.asset(
                                      "assets/planet-earth.png",
                                      scale: 12,
                                    ),
                                  ],
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
                                  'Level ${index + 1}',
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

// VideoPlayerWidget for handling video playback
class VideoPlayerWidget extends StatefulWidget {
  final String videoPath;

  const VideoPlayerWidget({required this.videoPath, super.key});

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.videoPath)
      ..initialize().then((_) {
        setState(() {
          _isInitialized = true;
        });
        _controller
            .play(); // Automatically play the video once it's initialized
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _isInitialized
        ? AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller),
          )
        : const Center(child: CircularProgressIndicator());
  }
}

// Helper function to generate messages
String message(int level) {
  switch (level) {
    case 1:
      return 'assets/video.mp4';
    // case 2:
    //   return 'assets/video.mp4';
    case 3:
      return 'assets/methen.mp4';
    case 4:
      return 'assets/nasa.mp4';
    default:
      return 'Unknown';
  }
}
