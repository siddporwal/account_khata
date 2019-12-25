import 'package:flutter/material.dart';
import 'userprofile.dart';

class ProfileTile extends StatelessWidget {
  final UserProfile userprofile;
  ProfileTile({this.userprofile});
@override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: CircleAvatar(
            radius:  25.0,
          ),
          title: Text('First Name',style: TextStyle(fontWeight: FontWeight.bold),),
          subtitle: Text(userprofile.mobile),
        ),
      ),
      
    );
  }
}
