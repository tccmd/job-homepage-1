import 'package:flutter/material.dart';
import 'package:job_homepage_1/loem.dart';

class Description1 extends StatelessWidget {
  Description1({Key? key, this.width}) : super(key: key);
  final width;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: width > 700 ? width/9 : 80),
        Text('COMPANYNAME', style: TextStyle(fontSize: width > 700 ? width/14 : 50,
            fontWeight: FontWeight.w900)),
        //TextStyle(fontSize: 60, fontWeight: ),),
        SizedBox(height: width > 700 ? width/100 : 5),
        Text(Loem.loem,
            style: TextStyle(fontSize: width > 700 ? width/35 : 26, fontWeight: FontWeight.w600)),
        SizedBox(height: width > 700 ? width/30 : 40),
        Text(Loem.title,
            style: TextStyle(fontSize: width > 700 ? width/55 : 22, fontWeight: FontWeight.w800)),
        SizedBox(height: width/200),
        Text(Loem.title,
            style: TextStyle(fontSize: width > 700 ? width/55 : 20, color: Colors.black54)),
        SizedBox(height: width/15),
      ],
    );
  }
}
