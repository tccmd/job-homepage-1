import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  Description({Key? key, this.width}) : super(key: key);
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
    return Container();
  }

  Widget _buildWideContainers() {
    return Container();
  }
}
