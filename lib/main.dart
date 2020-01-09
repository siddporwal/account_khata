import 'package:account_khata/wrapper.dart';
import 'package:flutter/material.dart';



void main() => runApp(MaterialApp(
  home: khata(),
));

class khata extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Wrapper(),

    );
  }
}



