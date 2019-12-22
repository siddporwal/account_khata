
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import '../services/auth.dart';
import '../shared/loading.dart';


class register_now extends StatefulWidget {
  @override
  _register_nowState createState() => _register_nowState();
}

class _register_nowState extends State<register_now> {
  final _formkey=GlobalKey<FormState>();
  final AuthService _auth = AuthService();
  String email='';
  String password='';
  String error='';
  bool loading=false;
  @override
  Widget build(BuildContext context) {
    return /*loading ? Loading() :*/ Scaffold(
      appBar: AppBar(
          title: Text('Khata',
            style: TextStyle(
                color: Colors.blueGrey
            ),)
      ),
      body:SingleChildScrollView(
        child: Container(

          child: Form(
              key: _formkey,
              child:Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Email'
                ),
                validator: (val) => !EmailValidator.validate(val,true)? 'Not a valid email.': null,
                onChanged: (val) {
                  setState(() {
                    email=val;
                  });
                }
              ),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
                validator: (val) => val.length < 6 ? 'Enter a password 6+ chars long' : null,
                onChanged: (val) {
                  setState(() {
                    password=val;
                  });
                },

              ),
              Row(
                children: <Widget>[
                  RaisedButton(child: Text('Reset'),
                  onPressed: (){},),
                  RaisedButton(child: Text('Submit'),
                    onPressed: ()async{
                    if(_formkey.currentState.validate()){
                     // setState(()=> loading=true);
                      dynamic result =await _auth.register(email, password);
                      if (result ==null){
                        setState(() {
                       //   loading =false;
                          error="Enter a valid email";
                        });
                      }
                    }
                    },

                  ),
                  Text(error,
                  style:TextStyle(color: Colors.red,fontSize: 14.0)),
                ],
              )
            ],
          )
        ),
      )
      )
    );
  }
}