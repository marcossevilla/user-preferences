import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  // singleton implementation
  static final UserPreferences _instance = new UserPreferences._internal();

  factory UserPreferences() {
    return _instance;
  }

  UserPreferences._internal();

  SharedPreferences _prefs;

  initPrefs() async {
    this._prefs = await SharedPreferences.getInstance();
  }

  // useless attributes
  // bool _secondaryColor;
  // int _genre;
  // String _name;

  /*
  *   getters and setters
  */

  // * genre
  get genre {
    return _prefs.getInt('genre' ?? 1);
  }

  set genre(int value) {
    _prefs.setInt('genre', value);
  }
}
