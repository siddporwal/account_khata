import 'package:flutter/material.dart';
class Add_Customer extends StatefulWidget {
  @override
  _Add_CustomerState createState() => _Add_CustomerState();
}

class _Add_CustomerState extends State<Add_Customer> {
  final _formkey=GlobalKey<FormState>();
  String Fname='';
  String Lname='';
  String mobile='';
  String add='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                Text('Add new customer',style:TextStyle(fontSize: 18.0,)),
                SizedBox(
                  height: 10.0,
                ),
                Text('Please provide us the following details to get started',style: TextStyle(
                  fontSize: 14.0,color: Colors.blueGrey[300],
                ),),
                SizedBox(height: 20,),
                Text('First Name',style:TextStyle(fontSize: 14.0,color: Colors.blueGrey[400])),
                TextFormField(
                  keyboardType:TextInputType.text ,
                    onChanged: (val) {
                      setState(() {
                        Fname=val;
                      });
                    }
                ),
                SizedBox(
                  height: 15.0,
                ),
                Text('Last Name',style:TextStyle(fontSize: 14.0,color: Colors.blueGrey[400])),
                TextFormField(
                  keyboardType:TextInputType.text ,
                    onChanged: (val) {
                      setState(() {
                        Lname=val;
                      });
                    }
                ),
                SizedBox(
                  height: 15.0,
                ),
                Text('Mobile',style:TextStyle(fontSize: 14.0,color: Colors.blueGrey[400])),
                TextFormField(
                    keyboardType:TextInputType.phone ,
                    onChanged: (val) {
                      setState(() {
                        mobile=val;
                      });
                    }
                ),
                SizedBox(
                  height: 15.0,
                ),
                Text('Address',style:TextStyle(fontSize: 14.0,color: Colors.blueGrey[400])),
                TextFormField(
                    keyboardType:TextInputType.multiline,
                    onChanged: (val) {
                      setState(() {
                        add=val;
                      });
                    }
                ),
                RaisedButton(child: Text('Add Customer',style: TextStyle(fontSize: 14.0,color: Colors.white,fontWeight: FontWeight.bold),),
                  onPressed: (){},
                  color: Colors.teal[400],



                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
