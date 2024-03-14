import 'package:flutter/material.dart';
import 'package:simple_chat_app/login_page.dart';
import 'package:simple_chat_app/services/authentication_service.dart';
import 'package:simple_chat_app/utils/brand_color.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(Provider(create: (BuildContext context) { 
    return AuthenticationService();
   },
  child: const ChatApp(),),);
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
      home:  LoginPage(),
    );
  }
}


