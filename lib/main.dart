import 'package:flutter/material.dart';
import 'package:project/screens/home.dart';
import 'package:project/screens/landingpage.dart';
import 'package:project/screens/login_screen.dart';
import 'package:project/screens/editprofilepage.dart';
import 'package:project/screens/sign_up.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: LandingPage(),
    );
  }
}
