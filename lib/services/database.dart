import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:account_khata/userprofile.dart';

class DatabaseService {


  final String uid;

  DatabaseService({this.uid});

  final CollectionReference khataCollection = Firestore.instance.collection(
      'dr_cr');

  Future<void> updateUserData(String Firstname, String Lastname,
      String mobile) async {
    return await khataCollection.document(uid).setData({
      'First Name': Firstname,
      'Last Name': Lastname,
      'mobile': mobile,

    });
  }
List<UserProfile> _profiledataFromSnapshot(QuerySnapshot snapshot){
    return snapshot.documents.map((doc){
      return UserProfile(
        Firstname: doc.data['Firstname'] ?? '',
        Lastname: doc.data['Lastname'] ?? '',
        mobile: doc.data['mobile'] ?? '',
      );
    }).toList();
}

  Stream<List<UserProfile>> get profile {
    return khataCollection.snapshots().map(_profiledataFromSnapshot);
  }
}