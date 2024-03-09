import 'package:flutter/material.dart';
import 'package:simple_chat_app/models/chat_message_entity.dart';

class ChatInput extends StatelessWidget {
  final Function(ChatMessageEntity) onSendMessage;
  ChatInput({super.key, required this.onSendMessage});

  final TextEditingController chatMessageController = TextEditingController();

  void sendMessage() {
    print('Message Sent: ${chatMessageController.text}');

    final newChatMessage = ChatMessageEntity(
      text: chatMessageController.text,
      id: '1',
      createdAt: DateTime.now().millisecondsSinceEpoch,
      author: Author(userName: 'forestin'),
    );
    onSendMessage(newChatMessage);
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
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return Container(
                    height: 200,
                    color: Colors.white,
                    child: const Center(
                      child: Text('Add a photo'),
                    ),
                  );
                },
              );
            },
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
