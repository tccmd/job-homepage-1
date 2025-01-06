import 'package:flutter/material.dart';
import 'package:job_homepage_1/loem.dart';

class Header extends StatelessWidget {
  const Header({Key? key, required this.widget1, required this.scrollController, required this.widget2, required this.widget3, required this.widget4}) : super(key: key);
  final GlobalKey widget1;
  final GlobalKey widget2;
  final GlobalKey widget3;
  final GlobalKey widget4;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.fromLTRB(10, 30, 10, 5),
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('COMPANYNAME', style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w800)),
          const SizedBox(width: double.minPositive),
          SizedBox(
            width: 450,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    final RenderBox renderBox =
                    widget1.currentContext!.findRenderObject() as RenderBox;
                    final position = renderBox.localToGlobal(Offset.zero);
                    scrollController.animateTo(
                      position.dy,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  },
                  child: const Text(Loem.loem),
                ),
                TextButton(
                  onPressed: () {
                    final RenderBox renderBox =
                    widget2.currentContext!.findRenderObject() as RenderBox;
                    final position = renderBox.localToGlobal(Offset.zero);
                    scrollController.animateTo(
                      position.dy,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  },
                  child: const Text(Loem.loem),
                ),
                TextButton(
                  onPressed: () {
                    final RenderBox renderBox =
                    widget3.currentContext!.findRenderObject() as RenderBox;
                    final position = renderBox.localToGlobal(Offset.zero);
                    scrollController.animateTo(
                      position.dy,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  },
                  child: const Text(Loem.loem),
                ),
                TextButton(
                  onPressed: () {
                    final RenderBox renderBox =
                    widget4.currentContext!.findRenderObject() as RenderBox;
                    final position = renderBox.localToGlobal(Offset.zero);
                    scrollController.animateTo(
                      position.dy,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  },
                  child: const Text(Loem.loem),
                ),
                TextButton(
                  onPressed: () {
                    final RenderBox renderBox =
                    widget4.currentContext!.findRenderObject() as RenderBox;
                    final position = renderBox.localToGlobal(Offset.zero);
                    scrollController.animateTo(
                      position.dy,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  },
                  child: const Text(Loem.loem),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
