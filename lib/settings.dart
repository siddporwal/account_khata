import 'package:flutter/material.dart';
import 'profile_details.dart';
import 'package:provider/provider.dart';
import 'userprofile.dart';
import 'services/database.dart';
class AccSettings extends StatefulWidget {
  @override
  _AccSettingsState createState() => _AccSettingsState();
}

class _AccSettingsState extends State<AccSettings> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<UserProfile>>.value(
        value:DatabaseService().profile,
      child:Scaffold(
        appBar: AppBar(),
        body: Column(
          children: <Widget>[
            Profile_details(),
          ],
        ),
      )
    );
  }
}
