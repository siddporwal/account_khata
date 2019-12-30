import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:account_khata/userprofile.dart';
import 'package:account_khata/user.dart';

class DatabaseService {


  final String uid;

  DatabaseService({this.uid});

  final CollectionReference khataCollection = Firestore.instance.collection(
      'UserData');

  Future<void> updateUserData(String firstname, String lastname,
      String mobile) async {
    return await khataCollection.document(uid).setData({
      'FirstName': firstname,
      'LastName': lastname,
      'mobile': mobile,

    });
  }
List<UserProfile> _profiledataFromSnapshot(QuerySnapshot snapshot){
    return snapshot.documents.map((doc){
      return UserProfile(
        firstname: doc.data['firstname'] ?? '',
        lastname: doc.data['lastname'] ?? '',
        mobile: doc.data['mobile'] ?? '',
      );
    }).toList();

}
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
        uid: uid,
        Firstname: snapshot.data['FirstName'],
        Lastname: snapshot.data['LastName'],
        mobile: snapshot.data['mobile']
    );
  }

  Stream<List<UserProfile>> get profile {
    return khataCollection.snapshots().map(_profiledataFromSnapshot);
  }

  //get user doc stream
Stream<UserData> get userData{
    return khataCollection.document(uid).snapshots()
        .map(_userDataFromSnapshot);

}
/*Stream<QuerySnapshot> get userData(BuildContext context) async*{
  yield* Firestore
}*/
}