import 'package:flutter/material.dart';
import '../shared/constants.dart';

class Duebills extends StatefulWidget {
  @override
  _DuebillsState createState() => _DuebillsState();
}

class _DuebillsState extends State<Duebills> {
  @override
  Widget build(BuildContext context) {
    Constants.mContext=context;
    return SingleChildScrollView(
      child: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Card(
                color: Colors.blueGrey[100],
                shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(15.0)),
                elevation: 4.0,
                child:Container(
                  padding: EdgeInsets.fromLTRB(20, 20,50, 100),
                  child: InkWell(
                    onTap: (){
                      print('billsdue');
                    },
                    child: Column(
                      children: <Widget>[
                            Row(
                              children: <Widget>[
                                Text('billsdue',style: TextStyle(fontSize: 15.0,color: Colors.black),),
                              ],
                            )

                      ],
                    ),
                  ),
                )
              )
            ],
          )
        ],
      ),
    );
  }
}
