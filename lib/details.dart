import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:newa_paper_portal/datahelper/function.dart';

class Details extends StatefulWidget {

  var showData;
  Details(this.showData);

  static const String path = "Details";

  @override
  State<Details> createState() => _DetailsState(this.showData);
}

class _DetailsState extends State<Details> {

var showData;
_DetailsState(this.showData);
  @override
  Widget build(BuildContext context) {



    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Text("News Details", style: TextStyle(color: Colors.black),),
      ),

      body: Column(
        children: [
          Image.network(showData["urlToImage"]),

          ListTile(
            title: Text(showData["title"]),

            subtitle: Text(showData["publishedAt"]),
          )
        ],
      )
    );
  }
}

   