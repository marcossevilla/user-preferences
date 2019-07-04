import 'package:user_preferences/src/widgets/menu_widget.dart';

import 'package:user_preferences/src/shared_pref/pref_user.dart';

import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  static final String routeName = 'settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _secondaryColor;
  int _genre;

  // * for text
  TextEditingController _textController;

  // * for handling preferences
  final prefs = new UserPreferences();

  @override
  void initState() {
    super.initState();

    // last page
    prefs.lastPage = SettingsPage.routeName;
    // read genre
    _genre = prefs.genre;
    // read sec color
    _secondaryColor = prefs.secondaryColor;

    // loadPrefs();
    _textController = new TextEditingController(text: prefs.name);
  }

  _setSelectedRadio(int value) {
    prefs.genre = value;
    _genre = value;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: true,
      // appBar: AppBar(
      //   title: Text('Settings'),
      //   automaticallyImplyLeading: false,
      // ),
      body: Scaffold(
        drawer: MenuWidget(),
        body: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(40.0),
              child: Text(
                'Settings',
                style: TextStyle(
                  fontSize: 45.0,
                  fontWeight: FontWeight.bold,
                  color: (prefs.secondaryColor) ? Colors.teal : Colors.blue,
                ),
              ),
            ),
            Divider(),
            SwitchListTile(
              value: _secondaryColor,
              activeColor: (prefs.secondaryColor) ? Colors.teal : Colors.blue,
              inactiveTrackColor:
                  (prefs.secondaryColor) ? Colors.teal : Colors.blue,
              title: Text('Secondary color'),
              onChanged: (value) {
                setState(() {
                  _secondaryColor = value;
                  prefs.secondaryColor = value;
                });
              },
            ),
            Divider(),
            RadioListTile(
              value: 1,
              title: Text('Male'),
              groupValue: _genre,
              onChanged: _setSelectedRadio,
              activeColor: (prefs.secondaryColor) ? Colors.teal : Colors.blue,
            ),
            RadioListTile(
              value: 2,
              title: Text('Female'),
              groupValue: _genre,
              onChanged: _setSelectedRadio,
              activeColor: (prefs.secondaryColor) ? Colors.teal : Colors.blue,
            ),
            Divider(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              child: TextField(
                controller: _textController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  helperText: 'Here you put your actual name',
                  labelStyle: TextStyle(
                    color: (prefs.secondaryColor) ? Colors.teal : Colors.blue,
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: (prefs.secondaryColor) ? Colors.teal : Colors.blue,
                    ),
                  ),
                ),
                onChanged: (value) {
                  prefs.name = value;
                },
                cursorColor: (prefs.secondaryColor) ? Colors.teal : Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
