import 'package:flutter/material.dart';

class MainTitle extends StatelessWidget {
  MainTitle({Key? key, required this.englishTitle, required this.koreanTitle, required this.widgetWidth}) : super(key: key);
  final String englishTitle;
  final String koreanTitle;
  final double widgetWidth;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (width > 700) {
          return _buildWideContainers(width);
        } else {
          return _buildNormalContainer(width);
        }
      },
    );
  }

  Widget _buildNormalContainer(width) {
    return Stack(
      children: [
        SizedBox(width: widgetWidth, height: 60),
        Positioned(child: Text(englishTitle, style: TextStyle(fontSize: 23, fontWeight: FontWeight.w800),), bottom: 0),
        Positioned(child: Text(koreanTitle, style: TextStyle(fontSize: 21),), right: 0, bottom: 3),
        Positioned(
          child: Container(
            width: (widgetWidth==width/2.4) ? widgetWidth/1.4 : widgetWidth/1.6,
            height: 2,
            color: Color(0xFFF67F00),
          ),
          right: 0,
          bottom: 0,
        )
      ],
    );
  }

  Widget _buildWideContainers(width) {
    return Stack(
      children: [
        SizedBox(width: widgetWidth, height: width/10),
        Positioned(child: Text(englishTitle, style: TextStyle(fontSize: width/40, fontWeight: FontWeight.w800),), bottom: 1),
        Positioned(child: Text(koreanTitle, style: TextStyle(fontSize: width/50, fontWeight: FontWeight.w600),), right: 0, bottom: 5),
        Positioned(
          child: Container(
            width: width/6.2,
            height: width/400,
            color: Color(0xFFF67F00),
          ),
          right: 0,
          bottom: 0,
        )
      ],
    );
  }
}