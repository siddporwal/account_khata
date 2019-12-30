import 'package:flutter/material.dart';
import 'userprofile.dart';
class ProfileTile extends StatefulWidget {
  final UserProfile userprofile;
  ProfileTile({this.userprofile});

  @override
  _ProfileTileState createState() => _ProfileTileState();
}

class _ProfileTileState extends State<ProfileTile> {


@override
  Widget build(BuildContext context) {



    return Padding(
        padding: EdgeInsets.only(top: 8.0),
        child: Card(
          margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
          child: Column(
            children: <Widget>[
              ListTile(
                title: Text('First Name',style: TextStyle(fontWeight: FontWeight.bold),),
                subtitle: Text(widget.userprofile.firstname),
              ),
              SizedBox(
                height: 20.0,
              ),
              ListTile(
                title: Text('Last Name',style:TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text(widget.userprofile.lastname),

              ),
              SizedBox(
                height: 20.0,
              ),
              ListTile(
                title:Text('Mobile No:',style:TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text(widget.userprofile.mobile),
              )
            ],
          ),
        ),

      );
    //);
  }
}
