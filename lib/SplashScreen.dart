import 'dart:async';

import 'package:flutter/material.dart';
import 'package:newa_paper_portal/homepage.dart';
class SPLASHSCREEN extends StatefulWidget {
  const SPLASHSCREEN({Key? key}) : super(key: key);

  @override
  State<SPLASHSCREEN> createState() => _SPLASHSCREENState();
}

class _SPLASHSCREENState extends State<SPLASHSCREEN> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage())));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
    backgroundColor: Color(0xfdd3e8cc),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/paper.png",fit: BoxFit.fill,),
            SizedBox(height: 60,),
            Text("News Paper Portal",style: TextStyle(fontSize: 30,fontFamily: "RubikWetPaint",),)
          ],
        ),
      ),
    );
  }
}
