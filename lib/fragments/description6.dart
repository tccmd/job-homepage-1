import 'package:flutter/material.dart';
import 'package:job_homepage_1/loem.dart';

class Description6 extends StatelessWidget {
  Description6({Key? key, this.width}) : super(key: key);
  final width;

  @override
  Widget build(BuildContext context) {
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
    return Container(
      child: Column(
        children: [
          SizedBox(height: width/8),
          const Text(
            Loem.short,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18, height: 2),
            overflow: TextOverflow.ellipsis,
            maxLines: 5,
            softWrap: true,
          ),
          SizedBox(height: 100),
        ],
      ),
    );
  }

  Widget _buildWideContainers(width) {
    return Column(
      children: [
        SizedBox(height: width/12),
        const Text(
          Loem.desc,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18, height: 2),
          overflow: TextOverflow.ellipsis,
          maxLines: 5,
          softWrap: true,
        ),
        SizedBox(height: width/9),
      ],
    );
  }
}
