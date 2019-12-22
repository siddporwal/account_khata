import 'user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'authenticate/login.dart';
import 'package:account_khata/Home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    if (user == null){
      return login_page() ;
    } else {
      return Home();
    }

    // return either the Home or Authenticate widget

  }
}
