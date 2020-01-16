import 'package:account_khata/authenticate/login.dart';
import 'package:account_khata/authenticate/setupaccount.dart';
import 'package:account_khata/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'dart:convert';
import 'dart:io';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:ui';

class register_now extends StatefulWidget {
  @override
  _register_nowState createState() => _register_nowState();
}

class _register_nowState extends State<register_now> {
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



      if (status == "1") {
        Fluttertoast.showToast(
            msg: "Successfully Register",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIos: 1,
            backgroundColor: Colors.grey,
            textColor: Colors.white,
            fontSize: 16.0);
        Navigator.pushReplacement(  context,
            new MaterialPageRoute(builder: (BuildContext context) =>SetupAccount() ));
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
      }
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
  final _formkey=GlobalKey<FormState>();
  String Fname='';
  String Lname='';
  String mobile='';
  String email='';
  String password='';
  String conpassword='';
  String error='';
  @override
  Widget build(BuildContext context) {
    Constants.mContext=context;
    window.physicalSize;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(

          decoration: BoxDecoration(

            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              // Add one stop for each color. Stops should increase from 0 to 1
              stops: [0.2, 0.9],
              colors: [
                /*Color(0xff00b2bb),
                Color(0xff79d2a6),*/
                Colors.blue[600],
                Colors.blue[900],
              ],
              // stops: [0.0, 0.1],
            ),
          ),
          child: Form(
            key: _formkey,
            child:Padding(
              padding: EdgeInsets.fromLTRB(30.0,20.0,30.0,0.0),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Image.asset("signup.jpg",
                      height: 100,
                      width: 100,),
                  ),
                  Text('Signup',style: TextStyle(fontSize: 18.0 ),),

                  SizedBox(height: 10.0,),
                  Container(
                    decoration:BoxDecoration(
                        borderRadius: BorderRadius.circular(35.0),
                        color: Colors.white
                    ),
                    child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'First Name',
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),

                        ),
                        keyboardType:TextInputType.text ,

                      onSaved: (value) {
                        Fname= value;
                      },
                    ),
                  ),
                  SizedBox(height: 15,),
                  Container(
                    decoration:BoxDecoration(
                        borderRadius: BorderRadius.circular(35.0),
                        color: Colors.white


                    ),
                    child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Last Name',
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                        ),
                        keyboardType:TextInputType.text ,
                        /*onChanged: (val) {
                          setState(() {
                            Lname=val;
                          });
                        }*/
                      onSaved: (value1) {
                        Lname = value1;
                      },
                    ),
                  ),
                  SizedBox(height: 15,),
                  Container(
                    decoration:BoxDecoration(
                        borderRadius: BorderRadius.circular(35.0),
                        color: Colors.white
                    ),
                    child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Mobile',
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                        ),
                        keyboardType:TextInputType.phone ,
                        /*onChanged: (val) {
                          setState(() {
                            mobile=val;
                          });
                        }*/
                      onSaved: (value2) {
                        mobile = value2;
                      },
                    ),
                  ),
                  SizedBox(height: 15,),
                  Container(
                    decoration:BoxDecoration(
                        borderRadius: BorderRadius.circular(35.0),
                        color: Colors.white
                    ),
                    child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                        ),
                        validator: (val) => !EmailValidator.validate(val,true)? 'Not a valid email.': null,
                        keyboardType:TextInputType.emailAddress ,

                      onSaved: (value3) {
                        email = value3;
                      },
                    ),
                  ),
                  SizedBox(height: 15,),
                  Container(
                    decoration:BoxDecoration(
                        borderRadius: BorderRadius.circular(35.0),
                        color: Colors.white
                    ),
                    child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Password',
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                        ),
                        validator: (val) => val.length < 6 ? 'Enter a password 6+ chars long' : null,
                        obscureText: true,

                      onSaved: (value4) {
                        password = value4;
                      },
                    ),
                  ),
                  SizedBox(height: 15,),
                  Container(
                    decoration:BoxDecoration(
                        borderRadius: BorderRadius.circular(35.0),
                        color: Colors.white
                    ),
                    child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Confirm Password',
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                        ),
                        validator: (val) => val.length < 6 ? 'Enter a password 6+ chars long' : null,
                        obscureText: true,

                        onSaved: (value5) {
                      conpassword = value5;
                    },
                    ),
                  ),
                  SizedBox(height:10),
                  RaisedButton(child: Text('SignUp'),
                    color:Colors.orange,
                    onPressed: (){
                    if(password==conpassword){
                      if(_formkey.currentState.validate()){
                        _formkey.currentState.save();
                        Map map = {
                          "firstname": Fname,
                          "lastname": Lname,
                          "mobileno": mobile,
                          "email": email,
                          "password": password
                        };
                        apiRequest(Constants.SIGNUP_URL, map);
                      }
                    }
                    },
                  ),
                  Text(error,
                      style:TextStyle(color: Colors.red,fontSize: 14.0)),
                  SizedBox(height: 10.0,),
                  Row(
                    mainAxisAlignment:MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Already Having an account?",style: TextStyle(fontSize: 15,color: Colors.black,fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 10,),
                      GestureDetector(
                        child: Text('Login',style: TextStyle(fontSize: 15,fontWeight:FontWeight.bold,color: Colors.orange[800]),),
                        onTap: (){
                          Navigator.push(Constants.mContext,
                              MaterialPageRoute(builder:(context) =>login_page()));
                        },
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
