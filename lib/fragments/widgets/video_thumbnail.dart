import 'dart:async';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ThumbnailVideoPlayerWidget extends StatefulWidget {
  const ThumbnailVideoPlayerWidget({super.key, required this.videoPath, required this.thumbnailPath});
  final String videoPath;
  final String thumbnailPath;

  @override
  _ThumbnailVideoPlayerWidgetState createState() => _ThumbnailVideoPlayerWidgetState();
}

class _ThumbnailVideoPlayerWidgetState extends State<ThumbnailVideoPlayerWidget> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;
  bool _isPlaying = false;
  bool _showThumbnail = true;
  bool _showPlayButton = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse("http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4")); //.asset(widget.videoPath);
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
    _controller.setVolume(0.0);

    _controller.addListener(() {
      if (_controller.value.isPlaying && _showThumbnail) {
        setState(() {
          _showThumbnail = false;
        });
      } else if (!_controller.value.isPlaying && !_showThumbnail) {
        setState(() {
          _showThumbnail = true;
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildPlayPauseButton() {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (_controller.value.isPlaying) {
            _controller.pause();
            _isPlaying = false;
          } else {
            _controller.play();
            _isPlaying = true;
          }
        });
      },
      child: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.black54,
        ),
        child: Icon(
          _isPlaying ? Icons.pause : Icons.play_arrow,
          size: 48,
          color: Colors.white,
        ),
      ),
    );
  }

  void _togglePlayButtonVisibility(bool isVisible) {
    setState(() {
      _showPlayButton = isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initializeVideoPlayerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return MouseRegion(
            onEnter: (_) {
              _togglePlayButtonVisibility(true);
            },
            onExit: (_) {
              _togglePlayButtonVisibility(false);
            },
            child: Stack(
              children: [
                AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                ),
                Positioned.fill(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        if (_controller.value.isPlaying) {
                          _controller.pause();
                        } else {
                          _controller.play();
                        }
                        _isPlaying = _controller.value.isPlaying;
                        if (_showThumbnail) {
                          _showThumbnail = false;
                        }
                      });
                    },
                    child: Container(
                      color: Colors.transparent,
                      child: Align(
                        alignment: Alignment.center,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width *
                                  _controller.value.aspectRatio,
                              height: MediaQuery.of(context).size.height,
                            ),
                            Visibility(
                              visible: !_controller.value.isPlaying || _showThumbnail,
                              child: Image.asset(
                                './images/unsplash1.jpg',// widget.thumbnailPath,
                                fit: BoxFit.cover,
                              ),
                              // 사진: <a href="https://unsplash.com/ko/%EC%82%AC%EC%A7%84/%EC%82%B0%EA%B3%BC-%EB%82%98%EB%AC%B4%EB%A1%9C-%EB%91%98%EB%9F%AC%EC%8B%B8%EC%9D%B8-%ED%98%B8%EC%88%98-vNVwg35VZrg?utm_content=creditCopyText&utm_medium=referral&utm_source=unsplash">Unsplash</a>의<a href="https://unsplash.com/ko/@philipp_dice?utm_content=creditCopyText&utm_medium=referral&utm_source=unsplash">Philipp Düsel</a>
                            ),
                            AnimatedOpacity(
                              opacity: _showPlayButton ? 1.0 : 0.0,
                              duration: Duration(milliseconds: 200),
                              child: _buildPlayPauseButton(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}