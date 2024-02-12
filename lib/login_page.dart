import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Let's sign you in!",
              style: TextStyle(
                fontSize: 24,
                color: Color.fromARGB(255, 4, 146, 146),
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              textAlign: TextAlign.center,
              "Welcome back, Forestin\n You've been missed!",
              style: TextStyle(
                fontSize: 16,
                color: Color.fromARGB(255, 4, 146, 146),
                fontWeight: FontWeight.w300,
                letterSpacing: 0.5
              ),
            ),
            const SizedBox(height: 10),
            Image.network(
              "https://rixburo.nl/wp-content/uploads/2022/08/Reflectie_illustratie-removebg-preview.png",
              height: 200,
              width: 200,
              ),
          ],
        ),
      ),
    );
  }
}