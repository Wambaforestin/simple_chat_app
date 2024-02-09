import 'package:flutter/material.dart';
import 'package:simple_chat_app/chat_page.dart';
import 'package:simple_chat_app/login_page.dart';

void main() {
  runApp(const ChatApp());
}

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 4, 146, 146),
      ),
      debugShowCheckedModeBanner: false,
      title: "Simple Chat App",
      home: const ChatPage(),
    );
  }
}


