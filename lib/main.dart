import 'package:account_khata/authenticate/setupaccount.dart';
import 'package:account_khata/data/add_customer.dart';
import 'package:account_khata/shared/splash.dart';
import 'package:account_khata/temp.dart';
import 'package:account_khata/wrapper.dart';
import 'package:flutter/material.dart';
void main() => runApp(MaterialApp(
  home: khata(),
));

class khata extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: Wrapper(),


    );
  }
}



