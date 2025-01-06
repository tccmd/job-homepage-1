import 'package:flutter/material.dart';

class Footer extends StatefulWidget {
  const Footer({Key? key, this.width, required this.scrollController}) : super(key: key);
  final width;
  final ScrollController scrollController;

  @override
  _FooterState createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  bool showScrollButton = false;

  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_scrollListener);
    super.dispose();
  }

  void _scrollListener() {
    setState(() {
      showScrollButton =
          widget.scrollController.position.pixels >=
              widget.scrollController.position.maxScrollExtent;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (widget.width > 1200) {
          return _buildWideContainers();
        } else {
          return _buildNormalContainer();
        }
      },
    );
  }

  Widget _buildNormalContainer() {
    return Stack(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
            color: Color(0xFFEAEAEA),
            height: 120,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    SizedBox(width: 20),
                    Text('COMPANYNAME'),
                    SizedBox(width: 20),
                    Text('COMPANYADDRESS'),
                    SizedBox(width: 20),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    SizedBox(width: 20),
                    Text('DELEGATE : NAME'),
                    SizedBox(width: 20),
                    Text('NUMBER : 000-00-00000'),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    SizedBox(width: 20),
                    Text('NUMBER : 000-000-0000'),
                  ],
                ),
              ],
            ),
          ),
        ),
        if (showScrollButton)
          Positioned(
            bottom: 20,
            right: 20,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: IconButton(
                icon: Icon(Icons.arrow_upward),
                onPressed: () {
                  widget.scrollController.animateTo(
                    0,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                },
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildWideContainers() {
    return Stack(
      children: [
        Container(
          color: Color(0xFFEAEAEA),
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(width: widget.width/20),
              Text('COMPANYNAME'),
              Text('COMPANYADDRESS'),
              Text('DELEGATE : NAME'),
              Text('NUMBER : 000-00-00000'),
              Text('NUMBER : 000-000-0000'),
              SizedBox(width: widget.width/20),
            ],
          ),
        ),
        if (showScrollButton)
          Positioned(
            top: 25,
            right: 20,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: IconButton(
                icon: Icon(Icons.arrow_upward),
                onPressed: () {
                  widget.scrollController.animateTo(
                    widget.scrollController.position.minScrollExtent,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.fastOutSlowIn,
                  );
                },
              ),
            ),
          ),
      ],
    );
  }
}
