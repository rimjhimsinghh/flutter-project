import 'package:brew_crew/screens/authenticate/register.dart';
import 'package:brew_crew/screens/authenticate/sign_in.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true; //show SignIn
  void toggleView() {
    setState(() => showSignIn = !showSignIn); //get the reverse of current state
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return SignIn(
          toggleView:
              toggleView); //value has to be same, property name can be antything    } else {

    } else {
      return Register(toggleView: toggleView);
    }
  }
}
