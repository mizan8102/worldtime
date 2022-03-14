import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:world_time/services/world_time.dart';
class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key key}) : super(key: key);

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  int counter=0;

  List<WorldTime> locations=[
    WorldTime(url: 'Asia/Dhaka' , location: 'Dhaka',flag: 'bangladesh.png'),
    WorldTime(url: 'Europe/London' , location: 'London',flag: 'united-kingdom.png'),
    WorldTime(url: 'Europe/Berlin' , location: 'Berlin',flag: 'greece.png'),
    WorldTime(url: 'America/New_York' , location: 'New York',flag: 'united-states.png'),

  ];

  void updateTime(index) async{
    WorldTime instance=locations[index];
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home',arguments: {
      'location':instance.location,
      'flag':instance.flag,
      'time':instance.time,
      'isDayNight':instance.isDayNight,

    });
  }


  //simulator network network request for usner name
  // void getData() async{
  //
  //  Response response= await get('https://jsonplaceholder.typicode.com/todos/1');
  //  Map data=jsonDecode(response.body);
  //   print(data);
  //   print(data['title']);
  //   // String username=await Future.delayed(Duration(seconds: 3),(){
  //  //     return("Hello programmer");
  //  //  });
  //  //
  //  //
  //  //
  //  // String bio= await Future.delayed(Duration(seconds: 2),(){
  //  //    return("second developer");
  //  //  });
  //  // print('$username - $bio');
  // }




  @override
  void initState() {
    super.initState();
    // getTime();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0,horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: (){
                  updateTime(index);
                  print(locations[index].location);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('images/${locations[index].flag}'),
                ),
              ),
            ),
          );
        },
      )
    );
  }
}
