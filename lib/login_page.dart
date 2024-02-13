import 'package:flutter/material.dart';
import 'package:simple_chat_app/chat_page.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  void loginUser(context) {
    if (_formKey.currentState!=Null && _formKey.currentState!.validate()) {
      print('Login Successful!');
      print('Username: ${usernameController.text}');
      print('Password: ${passwordController.text}');

    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ChatPage(
      username: usernameController.text,
    )));

    } else {
      print('Login Failed!');
    }
  }

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Page"),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  "Let's sign you in!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 24,
                      color: Color.fromARGB(255, 4, 146, 146),
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5),
                ),
                const SizedBox(height: 5),
                const Text(
                  textAlign: TextAlign.center,
                  "Welcome back,\n You've been missed!",
                  style: TextStyle(
                      fontSize: 16,
                      color: Color.fromARGB(255, 4, 146, 146),
                      fontWeight: FontWeight.w300,
                      letterSpacing: 0.5),
                ),
                const SizedBox(height: 5),
                Image.network(
                  "https://rixburo.nl/wp-content/uploads/2022/08/Reflectie_illustratie-removebg-preview.png",
                  height: 200,
                  width: 200,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (value) {
                          if (value != Null &&
                              value!.isNotEmpty &&
                              value.length < 5) {
                            return "your unsername should be at least 5 characters long.";
                          } else if (value != Null && value!.isEmpty) {
                            return "Username is required";
                          }
                          return null;
                        },
                        controller: usernameController,
                        decoration: const InputDecoration(
                          // labelText: "Username",
                          hintText: "Enter your username",
                          hintStyle: TextStyle(
                            color: Color.fromARGB(255, 3, 150, 150),
                          ),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 5),
                      TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          // labelText: "Password",
                          hintText: "Enter your password",
                          hintStyle: TextStyle(
                            color: Color.fromARGB(255, 4, 146, 146),
                          ),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                    onPressed: () => loginUser(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 4, 146, 146),
                    padding: const EdgeInsets.all(10),
                    textStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  child: const Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.white,
                      letterSpacing: 0.5,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
