import 'package:flutter/material.dart';
import 'package:simple_chat_app/models/chat_message_entity.dart';

class ChatBubble extends StatelessWidget {
  final ChatMessageEntity entity;
  final Alignment alignment;

  const ChatBubble({Key? key, required this.alignment, required this.entity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Container(
        // width: MediaQuery.of(context).size.width * 0.5,
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.5,
        ),
        padding: const EdgeInsets.all(24),
        margin: const EdgeInsets.all(50),
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 144, 190, 188),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
            bottomLeft: Radius.circular(12),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (entity.text.isNotEmpty)
              Text(
                '${entity.text}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            if (entity.imageUrl != null)
              Image.network(
                '${entity.imageUrl}',
                height: 200,
              )
          ],
        ),
      ),
    );
  }
}
