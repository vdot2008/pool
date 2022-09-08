import 'dart:async';
import 'dart:typed_data';
import 'package:pool/widgets/splash_screen.dart';
import 'package:pool/widgets/webview_screen.dart';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    // ignore: dead_code
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        // title: 'Welcome to Flutter',
        home: const SplashScreen(),
        routes: {
          'webview': (BuildContext context) => const WebviewScreen(),
        });
  }
}

late final String title;
Widget build(BuildContext context) {
  return MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: Text(title)),
      body: PdfPreview(
        build: (format) => _generatePdf(format, title),
      ),
    ),
  );
}

Future<Uint8List> _generatePdf(PdfPageFormat format, String title) async {
  final pdf = pw.Document(version: PdfVersion.pdf_1_5, compress: true);
  final font = await PdfGoogleFonts.nunitoExtraLight();

  pdf.addPage(
    pw.Page(
      pageFormat: format,
      build: (context) {
        return pw.Column(
          children: [
            pw.SizedBox(
              width: double.infinity,
              child: pw.FittedBox(
                child: pw.Text(title, style: pw.TextStyle(font: font)),
              ),
            ),
            pw.SizedBox(height: 20),
            pw.Flexible(child: pw.FlutterLogo())
          ],
        );
      },
    ),
  );

  return pdf.save();
}
