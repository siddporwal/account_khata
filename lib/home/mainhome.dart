import 'package:account_khata/data/add_bill.dart';
import 'package:account_khata/data/add_customer.dart';
import 'package:account_khata/home/fab_bottom_app_bar.dart';
import 'package:account_khata/home/fab_with_icons.dart';
import 'package:account_khata/home/spending.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../shared/constants.dart';
import 'package:account_khata/home/duebills.dart';
class MainHome extends StatefulWidget {
  @override
  _MainHomeState createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  SharedPreferences prefs;
  String _lastSelected = 'TAB: 0';
  void _selectedTab(int index) {
    setState(() {
      _lastSelected = 'TAB: $index';
    });
  }
  void _selectedFab(int index) {
    setState(() {
      _lastSelected = 'FAB: $index';
    });
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
    return Scaffold(
      bottomNavigationBar: FABBottomAppBar(
        color: Colors.grey,
        selectedColor: Colors.red,
        notchedShape: CircularNotchedRectangle(),
        onTabSelected: _selectedTab,
        items: [
          FABBottomAppBarItem(iconData: Icons.account_balance_wallet, text: 'Home'),
          FABBottomAppBarItem(iconData: Icons.people, text: 'customers'),
          FABBottomAppBarItem(iconData: Icons.card_giftcard, text: 'rewards'),
          FABBottomAppBarItem(iconData: Icons.pie_chart, text: 'reports'),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: _buildFab(
          context), // This trailing comma makes auto-formatting nicer for build methods.
      body: SingleChildScrollView(
        child:
        Stack(
          children: <Widget>[

            /*Text(
              _lastSelected,
              style: TextStyle(fontSize: 32.0),
            ),*/
            Column(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0),
                    ),

                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.topRight,
                      // Add one stop for each color. Stops should increase from 0 to 1
                      stops: [0.2, 0.9],
                      colors: [
                        Colors.blue[600],
                        Colors.blue[900],
                      ],
                      // stops: [0.0, 0.1],
                    ),
                  ),
                  height: MediaQuery.of(context).size.height * .10,
                  padding: EdgeInsets.only(top: 20, left: 30, right: 20),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * .75,
                  color: Colors.white,
                ),
              ],
            ),
            Container(
              alignment: Alignment.topCenter,
              padding: new EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * .05,
                  right: 20.0,
                  left: 20.0),
              child: new Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: GridView(
                  primary: false,
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: MediaQuery.of(context).size.width /
                        (MediaQuery.of(context).size.height / 2.5),
                  ),
                  children: <Widget>[

                    Container(
                      padding: EdgeInsets.only(right: 10.0),
                      child: Spendings(
                        name: "Income",
                        amount: r"$5,990.00",
                      ),
                    ),

                    Container(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Spendings(
                        name: "Epenses",
                        amount: r"$200.00",
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              alignment: Alignment.topCenter,
              padding: new EdgeInsets.only(
                top: MediaQuery.of(context).size.height * .30,
                right: 25.0,
                left: 25.0,
                bottom: 50.0,
              ),
              child: new Container(
                child:  Container(
                  //padding: EdgeInsets.only(left: 10.0),
                  child: Duebills(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildFab(BuildContext context) {

    final icons = [ Icons.receipt, Icons.person,];

    return FabWithIcons(

      icons: icons,

      onIconTapped: (index) {

        switch(index){
          case 0:
            print('indexx ${index.toString()}');

            Navigator.push(context,
                MaterialPageRoute(builder:(context) =>Add_Bill()));

            break;
          case 1:
            print('indexx ${index.toString()}');

            Navigator.push(context,
                MaterialPageRoute(builder:(context) =>Add_Customer()));

            break;
          default:
            print('degausnhdf');

            break;
        }
       /*Navigator.push(Constants.mContext,
            MaterialPageRoute(builder:(context) =>Add_Bill()));
        Navigator.push(Constants.mContext,
            MaterialPageRoute(builder:(context) =>Add_Customer()));*/

      },

    );

  }
}
