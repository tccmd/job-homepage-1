import 'package:job_homepage_1/fragments/widgets/equipment.dart';
import 'package:job_homepage_1/fragments/widgets/main_title.dart';
import 'package:flutter/material.dart';
import 'package:job_homepage_1/loem.dart';

class Description8 extends StatelessWidget {
  Description8({super.key, this.width});
  final GlobalKey widget3 = GlobalKey();
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
    return SizedBox(
      key: widget3,
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: width / 12),
          SizedBox(height: width / 12),
          MainTitle(
              widgetWidth: width / 1.8,
              englishTitle: Loem.titleBr,
              koreanTitle: Loem.loem),
          SizedBox(height: width / 12),
          const Text(
            Loem.short, style: TextStyle(fontSize: 15),
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
            softWrap: true,
          ),
          SizedBox(height: width / 12),
        ],
      ),
    );
  }

  Widget _buildWideContainers() {
    return Row(
      key: widget3,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(width: width/20),
        Column(
          children: [
            MainTitle(
                widgetWidth: width/4.5,
                englishTitle: Loem.titleBr,
                koreanTitle: Loem.loem),
            SizedBox(height: width/7),
          ],
        ),
        SizedBox(width: width/20),
        SizedBox(
          width: width/3,
          child: Text(
            Loem.short,
            style: TextStyle(fontSize: width/55, height: 2.0),
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
            softWrap: true,
          ),
        ),
      ],
    );
  }
}
