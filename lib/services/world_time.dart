import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
class WorldTime{
  String location;
  String time;
  String flag;
  String url;
  bool isDayNight;

  WorldTime({this.location,this.flag,this.url});

  Future<void> getTime() async{

    try{
      Response response=await get('http://worldtimeapi.org/api/timezone/$url') ;
      Map data=jsonDecode(response.body);

      String datetime=data['datetime'];
      String offset=data['utc_offset'].substring(1,3);

      //create date object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      //setup time format
      isDayNight= now.hour>6 && now.hour<20 ? true :false;
      time = DateFormat.jm().format(now);



    }catch(e){
      print('caught exception:$e');
       time='sorry!could not find time date';
    }



  }
}