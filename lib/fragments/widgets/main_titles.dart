import 'package:flutter/material.dart';

class MainTitles extends StatelessWidget {
  MainTitles({Key? key, this.width, required this.english, required this.korean}) : super(key: key);
  final GlobalKey widget1 = GlobalKey();
  final width;
  final String english;
  final String korean;

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
      alignment: Alignment.topCenter,
      children: [
        SizedBox(width: 240, height: 70),
        Positioned(child: Text(korean, style: TextStyle(fontSize: 19),), bottom: 0),
        Positioned(
          child: Container(
            width: 170,
            height: 15,
            color: Color(0xFFF67F00),
          ),
          top: 18,
        ),
        Positioned(child: Text(english, style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),)),
      ],
    );
  }

  Widget _buildWideContainers(width) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        SizedBox(width: width/4, height: width/15),
        Positioned(child: Text(korean, style: TextStyle(fontSize: width/55),), bottom: 0),
        Positioned(
          child: Container(
            width: width/6.5,
            height: width/85,
            color: Color(0xFFF67F00),
          ),
          top: width/56,
        ),
        Positioned(child: Text(english, style: TextStyle(fontSize: width/40, fontWeight: FontWeight.w600),)),
      ],
    );
  }
}
