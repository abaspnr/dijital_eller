import 'package:dijitaleller/Kategoriler/Alfabe/BHarfi.dart';
import 'package:dijitaleller/Kategoriler/Alfabe/ZHarfi.dart';
import 'package:dijitaleller/Kategoriler/AlfabeKategorisi.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class AHarfi extends StatefulWidget {
  const AHarfi({super.key});

  @override
  State<AHarfi> createState() => _AHarfiState();
}

class _AHarfiState extends State<AHarfi> {
  late VideoPlayerController _controller;
  ChewieController? _chewieController;
  bool _isVideoInitialized = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        "https://storage.googleapis.com/dijital-eller-gifler/9.MP4")
      ..initialize().then((_) {
        setState(() {
          _isVideoInitialized = true;
          _chewieController = ChewieController(
            videoPlayerController: _controller,
            aspectRatio: _controller.value.aspectRatio,
            autoPlay: true,
            looping: true,
            showControls: false, // Hide all default controls
            customControls: VideoPlayerControls(), // Add custom controls
          );
        });
      }).catchError((error) {
        // Handle error here
        print('Error initializing video: $error');
      });
  }

  @override
  void dispose() {
    _chewieController?.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const AlfabeKategorisi()),
        );
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: Colors.pink,
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const AlfabeKategorisi()),
              );
            },
          ),
          title: Text(
            'Geri',
            style: TextStyle(
              color: Colors.pink,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.pink.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: _isVideoInitialized
                      ? AspectRatio(
                          aspectRatio: _chewieController?.aspectRatio ?? 16 / 9,
                          child: _chewieController != null
                              ? Chewie(controller: _chewieController!)
                              : SizedBox.shrink(),
                        )
                      : SizedBox(
                          width: screenWidth * 0.9,
                          height: screenHeight * 0.5,
                          child:
                              const Center(child: CircularProgressIndicator()),
                        ),
                ),
              ),
              const SizedBox(height: 50),
              const Text(
                "A Harfi",
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 50),
              Expanded(
                child: Container(),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.pink,
                      radius: 45,
                      child: IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              transitionDuration:
                                  const Duration(milliseconds: 300),
                              pageBuilder: (_, __, ___) => const ZHarfi(),
                              transitionsBuilder: (_, animation, __, child) {
                                return FadeTransition(
                                  opacity: animation,
                                  child: child,
                                );
                              },
                            ),
                          );
                        },
                        icon: const Icon(Icons.arrow_left, color: Colors.white),
                        iconSize: 45,
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.pink,
                      radius: 45,
                      child: IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              transitionDuration:
                                  const Duration(milliseconds: 300),
                              pageBuilder: (_, __, ___) => const BHarfi(),
                              transitionsBuilder: (_, animation, __, child) {
                                return FadeTransition(
                                  opacity: animation,
                                  child: child,
                                );
                              },
                            ),
                          );
                        },
                        icon:
                            const Icon(Icons.arrow_right, color: Colors.white),
                        iconSize: 45,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}

// Custom Video Controls Widget
class VideoPlayerControls extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            color: Colors.black.withOpacity(0.5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.speed, color: Colors.white),
                  onPressed: () {
                    // Implement speed control functionality here
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
