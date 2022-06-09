import 'package:brew_crew/services/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService(); //instace of AuthService class

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text('Sign In to Brew Crew'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        child: ElevatedButton(
          child: Text('Anonymous Sign-In'),
          onPressed: () async {
            dynamic result = await _auth.signInAnon();
            if (result == null) {
              print('Error signing in');
            } else {
              print('Sign-In Successful!!');
              print(result);
              print(result.uid);
            }
          },
        ),
      ),
    );
  }
}
