import 'package:shared_preferences/shared_preferences.dart';

// Fake authentication service...
//This section is a fake authentication service that returns a hardcoded username.
//we used the Provider package to provide the AuthenticationService to the rest of the app.
class AuthenticationService {
  static init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static late final SharedPreferences _prefs;
  Future<void> login(String userName, String password) async {
    // login logic...
    try {
      SharedPreferences sharedPrefs = await _prefs;
      sharedPrefs.setString('username', userName);
    } catch (e) {
      print(e);
    }
  }

  Future<bool> isLoggedIn() async {
    String? username = await _prefs.getString('username');
    if (username != null) {
      return true;
    } else {
      return false;
    }
  }

  void logout() {
    // logout logic...
    _prefs.clear();
  }

  getUserName() {
    return _prefs.getString('username') ?? 'Guest';
  }

  void updateUserName(String userName) {
    // to be implimented..
  }
}

//The reason why we didn't use a simple function to return the username is that we want to demonstrate how to use the Provider package to provide the AuthenticationService to the rest of the app.
//The AuthenticationService class is a simple class with three methods: login, logout, and getUserName. The login and logout methods are empty, and the getUserName method returns a hardcoded username.
