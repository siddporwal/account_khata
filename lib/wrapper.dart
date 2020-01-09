import 'package:account_khata/shared/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'authenticate/login.dart';
import 'package:account_khata/home/Home.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  String loginStatus="FALSE";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _incrementCounter();
  }

  _incrementCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {

      loginStatus = prefs.getString(Constants.LOGIN_STATUS);
    });
  }

  Widget build(BuildContext context) {

    if (loginStatus=="TRUE"){
      return Home() ;
    } else {
      return login_page();
    }

    // return either the Home or Authenticate widget

  }
}
