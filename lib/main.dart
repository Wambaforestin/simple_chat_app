import 'package:flutter/material.dart';
import 'package:simple_chat_app/chat_page.dart';
import 'package:simple_chat_app/login_page.dart';
import 'package:simple_chat_app/services/authentication_service.dart';
import 'package:simple_chat_app/utils/brand_color.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); //<- This line is added to ensure that the WidgetsBinding is initialized before the app starts, that is because the init method in the AuthenticationService class is an async method.
 await AuthenticationService.init(); //<- This line is added to ensure that the AuthenticationService is initialized before the app starts.
  runApp(
    // Wrap the entire app in the Provider widget : The provider package is used to provide the AuthenticationService to the rest of the app, avoiding the need to pass the AuthenticationService down the widget tree manually.
    Provider(
      create: (BuildContext context) {
        return AuthenticationService();
      },
      child: const ChatApp(),
    ),
  );
}

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: BrandColor.primaryColor,
      ),
      debugShowCheckedModeBanner: false,
      title: "Simple Chat App",
      home: FutureBuilder(
        future: Provider.of<AuthenticationService>(context).isLoggedIn(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData &&snapshot.data!) {
              return ChatPage(username: 'your_username_here');
            } else {
              return  LoginPage();
            }
          } else {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        },
      )
    );
  }
}
