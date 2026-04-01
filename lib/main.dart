import 'package:flutter/material.dart';
import 'package:lab3/pages/add_city.dart';
import 'package:lab3/pages/detail.dart';
import 'package:lab3/pages/home.dart';
import 'package:lab3/pages/my_location.dart';
import 'package:lab3/pages/news.dart';
import 'pages/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: SplashScreen());
  }
}
