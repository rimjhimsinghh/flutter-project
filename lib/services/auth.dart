import 'package:firebase_auth/firebase_auth.dart';

//define all diff methods - will interact with firebase-auth
//create an instance of firebase-auth
class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance; //_ property is private
  //                object <- instance of FirebaseAuth class(properties & methods all access)

  //method to sign in anonymously
  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
  //  sign-in with email
  // register with email
  // sign out
}
