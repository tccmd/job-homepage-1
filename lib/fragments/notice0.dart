// import 'package:job_homepage_1/fragments/widgets/pptx_open.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:url_launcher/url_launcher_string.dart';
//
// class Notice extends StatefulWidget {
//   Notice({Key? key, this.width}) : super(key: key);
//   final width;
//   late String phone = '+820558523355'; // 전화번호 입력
//   late Uri phoneUri = Uri.parse('tel:$phone');
//
//   @override
//   State<Notice> createState() => _NoticeState();
// }
//
// class _NoticeState extends State<Notice> {
//   bool _isHovered = false;
//   bool _isHovered2 = false;
//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final isMobile = screenWidth < 600;
//
//     return SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       child: Container(
//         color: Colors.white,
//         child: Column(
//           children: [
//             SizedBox(height: 15),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 if (!isMobile) SizedBox(width: 70),
//                 Row(
//                   children: [
//                     SvgPicture.asset(
//                       'assets/icons/phone_number_icon.svg',
//                       semanticsLabel: 'phone_number',
//                       height: 18,
//                       width: 18,
//                     ),
//                     MouseRegion(
//                       onHover: (event) {
//                         setState(() {
//                           _isHovered = true;
//                         });
//                       },
//                       onExit: (event) {
//                         setState(() {
//                           _isHovered = false;
//                         });
//                       },
//                       child: TextButton(
//                         onPressed: () async {
//                           final url = Uri.parse('tel:051 852 3355');
//                           if (await canLaunchUrl(url)) {
//                             launchUrl(url);
//                           } else {
//                             print("Can't launch $url");
//                           }
//                         },
//                         child: Text(
//                           '051. 852. 3355',
//                           style: TextStyle(
//                             color: _isHovered ? Color(0xFFF67F00) : Colors.black,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 MouseRegion(
//                   onEnter: (_) {
//                     setState(() {
//                       _isHovered2 = true;
//                     });
//                   },
//                   onExit: (_) {
//                     setState(() {
//                       _isHovered2 = false;
//                     });
//                   },
//                   child: GestureDetector(
//                     onTap: () async {
//                       final url = Uri.parse('https://www.instagram.com/all_rounder_3dstudio/');
//                       if (await canLaunchUrl(url)) {
//                         launchUrl(url);
//                       } else {
//                         print("Can't launch $url");
//                       }
//                     },
//                     child: Container(
//                       padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
//                       child: Row(
//                         children: [
//                           SvgPicture.asset(
//                             'assets/icons/instagram_icon.svg',
//                             semanticsLabel: 'instagram',
//                             height: 18,
//                             width: 18,
//                           ),
//                           SizedBox(width: 8.0),
//                           Text(
//                             'all_rounder_3dstudio',
//                             style: TextStyle(
//                               color: _isHovered2 ? Color(0xFFF67F00) : Colors.black,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//                 PPTXViewerButton(pptxAssetPath: 'assets/pptx/allrounder_portfolio.pptx',),
//                 if (!isMobile) SizedBox(width: 70),
//               ],
//             ),
//             SizedBox(height: 15),
//           ],
//         ),
//       ),
//     );
//   }
// }
