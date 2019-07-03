import 'package:flutter/material.dart';

import 'package:user_preferences/src/widgets/menu_widget.dart';

class HomePage extends StatelessWidget {
  static final String routeName = 'home';

  @override
  Widget build(BuildContext context) {
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
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Secondary color: '),
                Divider(),
                Text('Genre: '),
                Divider(),
                Text('Username: '),
                Divider(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
