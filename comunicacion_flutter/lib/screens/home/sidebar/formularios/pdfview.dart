import 'package:flutter/material.dart';
class PdfView extends StatelessWidget {
  final String path;

  
  
  PdfView({this.path});
  @override
  Widget build(BuildContext context) {
    return PDFViewerScaffold(
      path:path ,
    );
  }
}