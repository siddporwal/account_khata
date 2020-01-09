import 'dart:convert';
import 'dart:io';
import 'package:account_khata/home/Home.dart';
import 'package:account_khata/shared/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'register.dart';
import 'package:email_validator/email_validator.dart';
class login_page extends StatefulWidget {
  @override
  _login_pageState createState() => _login_pageState();
}

class _login_pageState extends State<login_page> {
  int id;
  final _formkey=GlobalKey<FormState>();
  String reply="";
  String error='';
  String email='';
  String password='';
  Future<String> apiRequest(String url, Map jsonMap) async {
    try {

      SharedPreferences prefs = await SharedPreferences.getInstance();
      // var isConnect = await ConnectionDetector.isConnected();
      // if (isConnect) {
      HttpClient httpClient = new HttpClient();
      HttpClientRequest request = await httpClient.postUrl(Uri.parse(url));
      request.headers.set('content-type', 'application/json');
      request.add(utf8.encode(json.encode(jsonMap)));
      HttpClientResponse response = await request.close();
      // todo - you should check the response.statusCode
      reply = await response.transform(utf8.decoder).join();
      httpClient.close();
      Map data = json.decode(reply);
      String status = data['status'].toString();
      for(var d in data['result']){
        print(" ${d}");
        setState(() {
          id=d['id'];

        });
      }

      print('RESPONCE_DATA : ' + status);


      if (status == "1") {
        prefs.setString(Constants.LOGIN_STATUS, "TRUE");
        prefs.setString(Constants.USER_ID, id.toString());
        Navigator.pushReplacement(
            context,
            new MaterialPageRoute(
                builder: (BuildContext context) => Home()));

        Fluttertoast.showToast(
            msg: "Login Succesful",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIos: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
      }else if(status == "incorrect_password"){
        Fluttertoast.showToast(
            msg: "Username and password is wrong",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIos: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
      } else {
        Fluttertoast.showToast(
            msg: "Try Again Some Thing Is Wrong",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIos: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
      }

    }
    catch (e) {

      print(e);
      Fluttertoast.showToast(
          msg: e.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIos: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
      return reply;
    }
  }
  @override
  Widget build(BuildContext context) {
    Constants.mContext=context;
    return  Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(

            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              // Add one stop for each color. Stops should increase from 0 to 1
              stops: [0.2, 0.7],
              colors: [
                Color(0xff00b2bb),
                Color(0xff79d2a6),
                //Colors.blue[400],
                //Colors.blue[300],
              ],
              // stops: [0.0, 0.1],
            ),
          ),
          child: Form(
            key: _formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              //mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Image.asset("logo.png",
                    height: 300,
                    width: 300,),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                    child: Column(
                      //crossAxisAlignment:CrossAxisAlignment.center,
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          decoration:BoxDecoration(
                              borderRadius: BorderRadius.circular(35.0),
                              color: Colors.white


                          ),
                          child: TextFormField(

                            validator: (val) => !EmailValidator.validate(val,true)? 'Not a valid email.': null,
                            /*onChanged: (val) {
                              setState(() {
                                email=val;
                              });
                            },*/
                            onSaved: (value) {
                              email = value;
                            },
                            obscureText: false,
                            style:TextStyle(
                              fontSize: 20,
                            ),
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.fromLTRB(25,10, 25, 15),
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                                hintText: 'Email'
                            ),
                          ),
                        ),
                        SizedBox(height: 15,),
                        //Password Field
                        Container(
                          decoration:BoxDecoration(
                              borderRadius: BorderRadius.circular(35.0),
                              color: Colors.white

                          ),
                          child: TextFormField(
                              validator: (val) => val.length < 6 ? 'Enter a password 6+ chars long' : null,
                              /*onChanged: (val){
                                setState(() {
                                  password=val;
                                });
                              },*/
                              onSaved: (value1) {
                                password = value1;
                              },
                              obscureText: true,
                              style: TextStyle(
                                fontSize: 20,
                              ),
                              decoration:InputDecoration(
                                  contentPadding:EdgeInsets.fromLTRB(25, 15, 25, 15),
                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                                  hintText: 'Password'
                              )
                          ),
                        ),

                      ],
                    ),
                    // ),
                  ),
                  // ),
                ),
                RaisedButton(
                  color:Colors.orange,
                  child: Text("Login"),
                  //textColor: Colors.amber[800]  ,
                  onPressed: ()async {
                    if(_formkey.currentState.validate()){
                      _formkey.currentState.save();
                      Map map = {"email": email,
                        "password":password};
                      apiRequest(Constants.LOGIN_URL, map);
                      /*if(result==null){
                        setState(() { error ='Wrong Credentials';
                        });
                      }*/
                    }

                  },
                ),
                SizedBox(height: 10,),
                /*Text(error,
                  style: TextStyle(color:Colors.red,
                      fontSize: 15.0
                  ),),*/
                SizedBox(height: 100,),
                GestureDetector(
                  child: Text('Forgot Password',style: TextStyle(fontSize: 15,fontWeight:FontWeight.bold,color: Colors.orange[800]),),
                  onTap: (){
                    Navigator.pop(Constants.mContext,
                        MaterialPageRoute(builder:(context) =>register_now()));
                  },
                ),
                Row(
                  mainAxisAlignment:MainAxisAlignment.center,
                  children: <Widget>[

                    Text(
                      "Don't have an account ?",style: TextStyle(fontSize: 15,color: Colors.black,fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 10,),
                    GestureDetector(
                      child: Text('Register',style: TextStyle(fontSize: 15,fontWeight:FontWeight.bold,color: Colors.orange[800]),),
                      onTap: (){
                        Navigator.pop(Constants.mContext,
                            MaterialPageRoute(builder:(context) =>register_now()));
                      },
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}


