import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color:  Color.fromARGB(255, 4, 146, 146),
              ),
              child: Text('Simple Chat App'),
            ),
            ListTile(
              title: const Text('Login'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Chat'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/chat');
              },
            ),
          ],
        ),
      ),
      body: const Center(
        child: Text(
          "Let's Start Chatting!",
          style: TextStyle(
            fontSize: 24,
            color: Color.fromARGB(255, 4, 146, 146),
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5
          ),
        ),
      ),
    );
  }
}