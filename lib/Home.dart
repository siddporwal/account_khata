import 'package:account_khata/services/auth.dart';
import 'package:flutter/material.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _auth =AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
            accountName: Text('Siddharth',),
            accountEmail: Text('Sidha@gmail.com'),
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('drawer.jpg'),
              fit: BoxFit.cover,
              ),
            ),
            ),
            ListTile(
              title: Text('AccBook Settings'),
              onTap: (){

                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('How To Use'),
              onTap: (){

                Navigator.pop(context);
              },

            ),
            ListTile(
              title: Text('Contact us'),
              onTap: (){

                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Share App'),
              onTap: (){
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Logout'),
              onTap: () async{
                await _auth.signOut();
                Navigator.pop(context);

              },
            )
          ],
        ),
      ),
      body:Center(
         child:Body())

    );
  }
}
class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Row(
        children: <Widget>[
          Expanded(
            child: RaisedButton(
              child: Text('+ Create KhataBook',
                style: TextStyle(
                    fontWeight: FontWeight.bold
                ),
              ),
              color: Colors.pink[200],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.horizontal
                    (left: Radius.circular(30.0),
                      right: Radius.circular(0.0))),
              onPressed: (){},

            ),
          ),
          RaisedButton(
            child: Text('Report',
              style: TextStyle(
                  fontWeight: FontWeight.bold
              ),
            ),
            color: Colors.pink[200],
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.horizontal
                  (left: Radius.circular(0.0),
                    right: Radius.circular(0.0))),
            onPressed: (){},

          ),
          RaisedButton(
            child: Text('+ Add Customer',
              style: TextStyle(
                  fontWeight: FontWeight.bold
              ),
            ),
            color: Colors.pink[200],
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.horizontal
                  (left: Radius.circular(0.0),
                    right: Radius.circular(30.0))),
            onPressed: (){},

          ),

        ],
      ),
    );
  }
}

