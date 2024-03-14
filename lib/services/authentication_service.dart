// Fake authentication service...  
//This section is a fake authentication service that returns a hardcoded username.
//we used the Provider package to provide the AuthenticationService to the rest of the app.
class AuthenticationService {
  void login() {}

  void logout() {}

  String getUserName() {
    return 'forestin';
  }
}

//The reason why we didn't use a simple function to return the username is that we want to demonstrate how to use the Provider package to provide the AuthenticationService to the rest of the app.
//The AuthenticationService class is a simple class with three methods: login, logout, and getUserName. The login and logout methods are empty, and the getUserName method returns a hardcoded username.