import 'package:flutter/material.dart';
import 'package:newa_paper_portal/SplashScreen.dart';
import 'package:newa_paper_portal/details.dart';
import 'package:newa_paper_portal/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home:SPLASHSCREEN(),
      initialRoute: HomePage.path,
      routes: {
        // Details.path : (context)=> Details(),
      },
    );
  }
}

