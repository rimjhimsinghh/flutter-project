import 'package:brew_crew/models/user.dart';
import 'package:brew_crew/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

//define all diff methods - will interact with FirebaseAuth
//Create an instance of FirebaseAuth
class AuthService {
  FirebaseAuth _auth = FirebaseAuth
      .instance; //_property is private     // object <- instance of FirebaseAuth class(properties & methods all access)

  //  Create user object based on FirebaseUser
  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  //Stream - Authentication Change
  Stream<User> get user {
    return _auth.onAuthStateChanged
        //.map((FirebaseUser user) => _userFromFirebaseUser(user));
        .map(_userFromFirebaseUser);
  }

//  Method to sign in anonymously
  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user); //Custom User
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //  sign-in with email & password
  Future signInWithEmailAndPassword(String email, String password) async {
    AuthResult result;
    FirebaseUser user;
    try {
      result = await _auth.signInWithEmailAndPassword(
          email: email.trim(), password: password);
      user = result.user;
    } on PlatformException catch (e) {
      var msg = 'Error occured, please check your credentials';
      if (e.message != null) {
        msg = e.message;
        return null;
      }
    } catch (e) {
      print(e.message);
      return null;
    }
    return _userFromFirebaseUser(user);
  }

  // register with email
  Future registerWithEmail(String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email.trim(), password: password);
      FirebaseUser user = result.user;
      //Create a new document for the user with the UID
      await DatabaseService(uid: user.uid)
          .updateUserData('0', 'New Crew Member', 100);
      return _userFromFirebaseUser(user);
    } on PlatformException catch (e) {
      var msg = 'Error occured, please check your credentials';
      if (e.message != null) {
        msg = e.message;
        return null;
      }
    } catch (e) {
      print(e.message);
      return null;
    }
  }

  // sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
