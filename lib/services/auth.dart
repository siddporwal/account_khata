import 'package:account_khata/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../user.dart';

class AuthService{
  final FirebaseAuth _auth = FirebaseAuth.instance;
//crete user obj based on firebase user
  User _userFromFirebaseUser(FirebaseUser user){
    return user !=null ? User(uid:user.uid) : null;
  }
  //sign in anon
  /*Future signInAnon() async{
    try {
      AuthResult result =await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return user;
    } catch(e){
      print(e.toString());
      return null;

    }
  }*/
  Stream<User> get user{
    return _auth.onAuthStateChanged.map(_userFromFirebaseUser);
  }
 //sign in with email & password
  Future signIn(String email,String password) async{
    try{
      AuthResult result= await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user =result.user;
      return user;
    }catch(e){
      print(e.toString());
      return null;

    }
  }
 //register with email & password
  Future register(String email,String password) async{
    try{
      AuthResult result= await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user =result.user;
      //create a new document for the user with user id
      await DatabaseService(uid:user.uid).updateUserData('Firstname','Lname','Mobile');
      return _userFromFirebaseUser(user);
    }catch(e){
      print(e.toString());
      return null;

    }
  }

 // sign out
 Future signOut() async{
    try {
      return await _auth.signOut();
    }catch (e){
      print(e.toString());
      return null;
    }
 }

}