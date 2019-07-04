import 'package:user_preferences/src/pages/home_page.dart';
import 'package:user_preferences/src/pages/settings_page.dart';
import 'package:user_preferences/src/shared_pref/pref_user.dart';

import 'package:flutter/material.dart';

class MenuWidget extends StatelessWidget {
  final prefs = new UserPreferences();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Center(
              child: Container(
                padding: EdgeInsets.all(50.0),
                color: (prefs.secondaryColor) ? Colors.teal : Colors.blue,
                child: Text(
                  'The Menu',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.home,
              color: (prefs.secondaryColor) ? Colors.teal : Colors.blue,
            ),
            title: Text('Home'),
            onTap: () =>
                Navigator.pushReplacementNamed(context, HomePage.routeName),
          ),
          ListTile(
            leading: Icon(
              Icons.party_mode,
              color: (prefs.secondaryColor) ? Colors.teal : Colors.blue,
            ),
            title: Text('Party Mode'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(
              Icons.people,
              color: (prefs.secondaryColor) ? Colors.teal : Colors.blue,
            ),
            title: Text('People'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              color: (prefs.secondaryColor) ? Colors.teal : Colors.blue,
            ),
            title: Text('Settings'),
            onTap: () =>
                Navigator.pushReplacementNamed(context, SettingsPage.routeName),
          ),
        ],
      ),
    );
  }
}
