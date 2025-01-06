import 'package:job_homepage_1/fragments/widgets/video.dart';
import 'package:job_homepage_1/fragments/widgets/video_thumbnail.dart';
import 'package:flutter/material.dart';
import 'package:job_homepage_1/loem.dart';

class Description3 extends StatelessWidget {
  Description3({Key? key, this.width}) : super(key: key);
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
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          child: ThumbnailVideoPlayerWidget(
              videoPath: 'assets/video/video2.mp4',
              thumbnailPath: 'assets/thumbnail/tumbnail2.jpg'),
          width: 500,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(height: 20),
            Text(Loem.title,
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.w800)),
            Text(Loem.loem,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400)),
            SizedBox(height: 40),
            Text(
              Loem.short,
              textAlign: TextAlign.right,
              style: TextStyle(fontSize: 15),
            ),
          ],
        )
      ],
    );
  }

  Widget _buildWideContainers() {
    return Column(
      children: [
        SizedBox(height: width / 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Container(
                  child: ThumbnailVideoPlayerWidget(
                      videoPath: 'assets/video/video2.mp4',
                      thumbnailPath: 'assets/thumbnail/tumbnail2.jpg'),
                  width: width / 2.1,
                ),
                SizedBox(height: width / 7.5),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              // mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(height: width / 7.5),
                Text(Loem.title,
                    style: TextStyle(
                        fontSize: width / 26, fontWeight: FontWeight.w900)),
                Text(Loem.loem,
                    style: TextStyle(
                        fontSize: width / 40, fontWeight: FontWeight.w700)),
                SizedBox(height: width / 20),
                SizedBox(
                  width: width/2.5,
                  child: Text(
                    Loem.short,
                    textAlign: TextAlign.right,
                    style: TextStyle(fontSize: width / 55, height: 2),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    softWrap: true,
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: width / 10),
      ],
    );
  }
}
