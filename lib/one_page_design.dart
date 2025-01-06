import 'package:job_homepage_1/fragments/widgets/drawer.dart';
import 'package:job_homepage_1/fragments/widgets/video.dart';
import 'package:job_homepage_1/fragments/widgets/video_thumbnail.dart';
import 'package:flutter/material.dart';
import 'fragments/description1.dart';
import 'fragments/notice.dart';
import 'fragments/description2.dart';
import 'fragments/description3.dart';
import 'fragments/description4.dart';
import 'fragments/description5.dart';
import 'fragments/description6.dart';
import 'fragments/description7.dart';
import 'fragments/description8.dart';
import 'fragments/footer.dart';
import 'fragments/header.dart';
import 'fragments/widgets/contact_us_table.dart';
import 'fragments/widgets/equipment.dart';


class OnePageDesign extends StatefulWidget {
  const OnePageDesign({super.key});

  @override
  State<OnePageDesign> createState() => _OnePageDesignState();
}

class _OnePageDesignState extends State<OnePageDesign> {

  final GlobalKey widget1 = GlobalKey();
  final GlobalKey widget2 = GlobalKey();
  final GlobalKey widget3 = GlobalKey();
  final GlobalKey widget4 = GlobalKey();
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: width > 700
          ? null
          : AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        // backgroundColor: Colors.white,
        title: const Text(
          'COMPANYNAME',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
            letterSpacing: 1.2,
            fontFamily: 'Roboto',
          ),
          textAlign: TextAlign.left,
        ),
      ),
      endDrawer: width > 700
          ? null
          : Drawer(
          child: DrawerListView(
            widget1: widget1,
            widget2: widget2,
            widget3: widget3,
            widget4: widget4,
            scrollController: _scrollController,
          )),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            if (width > 700)
              Header(
                  widget1: widget1,
                  widget2: widget2,
                  widget3: widget3,
                  widget4: widget4,
                  scrollController: _scrollController),
            ThumbnailVideoPlayerWidget(videoPath: 'assets/video/video1.mp4', thumbnailPath: 'assets/thumbnail/tumbnail1.jpg'),
            Container(width: width, alignment: Alignment.center, color: Colors.white, child: Notice(width: width)),
            Padding(
              padding: (width > 700) ? EdgeInsets.symmetric(horizontal: width/20) : EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  Description1(
                    width: width,
                  ), // All ROUNDER
                  Description2(key: widget1, width: width), // Identity
                  Description3(width: width), // video2
                  Description4(width: width), // videos
                  Description5(width: width), // main titles
                  Description6(width: width), // 텍스트
                  Description7(key: widget2, width: width), // 사업소개
                  Description8(key: widget3, width: width), // 촬영장비
                  GridViewBuilderEquipments(),
                      ContactUs(key: widget4,
                          width: width),
                ],
              ),
            ),
            Footer(
                width: width, scrollController: _scrollController
            )
          ],
        ),
      ),
    );
  }
}