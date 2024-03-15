import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_chat_app/chat_page.dart';
import 'package:simple_chat_app/services/authentication_service.dart';
import 'package:simple_chat_app/utils/brand_color.dart';
import 'package:simple_chat_app/utils/spaces.dart';
import 'package:simple_chat_app/widgets/login_text_field.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Future<void> loginUser(BuildContext context) async {
    if (_formKey.currentState != Null && _formKey.currentState!.validate()) {
      print('Login Successful!');
      print('Username: ${usernameController.text}');
      print('Password: ${passwordController.text}');

      await context.read<AuthenticationService>().login(
            usernameController.text,
            passwordController.text,
          );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ChatPage(
            username: usernameController.text,
          ),
        ),
      );
    } else {
      print('Login Failed!');
    }
  }

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Widget _buildHeader(context) {
    return Column(
      children: [
        AppBar(
          title: const Text(
            "Let's sign you in!",
            style: TextStyle(
              fontFamily: "ZillaSlab",
              color: BrandColor.primaryColor,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
            ),
          ),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.info_outline,
                color: BrandColor.primaryColor,
                size: 30,
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text(
                        "About Simple Chat App",
                        style: TextStyle(
                            color: BrandColor.primaryColor,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.5),
                      ),
                      content: const Text(
                          "Simple Chat App is a simple chat application that allows you to talk to your self, that's it  demonstrates how a basic chat application works. It was built using Flutter and Dart. Additionally, it uses an api to load images that the user can load while chatting"),
                      actions: <Widget>[
                        Stack(
                          children: <Widget>[
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: BrandColor.tertiaryColor,
                                padding: const EdgeInsets.all(10),
                                textStyle: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              child: const Text(
                                "Close",
                                style: TextStyle(
                                  color: Colors.white,
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
        verticalSpace(20),
        Image.asset(
          "assets/images/simple_chat_image.png",
          height: 300,
          width: 300,
        ),
      ],
    );
  }

  Widget _buildFooter(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        verticalSpace(10),
        const Text(
          "Find us on social media",
          style: TextStyle(
            color: BrandColor.tertiaryColor,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
          ),
        ),
        verticalSpace(10),
        GestureDetector(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                "assets/images/github.svg",
                height: 25,
                width: 25,
                // ignore: deprecated_member_use
                color: Colors.black,
              ),
              horizontalSpace(10),
              SvgPicture.asset(
                "assets/images/twitter.svg",
                height: 25,
                width: 25,
                // ignore: deprecated_member_use
                color: Colors.blue,
              ),
              horizontalSpace(10),
              SvgPicture.asset(
                "assets/images/linkedin.svg",
                height: 25,
                width: 25,
                // ignore: deprecated_member_use
                color: Colors.blueAccent,
              ),
            ],
          ),
          onTap: () {
            // show a dialog with the social media links
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text(
                    "Social Media Links",
                    style: TextStyle(
                        color: BrandColor.primaryColor,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5),
                  ),
                  content: const Text(
                      "You can find us on social media using the following links: \n\nGithub: https://github.com/ \n\nTwitter: https://twitter.com/ \n\nLinkedIn: https://www.linkedin.com/"),
                  actions: <Widget>[
                    Stack(
                      children: <Widget>[
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: BrandColor.tertiaryColor,
                            padding: const EdgeInsets.all(10),
                            textStyle: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          child: const Text(
                            "Close",
                            style: TextStyle(
                              color: Colors.white,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            );
          },
        ),
      ],
    );
  }

  Widget _buildForm(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Form(
          key: _formKey,
          child: Column(
            children: [
              LoginTextField(
                hintText: "Enter your username",
                validator: (value) {
                  if (value != null && value.isNotEmpty && value.length < 5) {
                    return "Username must be at least 5 characters long";
                  } else if (value != null && value.isEmpty) {
                    return "Username cannot be empty";
                  }
                  return null;
                },
                controller: usernameController,
              ),
              verticalSpace(10),
              LoginTextField(
                controller: passwordController,
                hasAsteriks: true,
                hintText: "Enter your password",
              ),
            ],
          ),
        ),
        verticalSpace(10),
        ElevatedButton(
          onPressed: () async {
            await loginUser(context);
          },
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
        ),
        verticalSpace(20),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: LayoutBuilder(
          builder: (context, BoxConstraints constraints) {
            // Your code here
            if (constraints.maxWidth > 1000) {
              return Row(
                children: [
                  Spacer(
                    flex: 1,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildHeader(context),
                        verticalSpace(10),
                        _buildFooter(context),
                      ],
                    ),
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  Expanded(
                    child: _buildForm(context),
                  ),
                  Spacer(
                    flex: 1,
                  ),
                ],
              );
            }
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildHeader(context),
                Spacer(
                  flex: 1,
                ),
                _buildForm(context),
                _buildFooter(context),
                Spacer(
                  flex: 2,
                )
              ],
            ); // Replace Container() with your desired Widget
          },
        ),
      ),
    );
  }
}
