import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:newa_paper_portal/datahelper/function.dart';
import 'package:newa_paper_portal/details.dart';

class HomePage extends StatefulWidget {
 static const String path = "HomePage";

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List allNewsData = [];

  final String Url = "https://newsapi.org/v2/everything?domains=wsj.com&apiKey=04d20ddc6494478fb72d27ac58b2322a";

  Future getAllNews()async{
    final response = await http.get(Uri.parse(Url));
    Map _allNewsData= {};
    if(response.statusCode == 200){
      setState(() {
        _allNewsData = jsonDecode(response.body);
        allNewsData = _allNewsData['articles'];
      });
    }
  }


 @override
  void initState() {
    getAllNews();
    super.initState();
  }
  bool isLoaded = false;

  @override
  void setState(VoidCallback fn) {
    isLoaded = true;
    super.setState(fn);
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("News Portal"),centerTitle: true,),
      body: Visibility(
        visible: isLoaded,
        child: ListView.separated(
            shrinkWrap: true,
            separatorBuilder:  (BuildContext context, int index){
              return Divider(
                thickness: 10,
                color: Color(0xffD3DEEA),
                height: 0,
              );
            },
            itemCount: allNewsData.length,
            itemBuilder: (BuildContext context, int index){
              return SizedBox(
                height: 150,
                child: ListTile(
                  onTap: (){
                    setState(() {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Details(allNewsData[index])));

                    });
                     Navigator.pushNamed(context, Details.path, arguments: allNewsData[index]);
                    // Navigator.pushNamed(context, Details.path, arguments: allNewsData[index]);
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                  ),
                  isThreeLine: true,
                  title: Text(allNewsData[index]['title']),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(Functions.getAuthor(allNewsData[index])),
                      Text(Functions.getDateTime(allNewsData[index]["publishedAt"])),
                    ],
                  ),

                  trailing: allNewsData[index]["urlToImage"] != null
                      ? Container(
                    child: Hero(
                      tag: "${allNewsData[index]['title']}",
                      child: Image.network(
                        Functions.getImage(allNewsData[index]["urlToImage"]),
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                      : Container(
                    width: 100,
                    height: 100,
                    color: Colors.grey,
                  ),
                ),
              );
            }
        ),
        replacement: Center(child: CircularProgressIndicator(),),
      ),
    );
  }
}

