import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'userprofile.dart';
import 'package:provider/provider.dart';
import 'shared/constants.dart';
import 'profile_tile.dart';

class Profile_details extends StatefulWidget {
  @override
  _Profile_detailsState createState() => _Profile_detailsState();
}

class _Profile_detailsState extends State<Profile_details> {
  @override
  Widget build(BuildContext context) {
    Constants.mContext=context;
    final profile= Provider.of<List<UserProfile>>(Constants.mContext);

    return Expanded(

        child: ListView.builder(
      itemCount: profile.length,
        itemBuilder: (BuildContext context,int index){
        return ProfileTile(userprofile:profile[index]);
    }
    ),
   // ),
    );
  }
}
