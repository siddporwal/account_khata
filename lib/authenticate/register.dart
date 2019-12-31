import 'package:account_khata/home/Home.dart';
import 'package:account_khata/authenticate/login.dart';
import 'package:account_khata/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import '../services/auth.dart';


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
    Constants.mContext=context;
    return /*loading ? Loading() :*/ Scaffold(
      appBar: AppBar(
          title: Text('Khata',
            style: TextStyle(
                color: Colors.blueGrey
            ),)
      ),
      body:SingleChildScrollView(
        child: Center(

          child: Form(
              key: _formkey,
              child:Padding(
                padding: const EdgeInsets.fromLTRB(30.0, 150.0, 30.0, 0.0),
                child: Column(
            children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Email',

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

                    RaisedButton(child: Text('SUBMIT'),
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
                        else{
                          setState(() {
                            Navigator.pushReplacement(Constants.mContext,MaterialPageRoute(builder:(context) =>Home()));

                          });
                        }
                      }
                      },
                      color:Colors.orange[600],

                    ),
                    SizedBox(height: 30.0,),
                    Text('Already Having an account?',
                    style: TextStyle(fontWeight: FontWeight.bold),),
                    SizedBox(height: 25.0,),
                    RaisedButton(child:Text('LOG IN'),
                        color: Colors.green[600],
                      onPressed: (){
                      setState(() {
                        Navigator.pushReplacement(Constants.mContext,MaterialPageRoute(builder:(context) =>login_page()));
                      });
                      },

                    ),
                    Text(error,
                    style:TextStyle(color: Colors.red,fontSize: 14.0)),

            ],
          ),
              )
        ),
      )
      )
    );
  }
}
