import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:contact_picker/contact_picker.dart';
class Add_Bill extends StatefulWidget {
  @override
  _Add_BillState createState() => _Add_BillState();
}

class _Add_BillState extends State<Add_Bill> {
  final _formkey=GlobalKey<FormState>();
  final ContactPicker _contactPicker = new ContactPicker();
  Contact _contact;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                Text('Add new bill',style:TextStyle(fontSize: 18.0,)),
                SizedBox(
                  height: 10.0,
                ),
                Text('Please provide us the following details to get started',style: TextStyle(
                  fontSize: 14.0,color: Colors.blueGrey[300],
                ),),
                SizedBox(height: 20,),
                Text('Select Customer',style:TextStyle(fontSize: 14.0,color: Colors.blueGrey[400])),

                   TextField(
                     enableInteractiveSelection: true,

readOnly: true,
                     decoration: InputDecoration(suffixIcon: IconButton(icon:Icon(Icons.contacts),onPressed: ()async {
                      Contact contact = await _contactPicker.selectContact();
                      setState(() {
                        _contact = contact;
                      });
                    },),

                      hintText: _contact == null ? 'No contact selected.' : _contact.toString(),
                       hintStyle: TextStyle(color: Colors.black)
                    ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Text('Select Date',style:TextStyle(fontSize: 14.0,color: Colors.blueGrey[400])),
                TextFormField(
                    keyboardType:TextInputType.text ,

                ),
                SizedBox(
                  height: 15.0,
                ),
                Text('Mobile',style:TextStyle(fontSize: 14.0,color: Colors.blueGrey[400])),
                TextFormField(
                    keyboardType:TextInputType.phone ,

                ),
                SizedBox(
                  height: 15.0,
                ),
                Text('Address',style:TextStyle(fontSize: 14.0,color: Colors.blueGrey[400])),
                TextFormField(
                    keyboardType:TextInputType.multiline,

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
