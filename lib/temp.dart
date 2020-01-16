import 'package:flutter/material.dart';
class Temp extends StatefulWidget {
  @override
  _TempState createState() => _TempState();
}

class _TempState extends State<Temp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    content();
  }
  String msg='Individual';
  String field1='Address';
  String field2='Postal code';
  String add='';
  String postal='';
  String businesscategory='';
  String bussinessname='';
  var colo;
  var colo1;
  var form;
  bool button1=true;
  bool button2=false;

  void content(){
    setState(() {
      if(button1==true){
        colo= Colors.deepPurple;
        colo1= Colors.grey[300];
        msg='Individual';
        field1='Adrdress';
        field2='Postal code';


      }
      else if(button1==false){
        colo= Colors.grey[300];
        colo1=Colors.deepPurple;
        msg='Business';
        field1='Store/Business Name';
        field2='Business Category';

      }
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(height: 50,),
          Row(
            children: <Widget>[
              GestureDetector(
                child:Container(
                  child: Text('Individual'),
                  padding: EdgeInsets.all(20.0),
                  decoration:BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: colo,
                  ),

                ),
                onTap: (){
                  setState(() {
                    button1=true;
                    button2=false;

                  });

                },
              ),SizedBox(width: 20.0,),
              GestureDetector(
                child:Container(
                  child: Text('Business'),
                  padding: EdgeInsets.all(20.0),
                  decoration:BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: colo1,
                  ),

                ),
                onTap: (){
                  setState(() {
                    button1=false;
                    button2=true;
                  });
                },
              )
            ],
          )
          ,Text(msg),
          SizedBox(height: 10.0,),
      Column(
          children: <Widget>[
            Row(
                children:<Widget>[
                  Text(field1,style:TextStyle(fontSize: 14.0,color: Colors.blueGrey[400])),]),
            TextFormField(
                keyboardType:TextInputType.multiline,
                onChanged: (val) {
                  setState(() {
                    add=val;
                  });
                }
            ),
            Row(
                children:<Widget>[
                  Text(field2,style:TextStyle(fontSize: 14.0,color: Colors.blueGrey[400])),]),
            TextFormField(
                onChanged: (val) {
                  setState(() {
                    businesscategory=val;
                  });

                }
            ),

          ])
        ],
      ),
    );
  }
}
