import 'dart:convert';
import 'dart:io';

import 'package:account_khata/authenticate/login.dart';
import 'package:account_khata/data/terms.dart';
import 'package:account_khata/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SetupAccount extends StatefulWidget {
  @override
  _SetupAccountState createState() => _SetupAccountState();
}

class _SetupAccountState extends State<SetupAccount> {
  final _formkey=GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    content();
  }

  String field1='Address';
  String field2='Postal code';
  String add='';
  String postal='';
  String businesscategory='';
  String bussinessname='';
  var colo;
  var colo1;
  bool button1=true;
  bool button2=false;


  void content(){
    setState(() {
      if(button1==true){
        colo= Colors.deepPurple;
        colo1= Colors.grey[300];
        field1='Address';
        field2='Postal code';


      }
      else if(button1==false){
        colo= Colors.grey[300];
        colo1=Colors.deepPurple;
        field1='Store/Business Name';
        field2='Business Category';

      }
    });

  }
  void data(){
    setState(() {
      if(button1==true){

      }
    });
  }
  String reply;
  Future<String> apiRequest(String url, Map jsonMap) async {
    try {


      HttpClient httpClient = new HttpClient();
      HttpClientRequest request = await httpClient.postUrl(Uri.parse(url));
      request.headers.set('content-type', 'application/json');
      request.add(utf8.encode(json.encode(jsonMap)));
      HttpClientResponse response = await request.close();
      // todo - you should check the response.statusCode
      var reply = await response.transform(utf8.decoder).join();
      httpClient.close();
      Map data = json.decode(reply);
      String status = data['status'].toString();

      print('RESPONCE_DATA : ' + status);



      /*if (status == "1") {
        Fluttertoast.showToast(
            msg: "Successfully Register",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIos: 1,
            backgroundColor: Colors.grey,
            textColor: Colors.white,
            fontSize: 16.0);
        Navigator.pushReplacement(  context,
            new MaterialPageRoute(builder: (BuildContext context) => login_page()));
        return reply;
      } else  {
        Fluttertoast.showToast(
            msg: "Try Again, Some Thing Went Wrong",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIos: 1,
            backgroundColor: Colors.grey,
            textColor: Colors.white,
            fontSize: 16.0);
      }*/
    } catch (e) {
      print(e);
      Fluttertoast.showToast(
          msg: e.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIos: 1,
          backgroundColor: Colors.grey,
          textColor: Colors.white,
          fontSize: 16.0);
      return reply;
    }
  }


  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: new Text(''),
        leading: IconButton(icon:Icon(Icons.arrow_back,color: Colors.blue[900],),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder:(context) =>login_page()));
            }
        ),
        elevation: 0.0,
        backgroundColor: Color(0xFFFFFFFF),
      ),
      body:SingleChildScrollView(

          child: Form(
            key: _formkey,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  Row(
                      children:<Widget>[
                        Text('Setup your account',style:TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold))
                        ,]
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                      children:<Widget>[
                        Text('Please provide us the following details to get started',style: TextStyle(
                          fontSize: 15.0,color: Colors.blueGrey[300],
                        ),),]),
                  SizedBox(height: 20,),
                  Row(
                      children:<Widget>[
                        Text('Select Type',
                            textAlign: TextAlign.start,style:TextStyle(
                                fontSize: 14.0,color: Colors.blueGrey[400])),]),
                  SizedBox(height: 10.0,),
                  Row(
                    children: <Widget>[
                      GestureDetector(
                        child:Container(
                          child: Text('Individual'),
                          padding: EdgeInsets.fromLTRB(10.0,5.0,10.0,5.0),
                          decoration:BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            color: colo,
                          ),
                        ),
                        onTap: (){
                          setState(() {
                            button1=true;
                            button2=false;
                            content();
                          });
                        },
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      GestureDetector(
                        child:Container(
                          child: Text('Business'),
                          padding: EdgeInsets.fromLTRB(10.0,5.0,10.0,5.0),
                          decoration:BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            color: colo1,
                          ),

                        ),
                        onTap: (){
                          setState(() {
                            button1=false;
                            button2=true;
                            content();
                          });
                        },
                      )
                    ],
                  ),
                  SizedBox(height: 10.0,),
                  Column(
                      children:<Widget>[
                 Row(
                      children:<Widget>[

                        Text(field1,style:TextStyle(fontSize: 14.0,color: Colors.blueGrey[400])),]),
                  TextFormField(
                      keyboardType:TextInputType.multiline,
                      onChanged: (val) {
                        setState(() {
                          if(button1==true){
                            add=val;
                          }else if(button1==false){
                            bussinessname=val;
                          }
                        });
                      }
                  ),
                  SizedBox(height: 10.0,),
                  Row(
                      children:<Widget>[
                        Text(field2,style:TextStyle(fontSize: 14.0,color: Colors.blueGrey[400])),]),
                  TextFormField(
                      onChanged: (val) {
                        setState(() {
                          if(button1==true){
                            postal=val;
                          }else if(button1==false){
                            businesscategory=val;
                          }
                        });

                      }
                  ),
                  SizedBox(height: 20.0,),
                  Row(
                    children: <Widget>[


                  Text('By signing up,you agree to our',style: TextStyle(color: Colors.grey),),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder:(context) =>Terms()));
                    },
                      child: Text(' terms & conditions',style: TextStyle(color: Colors.black),)
                  ),  ],
                  ),
                        new Container(
                            padding: const EdgeInsets.only(left: 20.0, top: 20.0),
                            child: new RaisedButton(
                              child: const Text('Submit',style:TextStyle(fontSize: 15.0)),
                              onPressed: (){
                                _formkey.currentState.save();
                               if(button1==true){
                                 Map map ={
                                   'type':'Individual',
                                   'add':add,
                                   'postal':postal,
                                 };
                                 apiRequest(Constants.BILL, map);

                               }else if(button1==false){
                                 Map map ={
                                   'type':'Individual',
                                   'store':bussinessname,
                                   'businesscategory':businesscategory,
                                 };
                                 apiRequest(Constants.BILL, map);
                               }

                              },
                              color: Colors.lightBlue[400],
                              shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(10.0),

                              ),

                            )
                        ),

                ],
              ),


                ]
                )  ),
          )));

  }

}
