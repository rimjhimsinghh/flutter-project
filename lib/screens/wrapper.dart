import 'package:brew_crew/screens/authenticate/authenticate.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:brew_crew/models/user.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(
        context); //  Listen inside wrapper - We can access <User> data from Provider

    //return Home or Authenticate
    return Authenticate();
  }
}
