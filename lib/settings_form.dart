import 'package:account_khata/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'services/database.dart';

class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {

  final _formkey=GlobalKey<FormState>();
  String _currentFname;

  String _currentLname;

  String _currentMobile;
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return StreamBuilder<UserData>(
        stream: DatabaseService(uid:user.uid).userData,
        builder: (context, snapshot) {
          if(snapshot.hasData){
            UserData userData =snapshot.data;
            return Form(
              key: _formkey,
              child:Padding(padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 60.0),
                child: Column(
                  children: <Widget>[
                    TextFormField(
                        initialValue: userData.Firstname,
                        validator: (val) => val.isEmpty ? 'Please Enter Your First Name' : null,
                        onChanged: (val) {
                          setState(() {
                            _currentFname=val;
                          });
                        }
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                        initialValue:  userData.Lastname,
                        validator: (val) => val.isEmpty ? 'Please Enter Your Last Name' : null,
                        onChanged: (val) {
                          setState(() {
                            _currentLname=val;
                          });
                        }
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                        initialValue: userData.mobile,
                        keyboardType: TextInputType.phone,
                        validator: (val) {
                          if (val.length != 10)
                            return 'Mobile Number must be of 10 digit';
                          else
                            return null;
                        },
                        onChanged: (val) {
                          setState(() {
                            _currentMobile=val;
                          });
                        }
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    RaisedButton(
                      color: Colors.orange[800],
                      child: Text('Update',
                        style:TextStyle(color: Colors.white) ,),
                      onPressed: () async{
                        if(_formkey.currentState.validate()){
                          await DatabaseService(uid: user.uid).updateUserData(
                            _currentFname ?? userData.Firstname,
                            _currentLname ?? userData.Lastname,
                            _currentMobile ?? userData.mobile,
                          );
                        }
                      },
                    )
                  ],
                ),

              ),

            );
          }
          else{
            //child:Text('nodata');
          }


        }
    );
  }
}
