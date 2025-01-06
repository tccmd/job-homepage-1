import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:job_homepage_1/fragments/webview_screen.dart';
import 'package:job_homepage_1/one_page_design.dart';
import 'firebase_options.dart';
import 'theme.dart';

Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Job Homepage 1',
      theme: theme(),
      home: OnePageDesign(),
      initialRoute: '/',
      routes: {
        '/companyname': (context) => WebviewScreen(),
      },
    );
  }
}