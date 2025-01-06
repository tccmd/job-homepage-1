import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:job_homepage_1/loem.dart';

class DrawerListView extends StatelessWidget {
  const DrawerListView({
    Key? key,
    required this.widget1,
    required this.widget2,
    required this.widget3,
    required this.widget4,
    required this.scrollController,
  }) : super(key: key);

  final GlobalKey widget1;
  final GlobalKey widget2;
  final GlobalKey widget3;
  final GlobalKey widget4;
  final ScrollController scrollController;

  void _scrollToWidget(GlobalKey widgetKey) {
    final RenderObject? renderObject = widgetKey.currentContext?.findRenderObject();
    if (renderObject is RenderBox) {
      final RenderAbstractViewport? viewport = RenderAbstractViewport.of(renderObject);
      if (viewport != null) {
        final double offset = viewport.getOffsetToReveal(renderObject, 0.0).offset;
        scrollController.animateTo(
          offset,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        ListTile(
          title: const Text(Loem.loem),
          onTap: () {
            _scrollToWidget(widget1);
            Navigator.of(context).pop();
          },
        ),
        ListTile(
          title: const Text(Loem.loem),
          onTap: () {
            _scrollToWidget(widget2);
            Navigator.of(context).pop();
          },
        ),
        ListTile(
          title: const Text(Loem.loem),
          onTap: () {
            _scrollToWidget(widget3);
            Navigator.of(context).pop();
          },
        ),
        ListTile(
          title: const Text(Loem.loem),
          onTap: () {
            _scrollToWidget(widget4);
            Navigator.of(context).pop();
          },
        ),
        ListTile(
          title: const Text(Loem.loem),
          onTap: () {
            _scrollToWidget(widget4);
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
