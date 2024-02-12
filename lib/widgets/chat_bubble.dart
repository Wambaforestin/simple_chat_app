import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble(Alignment centerLeft, {Key? key, required this.alignment, required this.message})
      : super(key: key);

  final Alignment alignment;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Container(
        // creating the chat bubbles
        padding: const EdgeInsets.all(24),
        margin: const EdgeInsets.all(50),
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 190, 255, 252),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '$message',
              style: const TextStyle(fontSize: 15),
            ),
            Image.network(
              "https://www.w3schools.com/w3images/lights.jpg",
              height: 200,
              width: 200,
            ),
          ],
        ),
      ),
    );
  }
}