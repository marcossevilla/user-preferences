import 'package:user_preferences/src/pages/settings_page.dart';
import 'package:user_preferences/src/shared_pref/pref_user.dart';
import 'package:user_preferences/src/widgets/menu_widget.dart';

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static final String routeName = 'home';
  final prefs = new UserPreferences();

  @override
  Widget build(BuildContext context) {
    // last page
    prefs.lastPage = SettingsPage.routeName;

    return Scaffold(
      // appBar: AppBar(
      //   title: Text('User Preferences'),
      // ),
      body: Scaffold(
        drawer: MenuWidget(),
        body: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(40.0),
              child: Text(
                'User Preferences',
                style: TextStyle(
                  fontSize: 45.0,
                  fontWeight: FontWeight.bold,
                  color: (prefs.secondaryColor) ? Colors.teal : Colors.blue,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Secondary color: ${prefs.secondaryColor}'),
                Divider(),
                Text('Genre: ${prefs.genre}'),
                Divider(),
                Text('Username: ${prefs.name}'),
                Divider(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
