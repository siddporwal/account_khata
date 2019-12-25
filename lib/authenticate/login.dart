import 'package:account_khata/services/auth.dart';
import 'package:account_khata/shared/constants.dart';
import 'package:flutter/material.dart';
import 'register.dart';
import 'package:email_validator/email_validator.dart';
//import '../shared/loading.dart';
class login_page extends StatefulWidget {
  @override
  _login_pageState createState() => _login_pageState();
}

class _login_pageState extends State<login_page> {
  final AuthService _auth = AuthService();
  final _formkey=GlobalKey<FormState>();
  String error='';
  String email='';
  String password='';
  //bool loading=false;
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
      body: SingleChildScrollView(
        child: Center(
            child: Container(
              color:Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Form(
                  key: _formkey,
                  child: Column(
                    crossAxisAlignment:CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 30,
                      ),
                      Text('Login',
                          style:TextStyle(
                              color: Colors.green[200],
                              fontSize: 30,
                              fontWeight: FontWeight.bold
                          )),
                      SizedBox(height: 20,),
                      //Email field
                      TextFormField(
                        validator: (val) => !EmailValidator.validate(val,true)? 'Not a valid email.': null,
                        onChanged: (val) {
                          setState(() {
                            email=val;
                          });
                        },
                        obscureText: false,
                        style:TextStyle(
                          fontSize: 20,
                        ),
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(25,15, 25, 15),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                            hintText: 'Email'
                        ),
                      ),
                      SizedBox(height: 15,),
                      //Password Field
                      TextFormField(
                          validator: (val) => val.length < 6 ? 'Enter a password 6+ chars long' : null,
                        onChanged: (val){
                          setState(() {
                            password=val;
                          });
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
                      SizedBox(height: 0.0,),
                      Row(
                        children: <Widget>[
                          SizedBox(width: 30,),
                          //LoginButton
                          Container(
                              child:RaisedButton(child: Text('Login'),
                                onPressed: () async {
                                  if(_formkey.currentState.validate()){
  //                                  setState(() => loading= true);
                                    dynamic result =await _auth.signIn(email, password);
                                     if(result==null){
                                      setState(() { error ='Wrong Credentials';
    //                                  loading=false;
                                      });
                                    }
                                  }

                                },)
                          ),
                        SizedBox(width:20,),
                          //RegisterButton
                          Container(
                            child: RaisedButton(child:Text('Register Now'),
                              onPressed: (){
                                Navigator.push(Constants.mContext,
                                    MaterialPageRoute(builder:(context) =>register_now()));

                              },),

                          ),

                        ],
                      ),
                      SizedBox(height: 15.0,),
                      Text(error,
                      style: TextStyle(color:Colors.red,
                      fontSize: 15.0
                      ),)
                    ],
                  ),
                ),
              ),
            ),
          ),
      ),
    );
  }
}


