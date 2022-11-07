import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:the_admission_guide/home_page.dart';

import 'Pages/collagelist_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'The Admission Guide',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home_page(),
      // routes: {
      //   '/': (context) => const Home_page(),
      //   // When navigating to the "/second" route, build the SecondScreen widget.
      //   '/CollagelistPage': (context) => const Collagelist_Page(),
      // },
    );
  }
}
