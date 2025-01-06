import 'package:job_homepage_1/fragments/widgets/video.dart';
import 'package:job_homepage_1/fragments/widgets/video_thumbnail.dart';
import 'package:flutter/material.dart';

class Description4 extends StatelessWidget {
  Description4({Key? key, this.width}) : super(key: key);
  final width;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (width > 700) {
          return _buildWideContainers();
        } else {
          return _buildNormalContainer();
        }
      },
    );
  }

  Widget _buildNormalContainer() {
    return Column(
      children: [
        SizedBox(height: 40),
        Container(child: ThumbnailVideoPlayerWidget(videoPath: 'assets/video/video3.mp4', thumbnailPath: 'assets/thumbnail/tumbnail3.jpg'), width: 500),
        SizedBox(height: 20),
        Container(child: ThumbnailVideoPlayerWidget(videoPath: 'assets/video/video4.mp4', thumbnailPath: 'assets/thumbnail/tumbnail4.jpg'), width: 500),
        SizedBox(height: 60),
      ],
    );
  }

  Widget _buildWideContainers() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(child: ThumbnailVideoPlayerWidget(videoPath: 'assets/video/video3.mp4', thumbnailPath: 'assets/thumbnail/tumbnail3.jpg'), width: width/2.3),
            Container(child: ThumbnailVideoPlayerWidget(videoPath: 'assets/video/video4.mp4', thumbnailPath: 'assets/thumbnail/tumbnail4.jpg'), width: width/2.3),
          ],
        ),
      ],
    );
  }
}
