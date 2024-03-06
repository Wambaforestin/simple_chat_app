import 'package:flutter/material.dart';
import 'package:simple_chat_app/utils/textfield_style.dart';

class LoginTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool hasAsteriks;
  final FormFieldValidator<String>? validator;

  const LoginTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      this.validator,
      this.hasAsteriks = false});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: hasAsteriks,
      validator: (value) {
        if (validator != null) {
          return validator!(value);
        }
        return null;
      },
      controller: controller,
      decoration: InputDecoration(
        // labelText: "Username",
        hintText: "Enter your username",
        hintStyle: ThemeTextStyle.logintextFieldStyle,
        border: const OutlineInputBorder(),
      ),
    );
  }
}
