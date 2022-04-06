
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

 class Functions{

  static String getDateTime(String publicDataTime){

    DateTime parsedata = DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'").parse(publicDataTime);
    var inputDate = DateTime.parse(parsedata.toString());
    var outputFormat = DateFormat('dd/MM/yyyy hh:mm:ss a');
    var outputDate = outputFormat.format(inputDate);
    return outputDate;
  }



static Future launcherUrl(url)async{
  if(await canLaunch(url)){
    return launch(url);
  }
  else{
     throw "Could not Launch$url";
  }
}




static String getAuthor(allNewsData){
  if(allNewsData['author']!=null){
    return allNewsData['author'];
  }else{
    return allNewsData["source"]["name"];
  }
}





static String getImage(getImage){
  if(getImage != null){
    return getImage;
  }else {
    return "image not found";
  }
}
}