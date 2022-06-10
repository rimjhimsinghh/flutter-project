import 'package:brew_crew/screens/wrapper.dart';
import 'package:brew_crew/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:brew_crew/models/user.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      //Provide Stream data to Root Widget - pass down the info received
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(), //wrapper should be the home screen
      ),
    );
  }
}
