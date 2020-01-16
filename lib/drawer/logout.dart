import 'package:account_khata/authenticate/login.dart';
import 'package:account_khata/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Logout extends StatefulWidget {
  @override
  _LogoutState createState() => _LogoutState();
}

class _LogoutState extends State<Logout> {
  SharedPreferences prefs;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _signout();
  }

  _signout() async{
    prefs = await SharedPreferences.getInstance();

    setState(() {

      prefs.setString(Constants.LOGIN_STATUS,"FALSE");
    });
    /*Navigator.pop(
        context,
        new MaterialPageRoute(
            builder: (BuildContext context) => login_page()));*/
    Navigator.of(context).pushReplacement(
      // the new route
      MaterialPageRoute(
        builder: (BuildContext context) => login_page(),
      ),
    );
  }


@override
  Widget build(BuildContext context) {
    return Container(
      child: new Text("Logout"),
    );
  }
}
