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
    _incrementCounter();
  }

  _signout() {
    setState(() {

      prefs.setString(Constants.LOGIN_STATUS,"FALSE");
    });
    Navigator.pop(
        context,
        new MaterialPageRoute(
            builder: (BuildContext context) => login_page()));
  }
  _incrementCounter() async {
    prefs = await SharedPreferences.getInstance();
  }

@override
  Widget build(BuildContext context) {
    return Container(
      child: _signout(),
    );
  }
}
