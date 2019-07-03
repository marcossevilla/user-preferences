import 'package:user_preferences/src/widgets/menu_widget.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  static final String routeName = 'settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _secondaryColor = false;
  int _genre = 1;

  // * for text
  String _name = '';
  TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    loadPrefs();
    _textController = new TextEditingController(text: _name);
  }

  // * set last preferences of settings if loads again
  loadPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _genre = prefs.getInt('genre');
    setState(() {});
  }

  _setSelectedRadio(int value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('genre', value);
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
                ),
              ),
            ),
            Divider(),
            SwitchListTile(
              value: _secondaryColor,
              title: Text('Secondary color'),
              onChanged: (value) => setState(() => _secondaryColor = value),
            ),
            Divider(),
            RadioListTile(
              value: 1,
              title: Text('Male'),
              groupValue: _genre,
              onChanged: _setSelectedRadio,
            ),
            RadioListTile(
              value: 2,
              title: Text('Female'),
              groupValue: _genre,
              onChanged: _setSelectedRadio,
            ),
            Divider(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              child: TextField(
                controller: _textController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  helperText: 'Here you put your actual name',
                ),
                onChanged: (value) {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
