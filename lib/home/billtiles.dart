import 'package:flutter/material.dart';

class Billtiles extends StatefulWidget {
  @override
  _BilltilesState createState() => _BilltilesState();
}

class _BilltilesState extends State<Billtiles> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(15.0)),
      elevation: 4.0,
        child:InkWell(
          onTap: (){
            print('billsdue');
          },
          child: Column(
            children: <Widget>[
              Text('billsdue',style: TextStyle(fontSize: 15.0,color: Colors.black26),)

            ],
          ),
        )
    );
  }
}
