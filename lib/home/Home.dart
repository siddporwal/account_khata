import 'package:account_khata/services/auth.dart';
import 'package:account_khata/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../shared/constants.dart';
import '../settings.dart';
import '../home/payment_methods.dart';
import '../home/spending.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _auth =AuthService();
  @override
  Widget build(BuildContext context) {
    Constants.mContext=context;
    return Scaffold(

      backgroundColor: Colors.white,
    appBar: AppBar(
      backgroundColor: Colors.cyan[300],
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

                Navigator.push(context, MaterialPageRoute(builder: (context) =>AccSettings()));
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
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0),
                    ),

                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      // Add one stop for each color. Stops should increase from 0 to 1
                      stops: [0.2, 0.7],
                      colors: [
                        Color(0xff00b2bb),
                        Color(0xff79d2a6),
//                        Colors.blue[400],
//                        Colors.blue[300],
                      ],
                      // stops: [0.0, 0.1],
                    ),
                  ),

                  height: MediaQuery.of(context).size.height * .40,
                  padding: EdgeInsets.only(top: 20, left: 30, right: 20),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("01 April 2017 to 01 April 2019",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 19.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.white,
                            ),
                            iconSize: 40.0,
                            onPressed: () {},
                          )
                        ],
                      ),
                      SizedBox(height: 30),
                      Text(
                        "Total Sale",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Text(
                        r"$15,990.00",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 34.0,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
//                Container(
//                  height: MediaQuery.of(context).size.height * .75,
//                  color: Colors.white,
//                ),
              ],
            ),

            Container(
              alignment: Alignment.topCenter,
              padding: new EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * .27,
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
                        name: "This Month",
                        amount: r"$5,990.00",
                      ),
                    ),

                    Container(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Spendings(
                        name: "This Week",
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
                  top: MediaQuery.of(context).size.height * .47,
                  right: 20.0,
                  left: 20.0),
              child: new Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: ListView(
                  primary: false,
                  children: <Widget>[

                    PaymentMethods(
                      name: "Cash",
                      amount: r"$1000.22",
                    ),

                    SizedBox(height: 10.0,),

                    PaymentMethods(
                      name: "Card",
                      amount: r"$450.25",
                    ),

                    SizedBox(height: 10.0,),

                    PaymentMethods(
                      name: "Paypal",
                      amount: r"$100.33",
                    ),

                    SizedBox(height: 10.0,),

                    PaymentMethods(
                      name: "Cheque",
                      amount: r"$300.2",
                    ),

                    SizedBox(height: 10.0,),

                    PaymentMethods(
                      name: "Credit",
                      amount: r"$0.0",
                    ),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
