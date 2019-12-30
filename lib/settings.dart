import 'package:account_khata/settings_form.dart';
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
    void _showsettingsPanel(){
      showModalBottomSheet(context: context, builder: (context){
        return Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
          child: SettingsForm(),
        );
      });
    }

    return StreamProvider<List<UserProfile>>.value(
        value:DatabaseService().profile,
      child:Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.edit),
              label: Text('edit'),
              onPressed: (){
                _showsettingsPanel();

              },
            )
          ],
        ),
        body: Column(
          children: <Widget>[
            Profile_details(),
          ],
        ),
      )
    );
  }
}
