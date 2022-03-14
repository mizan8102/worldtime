import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class Loading extends StatefulWidget {
  const Loading({Key key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {


  void setupWorldTime() async{
    WorldTime instance=WorldTime(url: 'Asia/Dhaka' , location: 'Dhaka',flag: 'bangladesh.png');

    await instance.getTime();
    // setState(() {
    //   time=instance.time;
    // });
    //data parsre
    Navigator.pushReplacementNamed(context, '/home',arguments: {
      'location':instance.location,
      'flag':instance.flag,
      'time':instance.time,
      'isDayNight':instance.isDayNight,

    });

    // print(instance.time);
  }


  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(50.0),
          child: Center(
              child:SpinKitWave(
                  color: Colors.white,
              size: 40.0),
          )
        ),
      ),
    );
  }
}
