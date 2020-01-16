import 'dart:convert';
import 'dart:io';

import 'package:account_khata/home/Home.dart';
import 'package:account_khata/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
class Add_Customer extends StatefulWidget {
  @override
  _Add_CustomerState createState() => _Add_CustomerState();
}

class _Add_CustomerState extends State<Add_Customer> {
  final _formkey=GlobalKey<FormState>();
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
  String Fname='';
  String Lname='';
  String mobile='';
  String add='';
  String balance='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: new Text(''),
        leading: IconButton(icon:Icon(Icons.arrow_back,color: Colors.blue[900],),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder:(context) =>Home()));
          }
        ),

        elevation: 0.0,
        backgroundColor: Color(0xFFFFFFFF),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
            Row(
            children:<Widget>[
                Text('Add new customer',style:TextStyle(fontSize: 18.0,))
              ,]
            ),
                SizedBox(
                  height: 10.0,
                ),
            Row(
              children:<Widget>[
                Text('Please provide us the following details to get started',style: TextStyle(
                  fontSize: 14.0,color: Colors.blueGrey[300],
                ),),]),
                SizedBox(height: 20,),
            Row(
              children:<Widget>[
                Text('First Name',style:TextStyle(fontSize: 14.0,color: Colors.blueGrey[400]))]),
                TextFormField(
                  keyboardType:TextInputType.text ,
                    onChanged: (val) {
                      setState(() {
                        Fname=val;
                      });
                    }
                ),
                SizedBox(
                  height: 15.0,
                ),
            Row(
              children:<Widget>[
                Text('Last Name',style:TextStyle(fontSize: 14.0,color: Colors.blueGrey[400]))]),
                TextFormField(
                  keyboardType:TextInputType.text ,
                    onChanged: (val) {
                      setState(() {
                        Lname=val;
                      });
                    }
                ),
                SizedBox(
                  height: 15.0,
                ),
            Row(
              children:<Widget>[
                Text('Mobile',style:TextStyle(fontSize: 14.0,color: Colors.blueGrey[400]))]),
                TextFormField(
                    keyboardType:TextInputType.phone ,
                    onChanged: (val) {
                      setState(() {
                        mobile=val;
                      });
                    }
                ),
                SizedBox(
                  height: 15.0,
                ),
            Row(
              children:<Widget>[
                Text('Address',style:TextStyle(fontSize: 14.0,color: Colors.blueGrey[400])),]),
                TextFormField(
                    keyboardType:TextInputType.multiline,
                    onChanged: (val) {
                      setState(() {
                        add=val;
                      });
                    }
                ),
                SizedBox(
                  height: 15.0,
                ),
                Row(
                  children:<Widget>[
                Text('Any Balance',style:TextStyle(fontSize: 14.0,color: Colors.blueGrey[400])),
                Text(' (Oodhaar)',style:TextStyle(fontSize: 14.0,color: Colors.amberAccent)),
                ]),
                TextFormField(
                    keyboardType:TextInputType.multiline,
                    onChanged: (val) {
                      setState(() {
                        balance=val;
                      });
                    }
                ),
                SizedBox(
                  height: 20.0,
                ),
                RaisedButton(child: Text('Add Customer',style: TextStyle(fontSize: 14.0,color: Colors.white,fontWeight: FontWeight.bold),),
                  onPressed: (){
                    _formkey.currentState.save();
                    Map map = {
                      "firstname": Fname,
                      "lastname": Lname,
                      "mobileno": mobile,
                      "address": add,
                      "balance": balance
                    };
                    apiRequest(Constants.BILL, map);
                  },
                    color: Colors.lightBlue[400]



                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
