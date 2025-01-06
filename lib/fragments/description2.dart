import 'package:job_homepage_1/fragments/widgets/main_title.dart';
import 'package:flutter/material.dart';
import 'package:job_homepage_1/loem.dart';

class Description2 extends StatelessWidget {
  Description2({Key? key, this.width}) : super(key: key);
  final GlobalKey widget1 = GlobalKey();
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
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(height: width / 12, width: width / 1.1, key: widget1),
        SizedBox(height: width / 12),
        SizedBox(height: width / 12),
        SizedBox(height: width / 12),
        SizedBox(height: width / 12),
        MainTitle(
            widgetWidth: width / 1.9,
            englishTitle: Loem.titleBr,
            koreanTitle: Loem.loem),
        SizedBox(height: width / 12),
        const Text(
          Loem.short,
          style: TextStyle(fontSize: 15),
        ),
        SizedBox(height: width / 12),
      ],
    );
  }

  Widget _buildWideContainers() {
    return Row(
      key: widget1,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(width: width/20),
        Column(
          children: [
            MainTitle(
                widgetWidth: width/4,
                englishTitle: Loem.titleBr,
                koreanTitle: Loem.loem),
          ],
        ),
        SizedBox(width: width/20),
        Column(
          children: [
            SizedBox(height: width/15),
            SizedBox(
              width: width/2,
              child: Text(
                Loem.short,
                textAlign: TextAlign.right,
                style: TextStyle(fontSize: width / 55, height: 2),
                overflow: TextOverflow.ellipsis,
                maxLines: 4,
                softWrap: true,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
