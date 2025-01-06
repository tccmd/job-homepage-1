import 'package:job_homepage_1/fragments/widgets/pptx_open.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

class Notice extends StatelessWidget {
  Notice({Key? key, this.width}) : super(key: key);
  final GlobalKey widget1 = GlobalKey();
  final width;
  late String phone = '+820000000000'; // 전화번호 입력
  late Uri phoneUri = Uri.parse('tel:$phone');

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
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/phone_number_icon.svg',
                      semanticsLabel: 'phone_number',
                      height: 18,
                      width: 18,
                    ),
                    TextButton(
                      onPressed: () async {
                        final url = Uri.parse('tel:000 000 0000');
                        if (await canLaunchUrl(url)) {
                          launchUrl(url);
                        } else {
                          print("Can't launch $url");
                        }
                      },
                      child: Text(
                        '000. 000. 0000',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () async {
                    final url = Uri.parse('https://www.instagram.com/');
                    if (await canLaunchUrl(url)) {
                      launchUrl(url);
                    } else {
                      print("Can't launch $url");
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/instagram_icon.svg',
                          semanticsLabel: 'instagram',
                          height: 18,
                          width: 18,
                        ),
                        SizedBox(width: 8.0),
                        MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: Text(
                            'Instagram',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                PPTXViewerButton(pptxAssetPath: './pptx/pptx1208.pptx'),
              ],
            ),
            SizedBox(height: 15),
          ],
        ),
      ),
    );
  }


  Widget _buildWideContainers() {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/phone_number_icon.svg',
                    semanticsLabel: 'phone_number',
                    height: 18,
                    width: 18,
                  ),
                  TextButton(
                    onPressed: () async {
                      final url = Uri.parse('tel:000 000 0000');
                      if (await canLaunchUrl(url)) {
                        launchUrl(url);
                      } else {
                        print("Can't launch $url");
                      }
                    },
                    child: Text(
                      '000. 000. 0000',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () async {
                  final url = Uri.parse('https://www.instagram.com/');
                  if (await canLaunchUrl(url)) {
                    launchUrl(url);
                  } else {
                    print("Can't launch $url");
                  }
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/instagram_icon.svg',
                        semanticsLabel: 'instagram',
                        height: 18,
                        width: 18,
                      ),
                      SizedBox(width: 8.0),
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: Text(
                          'instagram',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              PPTXViewerButton(pptxAssetPath: './pptx/pptx1208.pptx'),
            ],
          ),
          SizedBox(height: 15),
        ],
      ),
    );
  }
}
