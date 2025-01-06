import 'package:job_homepage_1/fragments/widgets/main_titles.dart';
import 'package:flutter/material.dart';
import 'package:job_homepage_1/loem.dart';

class Description5 extends StatelessWidget {
  Description5({Key? key, this.width}) : super(key: key);
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
    return Container(
      height: 400,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          MainTitles(english: Loem.title, korean: Loem.title),
          MainTitles(english: Loem.title2, korean: Loem.title2),
          MainTitles(english: Loem.title3, korean: Loem.title3),
        ],
      ),
    );
  }

  Widget _buildWideContainers() {
    return Column(
      children: [
        SizedBox(height: width/12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MainTitles(english: Loem.title2, korean: Loem.title2),
            SizedBox(width: width/50),
            MainTitles(english: Loem.title, korean: Loem.title),
            MainTitles(english: Loem.title3, korean: Loem.title3),
          ],
        ),
      ],
    );
  }
}
