import 'package:account_khata/home/Home.dart';
import 'package:account_khata/shared/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:contact_picker/contact_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'dart:io';
import 'package:flutter_date_picker/flutter_date_picker.dart';
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';



class Add_Bill extends StatefulWidget {
  @override
  _Add_BillState createState() => _Add_BillState();
}

class _Add_BillState extends State<Add_Bill> {
  String reply;
  Future<String> apiRequest(String url, Map jsonMap) async {
    try {


      HttpClient httpClient = new HttpClient();
      HttpClientRequest request = await httpClient.postUrl(Uri.parse(url));
      request.headers.set('content-type', 'application/json');
      request.add(utf8.encode(json.encode(jsonMap)));
      HttpClientResponse response = await request.close();
      // todo - you should check the response.statusCode
      var reply = await response.transform(utf8.decoder).join();
      httpClient.close();
      Map data = json.decode(reply);
      String status = data['status'].toString();

      print('RESPONCE_DATA : ' + status);

    } catch (e) {
      print(e);
      Fluttertoast.showToast(
          msg: e.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIos: 1,
          backgroundColor: Colors.grey,
          textColor: Colors.white,
          fontSize: 16.0);
      return reply;
    }
  }

  File _image;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;
    });

  }
  final _formkey=GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final ContactPicker _contactPicker = new ContactPicker();
  Contact _contact;
String date='';
String dateform='';
  String contact='';
  String amount='';
  String remark='';
  Function _showBottomSheetCallback;

  bool showDatePicker = false;
  @override
  void initState() {
    super.initState();
    _showBottomSheetCallback = _showBottomSheet;
  }
  /*void _snackBar(String text) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(text)));

  }*/
  _showBottomSheet(String picker){
    setState(() {
      // disable the button
      _showBottomSheetCallback = null;
    });
    _scaffoldKey.currentState
        .showBottomSheet<Null>(
        (BuildContext context){
          switch(picker){
            case 'DatePicker':
              return DatePicker(
                key: dobKey,
                setDate: _setDate,
                customShape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0),
                    bottomLeft: Radius.circular(15.0),
                    bottomRight: Radius.circular(15.0),
                  ),
                ),
                customItemColor: Color(0xFFba5905),
                customGradient:
                LinearGradient(begin: Alignment(-0.5, 1.0), colors: [
                  Color(0xFFba5905),
                  Color(0xFFefcaaa),
                  Color(0xFFba5905),
                ]),
              );
          }
        },
    ).closed
    .whenComplete((){
      if (mounted) {
        setState(() {
          // re-enable the button
          _showBottomSheetCallback = _showBottomSheet;
        });
      }
    });
  }
  void _setDate() {
    Navigator.of(context).pop();
date=(dobKey.currentState.dobStrMonth +
    ' ${dobKey.currentState.dobDate}' +
    ' ${dobKey.currentState.dobYear}').toString();
    /*_snackBar(dobKey.currentState.dobStrMonth +
        ' ${dobKey.currentState.dobDate}' +
        ' ${dobKey.currentState.dobYear}');*/

  }
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Color(0xFFFFFFFF),
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: new Text(''),
          leading: IconButton(icon:Icon(Icons.arrow_back,color: Colors.blue[900],),
            onPressed: (){
              Navigator.push(context,
                  MaterialPageRoute(builder:(context) =>Home()));
            }//=> Navigator.of(context).pop(),
          ),

          elevation: 0.0,
          backgroundColor: Color(0xFFFFFFFF),
        ),


        body: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
              child: Column(
                children: <Widget>[
              Row(
              children:<Widget>[
                  Text('Add new bill',
                      style:TextStyle(fontSize: 18.0,)),]),
                  SizedBox(
                    height: 10.0,
                  ),
            Row(
                children:<Widget>[
                  Text('Please provide us the following details to get started',style: TextStyle(
                    fontSize: 15.0,color: Colors.blueGrey[300],
                  ),),]),
                  SizedBox(height: 20,),
            Row(
                children:<Widget>[
                  Text('Select Contact',
                      textAlign: TextAlign.start,style:TextStyle(
                      fontSize: 14.0,color: Colors.blueGrey[400])),]),
                  TextFormField(
                       enableInteractiveSelection: true,
                       readOnly: true,
                       decoration: InputDecoration(suffixIcon: IconButton(icon:Icon(Icons.contacts,color: Colors.blue[700]),onPressed: ()async {
                        Contact contact = await _contactPicker.selectContact();
                        setState(() {
                          _contact = contact;
                        });

                      },),

                        hintText: _contact == null ? 'No contact selected.' : _contact.toString(),
                         hintStyle: TextStyle(color: Colors.black)
                      ),
                    onSaved: (_contact) {
                      contact= _contact;
                    },
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  SizedBox(height: 20,),
            Row(
                children:<Widget>[
                  Text('Select Date',style:TextStyle(fontSize: 14.0,color: Colors.blueGrey[400])),]),
                  TextFormField(
                    enableInteractiveSelection: true,
                    readOnly: true,
                    decoration: InputDecoration(suffixIcon: IconButton(icon:Icon(Icons.calendar_today,color: Colors.blue[700]),
                    onPressed: () {
                      _showBottomSheet('DatePicker');
                    },
                    ),
                         hintText: date.isEmpty ? 'No date Selected.' : date,
                        hintStyle: TextStyle(color: Colors.black)
                    ),
                    onSaved:(date){
                      dateform=date;
                    } ,



                  ),
                  SizedBox(height: 10.0,),
            Row(
                children:<Widget>[
                  Text('Amount',style:TextStyle(fontSize: 14.0,color: Colors.blueGrey[400])),]),
                  TextFormField(
                    keyboardType:TextInputType.number ,
                    onSaved: (value) {
                      amount= value;
                    },
                  ),
            SizedBox(height: 10.0,),
            Row(
              children: <Widget>[
                Text('Upload Bill Receipt',style:TextStyle(color:Colors.blueGrey[400] )),
              ],
            ),
            SizedBox(height: 10.0,),
            Row(
                children:<Widget>[

                  GestureDetector(
                    onTap: (){
                      getImage();
                    },
                    child: Container(
                      padding: EdgeInsets.all(20.0),
                      decoration:BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                        color: Colors.grey[300],
                      ),
                      child: Icon(Icons.camera_alt,size: 30.0,color: Colors.blue[700]),
                    ),
                  ),]),
                  SizedBox(height: 20,),
            Row(
                children:<Widget>[
                  Text('Remarks/Item name',style:TextStyle(fontSize: 14.0,color: Colors.blueGrey[400])),
                  ]),
                  TextFormField(
                    decoration: InputDecoration(),

                  ),
              new Container(
                  padding: const EdgeInsets.only(left: 20.0, top: 20.0),
                  child: new RaisedButton(
                    child: const Text('Submit',style:TextStyle(fontSize: 15.0)),
                    onPressed: (){
                      _formkey.currentState.save();
                      Map map = {
                        //"firstname": Fname,
                        "date": dateform,
                        "amount": amount,
                        "image": _image,
                        "remarks": remark
                      };
                      apiRequest(Constants.BILL, map);
                    },
                    color: Colors.lightBlue[400],
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(10.0),

                    ),

                  )
              ),

                ]
              ),
            ),
          ),
        ),
      ),
    );
  }
}
