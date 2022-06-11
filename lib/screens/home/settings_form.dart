import 'package:flutter/material.dart';
import 'package:brew_crew/shared/constants.dart'; //for text decoration

class SettingsForm extends StatefulWidget {
  @override
  State<SettingsForm> createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> sugars = ['0', '1', '2', '3', '4'];

  //form values
  String _currentName;
  String _currentSugars;
  int _currentStrength;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            SizedBox(height: 20.0),
            Container(
              color: Colors.pink[400],
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child: Text(
                'Update Brew Settings',
                style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w300),
              ),
            ),
            SizedBox(height: 40.0),
            TextFormField(
              decoration: textInputDecoration.copyWith(hintText: 'Name'),
              validator: (val) => val.isEmpty ? 'Please enter a name' : null,
              onChanged: (val) => setState(() => _currentName = val),
            ),
            SizedBox(
              height: 30.0,
            ),
            //dropdown
            DropdownButtonFormField(
              value: _currentSugars ?? '0',
              items: sugars.map((sugar) {
                return DropdownMenuItem(
                  value: sugar,
                  child: Text('$sugar sugar(s)'),
                );
              }).toList(),
              onChanged: (val) => setState(() => _currentSugars = val),
            ),
            //list of dropdown menu items widgets

            SizedBox(
              height: 30.0,
            ),
            //slider
            Slider(
              value: (_currentStrength ?? 100).toDouble(),
              activeColor: Colors.brown[_currentStrength ?? 100],
              inactiveColor: Colors.brown[100],
              min: 100.0,
              max: 900.0,
              divisions: 8,
              onChanged: (val) =>
                  setState(() => _currentStrength = val.round()),
            ),
            SizedBox(
              height: 30.0,
            ),
            //Button
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.pink[400])),
                onPressed: () async {
                  print(_currentName);
                  print(_currentSugars);
                  print(_currentStrength);
                },
                child: Text(
                  'Update',
                  style: TextStyle(color: Colors.white),
                )),
            SizedBox(height: 40.0),
          ],
        ),
      ),
    );
  }
}
