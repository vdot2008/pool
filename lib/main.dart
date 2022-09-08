import 'dart:async';
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
