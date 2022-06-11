import 'package:brew_crew/services/auth.dart';
import 'package:brew_crew/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:brew_crew/shared/constants.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();

  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  String email = '';
  String password = '';
  String username = '';
  String name = '';
  String confpass = '';

  String error = '';
  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.brown[100],
            appBar: AppBar(
              backgroundColor: Colors.brown[400],
              elevation: 0.0,
              title: Text('Sign Up'),
              actions: <Widget>[
                TextButton.icon(
                    onPressed: () {
                      widget.toggleView();
                    },
                    icon: Icon(
                      Icons.person,
                      color: Colors.black,
                    ),
                    label: Text(
                      'Already a Member?', //Allow to switch b/w signin and signup
                      style: TextStyle(color: Colors.black),
                    ))
              ],
            ),
            body: SingleChildScrollView(
              child: Container(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 20.0,
                        ),
                        TextFormField(
                          validator: (val) =>
                              val.isEmpty ? 'Please provide a Name' : null,
                          decoration:
                              textInputDecoration.copyWith(hintText: 'Name'),
                          autofocus: true,
                          onChanged: (val) {
                            setState(() => name = val);
                          },
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        TextFormField(
                          validator: (val) =>
                              val.isEmpty ? 'Please provide a username' : null,
                          decoration: textInputDecoration.copyWith(
                              hintText: 'Username'),
                          onChanged: (val) {
                            setState(() => username = val);
                          },
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        TextFormField(
                          validator: (val) =>
                              !val.contains('@') ? 'Invalid E-mail' : null,
                          decoration:
                              textInputDecoration.copyWith(hintText: 'E-mail'),
                          onChanged: (val) {
                            setState(() => email = val.trim());
                          },
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        TextFormField(
                          validator: (val) => val.length < 6
                              ? 'Password must be 6+ character long'
                              : null,
                          decoration: textInputDecoration.copyWith(
                              hintText: 'Password'),
                          obscureText: true,
                          onChanged: (val) {
                            setState(() => password = val);
                          },
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        TextFormField(
                          decoration: textInputDecoration.copyWith(
                              hintText: 'Confirm Password'),
                          obscureText: true,
                          onChanged: (val) {
                            setState(() => confpass = val);
                          },
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.pink[400])),
                            onPressed: () async {
                              if (_formKey.currentState.validate()) {
                                setState(() => loading = true);
                                dynamic result = await _auth.registerWithEmail(
                                    email, password);
                                if (result == null) {
                                  setState(() {
                                    error = 'Email Invalid or Already in use';
                                    loading = false;
                                  });
                                }
                              }
                            },
                            child: Text(
                              'REGISTER',
                              style: TextStyle(color: Colors.white),
                            )),
                        SizedBox(
                          height: 12.0,
                        ),
                        Text(
                          error,
                          style: TextStyle(color: Colors.red, fontSize: 12.0),
                        )
                      ],
                    ),
                  )),
            ),
          );
  }
}
