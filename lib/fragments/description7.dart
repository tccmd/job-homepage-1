import 'package:job_homepage_1/fragments/widgets/main_title.dart';
import 'package:job_homepage_1/fragments/widgets/video.dart';
import 'package:job_homepage_1/fragments/widgets/video_button.dart';
import 'package:job_homepage_1/fragments/widgets/video_widget.dart';
import 'package:flutter/material.dart';
import 'package:job_homepage_1/loem.dart';

class Description7 extends StatelessWidget {
  Description7({Key? key, this.width}) : super(key: key);
  final GlobalKey widget2 = GlobalKey();
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 50),
        MainTitle(
            key: widget2,
            widgetWidth: width/2.4,
            englishTitle: Loem.titleBr,
            koreanTitle: Loem.loem),
        SizedBox(height: width/6),
        Column(
          children: [
            Container(width: width,
              child: Center(
                child: Column(
                  children: [
                    Text(Loem.title, style: TextStyle(
                        fontSize: 26, fontWeight: FontWeight.w600),),
                    SizedBox(height: width/15),
                    Text(Loem.title2, style: TextStyle(
                        fontSize: 19, fontWeight: FontWeight.w600)),
                    Text(Loem.short,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 17, height: 2.0),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 4,
                      softWrap: true,
                    ),
                    SizedBox(height: width/12),
                    Text(Loem.title3, style: TextStyle(
                        fontSize: 19, fontWeight: FontWeight.w600)),
                    Text(Loem.titleBr,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 17, height: 2.0),),
                    SizedBox(height: width/10),
                  ],
                ),
              ),
            ),
            Column(
                children: [
                  SizedBox(height: 40),
                  Container(child: VideoWidget(videoPath: 'assets/video/video5.mp4'), width: 500),
                  SizedBox(height: width/12),
                  Container(child: VideoWidget(videoPath: 'assets/video/video6.mp4'), width: 500),
                  SizedBox(height: 40),
                ]),
          ],
        ),
      ],
    );
  }

  Widget _buildWideContainers() {
    return Column(
      //crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            SizedBox(width: width/20),
            MainTitle(
              widgetWidth: width/4.5,
                englishTitle: Loem.titleBr,
                koreanTitle: Loem.loem),
            SizedBox(width: width/2.4)
          ],
        ),
        SizedBox(height: width/24),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(width/12, 0, 0, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(Loem.title, style: TextStyle(
                      fontSize: width/35, fontWeight: FontWeight.w900),),
                  SizedBox(height: width/20),
                  Text(Loem.title2, style: TextStyle(
                      fontSize: width/40, fontWeight: FontWeight.w600)),
                  SizedBox(height: width/24),
                  SizedBox(
                    width: width/3.7,
                    child: Text(Loem.short,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: width/55, height: 2.0),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 4,
                      softWrap: true,
                    ),
                  ),
                  SizedBox(height: width/20),
                  Text(Loem.title3, style: TextStyle(
                      fontSize: width/40, fontWeight: FontWeight.w600)),
                  SizedBox(height: width/24),
                  Text(Loem.titleBr,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: width/55, height: 2.0),),
                ],
              ),
            ),
            Column(
                children: [
                  Container(child: VideoWidget(videoPath: 'assets/video/video5.mp4'), width: width/2.3),
                  SizedBox(height: width/25),
                  Container(child: VideoWidget(videoPath: 'assets/video/video6.mp4'), width: width/2.3),
                ]),
          ],
        ),
        SizedBox(height: width/12),
        SizedBox(height: width/12),
        SizedBox(height: width/24),
      ],
    );
  }
}
