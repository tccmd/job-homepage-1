import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:html' as html;
import 'dart:typed_data';

class PPTXViewerButton extends StatefulWidget {
  final String pptxAssetPath;

  const PPTXViewerButton({required this.pptxAssetPath});

  @override
  _PPTXViewerButtonState createState() => _PPTXViewerButtonState();
}

class _PPTXViewerButtonState extends State<PPTXViewerButton> {
  bool isHovered = false;

  void openPPTX() async {
    // Load pptx file from assets
    final bytes = await rootBundle.load(widget.pptxAssetPath);
    final Uint8List data = bytes.buffer.asUint8List();

    // Create object url from the pptx data with correct MIME type
    final blob = html.Blob([data], 'application/vnd.openxmlformats-officedocument.presentationml.presentation');

    // Prompt user to save the file with a custom name
    final anchorElement = html.AnchorElement(
      href: html.Url.createObjectUrlFromBlob(blob),
    );
    anchorElement.download = 'pptx1208.pptx'; // Custom filename

    // Programmatically click the anchor element to initiate the download
    anchorElement.click();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          isHovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          isHovered = false;
        });
      },
      child: GestureDetector(
        onTap: openPPTX,
        child: Container(
          decoration: BoxDecoration(
            color: isHovered ? Colors.orange : Color(0xFFF67F00), // 배경색
            borderRadius: BorderRadius.circular(15.0), // 모서리 둥글게
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 2),
            child: Text(
              'pptx douwnload',
              style: TextStyle(
                color: Colors.white,
                fontSize: 13.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
