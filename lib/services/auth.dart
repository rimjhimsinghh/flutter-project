import 'package:brew_crew/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

//define all diff methods - will interact with FirebaseAuth
//Create an instance of FirebaseAuth
class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;   //_property is private     // object <- instance of FirebaseAuth class(properties & methods all access)
  

  //  Create user object based on FirebaseUser
  User _userFromFirebaseUser(FirebaseUser user) 
  {
    return user != null ? User(uid: user.uid) : null;
  }

//  Method to sign in anonymously
  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);   //Custom User 
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
  //  sign-in with email
  // register with email
  // sign out
}
