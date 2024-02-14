import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

class PdfViewPage extends StatefulWidget {
  final String url;
  final String title;

  const PdfViewPage({required this.url, required this.title});

  @override
  _PdfViewPageState createState() => _PdfViewPageState();
}

class _PdfViewPageState extends State<PdfViewPage> {
  String localPath = '';

  @override
  void initState() {
    super.initState();
    downloadAndLoadPdf();
  }

  Future<void> downloadAndLoadPdf() async {
    final tempDir = await getTemporaryDirectory();
    final response = await http.get(Uri.parse(widget.url));
    final File file = File('${tempDir.path}/${widget.title}.pdf');
    await file.writeAsBytes(response.bodyBytes);
    setState(() {
      localPath = file.path;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.purple,
                  Colors.deepPurple,
                ],
              ),
            ),
          ),
          title: Text(widget.title),
          centerTitle: true,
        ),
      ),
      body: localPath.isEmpty
          ? Center(child: CircularProgressIndicator())
          : PDFView(
              filePath: localPath,
              enableSwipe: true,
              swipeHorizontal: true,
              autoSpacing: false,
              pageFling: true,
            ),
    );
  }
}
