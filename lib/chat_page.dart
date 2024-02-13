import 'package:flutter/material.dart';
import 'package:simple_chat_app/login_page.dart';
import 'package:simple_chat_app/widgets/chat_bubble.dart';
import 'package:simple_chat_app/widgets/chat_input.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key, required this.username});
  final String username;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 4, 146, 146),
        title: Text(
          'Chat App - $username!',
          style: const TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app, color: Colors.white),
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => LoginPage()));
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return ChatBubble(
                  Alignment.centerLeft,
                  alignment: (index % 2 == 0)
                      ? Alignment.centerLeft
                      : Alignment.centerRight,
                  message: "Hello!",
                );
              },
            ),
          ),
          ChatInput(),
        ],
      ),
    );
  }
}
