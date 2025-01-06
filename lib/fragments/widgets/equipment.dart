import 'package:flutter/material.dart';

class GridViewBuilderEquipments extends StatelessWidget {
  const GridViewBuilderEquipments({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    int crossAxisCount = width > 700 ? 4 : 2; // 반응형으로 한 행에 보여질 아이템 개수 조정

    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 0, width/8),
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: 4, // 전체 아이템 개수
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          mainAxisSpacing: width/40, // 아이템 간의 세로 간격 설정
          crossAxisSpacing: width/40, // 아이템 간의 가로 간격 설정
        ),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            decoration: BoxDecoration(
              color: const Color(0xffffffff),
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: const Color(0x29000000),
                  offset: Offset(0, 8),
                  blurRadius: 16,
                  spreadRadius: 0,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Container(
                width: 160.0,
                height: 160.0,
                child: Image.asset(
                  'assets/images/equipment$index.png',
                  fit: index == 0 ? BoxFit.contain : BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
