import 'dart:async';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ButtonVideoPlayerWidget extends StatefulWidget {
  const ButtonVideoPlayerWidget({Key? key, required this.videoPath}) : super(key: key);
  final String videoPath;

  @override
  _ButtonVideoPlayerWidgetState createState() => _ButtonVideoPlayerWidgetState();
}

class _ButtonVideoPlayerWidgetState extends State<ButtonVideoPlayerWidget> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;
  bool _isPlaying = false;
  bool _showPlayButton = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.videoPath);
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
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
        decoration: BoxDecoration(
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
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';
//
// class ButtonVideoPlayerWidget extends StatefulWidget {
//   const ButtonVideoPlayerWidget({Key? key, required this.videoPath})
//       : super(key: key);
//   final String videoPath;
//
//   @override
//   _ButtonVideoPlayerWidgetState createState() =>
//       _ButtonVideoPlayerWidgetState();
// }
//
// class _ButtonVideoPlayerWidgetState extends State<ButtonVideoPlayerWidget> {
//   late VideoPlayerController _controller;
//   late Future<void> _initializeVideoPlayerFuture;
//   bool _isPlaying = false;
//   bool _showThumbnail = true;
//   bool _showPlayButton = false;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = VideoPlayerController.asset(widget.videoPath);
//     _initializeVideoPlayerFuture = _controller.initialize().then((_) {
//       setState(() {
//         _showThumbnail = true;
//       });
//     });
//     _controller.setLooping(true);
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   Widget _buildPlayPauseButton() {
//     return GestureDetector(
//       onTap: () {
//         setState(() {
//           if (_controller.value.isPlaying) {
//             _controller.pause();
//             _isPlaying = false;
//           } else {
//             _controller.play();
//             _isPlaying = true;
//           }
//         });
//       },
//       child: Container(
//         decoration: BoxDecoration(
//           shape: BoxShape.circle,
//           color: Colors.black54,
//         ),
//         child: Icon(
//           _isPlaying ? Icons.pause : Icons.play_arrow,
//           size: 48,
//           color: Colors.white,
//         ),
//       ),
//     );
//   }
//
//   void _togglePlayButtonVisibility(bool isVisible) {
//     setState(() {
//       _showPlayButton = isVisible;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: _initializeVideoPlayerFuture,
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.done) {
//           return MouseRegion(
//             onEnter: (_) {
//               _togglePlayButtonVisibility(true);
//             },
//             onExit: (_) {
//               _togglePlayButtonVisibility(false);
//             },
//             child: Stack(
//               children: [
//                 AspectRatio(
//                   aspectRatio: _controller.value.aspectRatio,
//                   child: VideoPlayer(_controller),
//                 ),
//                 Positioned.fill(
//                   child: GestureDetector(
//                     onTap: () {
//                       setState(() {
//                         if (_controller.value.isPlaying) {
//                           _controller.pause();
//                         } else {
//                           _controller.play();
//                         }
//                       });
//                     },
//                     child: Container(
//                       color: Colors.transparent,
//                       child: Align(
//                         alignment: Alignment.center,
//                         child: Stack(
//                           alignment: Alignment.center,
//                           children: [
//                             SizedBox(
//                               width: MediaQuery.of(context).size.width *
//                                   _controller.value.aspectRatio,
//                               height: MediaQuery.of(context).size.height,
//                             ),
//                             AnimatedOpacity(
//                               opacity: _showPlayButton ? 1.0 : 0.0,
//                               duration: Duration(milliseconds: 200),
//                               child: _buildPlayPauseButton(),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           );
//         } else {
//           return Center(
//             child: CircularProgressIndicator(),
//           );
//         }
//       },
//     );
//   }
// }
