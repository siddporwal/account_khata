import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService{


  final String uid;
  DatabaseService({this.uid});

  final CollectionReference khataCollection= Firestore.instance.collection('dr_cr');

  Future<void> updateUserData(String Firstname,String Lastname,String mobile) async{
    return await khataCollection.document(uid).setData({
      'First Name':Firstname,
      'Last Name' :Lastname,
      'mobile':mobile,

    });

  }

}