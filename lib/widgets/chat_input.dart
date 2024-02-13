import 'package:flutter/material.dart';

class ChatInput extends StatelessWidget {
  ChatInput({super.key});

  final TextEditingController chatMessageController = TextEditingController();

  void sendMessage() {
    if (chatMessageController.text.isNotEmpty) {
      print('Message Sent: ${chatMessageController.text}');
      chatMessageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 4, 146, 146),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.add, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.camera_alt, color: Colors.white),
            onPressed: () {},
          ),
          Expanded(
            child: TextField(
              keyboardType: TextInputType.multiline,
              maxLines: null,
              minLines: 1,
              textCapitalization: TextCapitalization.sentences,
              controller: chatMessageController,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Type a message....",
                hintStyle: TextStyle(color: Colors.white),
              ),
              style: const TextStyle(color: Colors.white),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send, color: Colors.white),
            onPressed: sendMessage,
          ),
        ],
      ),
    );
  }
}
