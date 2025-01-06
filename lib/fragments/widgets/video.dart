import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

/// Stateful widget to fetch and then display video content.
class VideoApp extends StatefulWidget {
  const VideoApp({super.key, required this.videoPath});
  final String videoPath;

  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse("http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4"));// .asset(widget.videoPath);
    _initializeVideoPlayer();
  }

  Future<void> _initializeVideoPlayer() async {
    await _controller.initialize();
    _controller.addListener(() {
      setState(() {});
    });
    _controller.setLooping(true);
    //_controller.play();
  }


  @override
  Widget build(BuildContext context) {
    return Column(children: [
      _controller.value.isInitialized
          ? AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            )
          : Container(),
    ]);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
