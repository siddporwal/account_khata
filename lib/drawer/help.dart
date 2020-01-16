import 'package:flutter/material.dart';
class Help extends StatefulWidget {
  @override
  _HelpState createState() => _HelpState();
}

class _HelpState extends State<Help> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Center(
             child: Text('Oodhaari',style: TextStyle(fontSize: 50.0,fontWeight: FontWeight.bold),),
          ),
          SizedBox(height: 15.0,),
          Row(
            children: <Widget>[
          Icon(Icons.location_on,color: Colors.lightBlueAccent,size:30.0),
          SizedBox(width: 5.0,),
          Text('In Front of,C21 Mall,106,\nSatguru Parinay,ABRoad,\nScheme 54 PU4,\nIndore,Madhya Pradesh 452010',style: TextStyle(fontSize: 20.0),),
          ]),
          SizedBox(height: 10.0,),
          Row(
            children: <Widget>[
          Icon(Icons.call,size: 30.0,color: Colors.lightBlueAccent,),
          SizedBox(width: 8.0,),
          Text('07314961671',style: TextStyle(fontSize: 20.0),)
          ])
        ],
      ),
    );
  }
}
