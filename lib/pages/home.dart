import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data={};
  @override
  Widget build(BuildContext context) {

    //parse data get
    data=  ModalRoute.of(context).settings.arguments;

    String bgdata=data['isDayNight'] ? 'day.jpg' : 'night.png';
    print(bgdata);
    return Scaffold(
      body: SafeArea(
        child:Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/$bgdata'),
              fit: BoxFit.cover,
            )
          ),
            child:Padding(
                padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
                child:Column(
                  children: <Widget>[
                    FlatButton.icon(
                      onPressed: () async{
                       dynamic result = await Navigator.pushReplacementNamed(context, '/location');
                       setState(() {

                         data={
                           'location':result['location'],
                           'flag':result['flag'],
                           'time':result['time'],
                           'isDayNight':result['isDayNight'],
                         };

                       });
                      },
                      icon: Icon(Icons.edit_location,color: Colors.grey[200],),

                      label: Text('Edit Location',style: TextStyle(
                        color: Colors.grey[200],
                      ),),
                    ),
                    SizedBox(height: 20.0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(

                          data['location'],
                          style: TextStyle(
                              fontSize: 28.0,
                              color: Colors.grey[200],
                              letterSpacing: 2.0
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 20,),
                    Text(
                      data['time'],

                      style: TextStyle(
                        fontSize: 66.0,
                        color: Colors.grey[200],

                      ),
                    )
                  ],
                )

            )


        )

      )
    );
  }
}
