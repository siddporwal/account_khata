import 'package:account_khata/drawer/help.dart';
import 'package:account_khata/drawer/logout.dart';
import 'package:account_khata/drawer/orderlist.dart';
import 'package:account_khata/drawer/paymentlist.dart';
import 'package:account_khata/drawer/settings.dart';
import 'package:account_khata/drawer/storelist.dart';
import 'package:account_khata/home/mainhome.dart';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../shared/constants.dart';
class DrawerItem {
  String title;
  DrawerItem(this.title);
}

class Home extends StatefulWidget {
  final drawerItems = [
    new DrawerItem("Home"),
    new DrawerItem("My stores"),
    new DrawerItem("My orders"),
    new DrawerItem("My Payments"),
    new DrawerItem("Settings"),
    new DrawerItem('24x7 Help'),
    new DrawerItem('Logout')
  ];
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedDrawerIndex = 0;
  SharedPreferences prefs;
  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return new MainHome();
      case 1:
        return new Stores();
      case 2:
        return new Orders();
      case 3:
        return new Payments();
      case 4:
        return new Settings();
      case 5:
        return new Help();
      case 6:
        return new Logout();

      default:
        return new Text("Error");
    }
  }
  _onSelectItem(int index) {
    setState(() => _selectedDrawerIndex = index);
    Navigator.of(context).pop(); // close the drawer
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _incrementCounter();
  }
  _incrementCounter() async {
    prefs = await SharedPreferences.getInstance();
  }

  Widget build(BuildContext context) {
    Constants.mContext=context;
    var drawerOptions = <Widget>[];
    for (var i = 0; i < widget.drawerItems.length; i++) {
      var d = widget.drawerItems[i];
      drawerOptions.add(
          new ListTile(
            title: new Text(d.title),
            selected: i == _selectedDrawerIndex,
            onTap: () => _onSelectItem(i),
          )
      );
    }
    return Scaffold(

      backgroundColor: Colors.white,
    appBar: AppBar(
      title: new Text(widget.drawerItems[_selectedDrawerIndex].title),
      elevation: 0.0,
        backgroundColor: Colors.cyan[300],
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            // Add one stop for each color. Stops should increase from 0 to 1
            stops: [0.2, 0.7],
            colors: [
              Color(0xff00b2bb),
              Color(0xff79d2a6),
              //Colors.blue[400],
              //Colors.blue[300],
            ],
            // stops: [0.0, 0.1],
          ),
        ),
      ),
      ),

      drawer:SizedBox(
width: 300.0,
        child: new Drawer(
          child: new Column(
            children: <Widget>[
              new UserAccountsDrawerHeader(

                  accountName: new Text("Siddharth"), accountEmail: Text('Sidharthporwal@gmail.com'),
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage('drawer.jpg'),
                fit: BoxFit.cover
                )
              ),
              ),
              new Column(children: drawerOptions)
            ],
          ),
        ),
      ),


      body:_getDrawerItemWidget(_selectedDrawerIndex),

    );
  }

}
