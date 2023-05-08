import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider/all_list.dart';
import 'screens/landingpage.dart';
// import 'screens/home.dart';
// import 'screens/login_screen.dart';
// import 'screens/editprofilepage.dart';
// import 'screens/sign_up.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AllList(),
      child: MaterialApp(
        title: 'Flutter Login UI',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(),
        home: LandingPage(),
      ),
    );
  }
}
