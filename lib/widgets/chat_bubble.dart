import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_chat_app/models/chat_message_entity.dart';
import 'package:simple_chat_app/services/authentication_service.dart';
import 'package:simple_chat_app/utils/brand_color.dart';

class ChatBubble extends StatelessWidget {
  final ChatMessageEntity entity;
  final Alignment alignment;

  const ChatBubble({Key? key, required this.alignment, required this.entity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isAuthor = entity.author.userName == context.read<AuthenticationService>().getUserName();
    return Align(
      alignment: alignment,
      child: Container(
        // width: MediaQuery.of(context).size.width * 0.5,
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.6,
        ),
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: isAuthor ? BrandColor.primaryColor : BrandColor.tertiaryColor,
          borderRadius: isAuthor
              ? BorderRadius.only(
                  topLeft: Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                )
              : BorderRadius.only(
                  topRight: Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
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
              Container(
                height: 200,
                width: MediaQuery.of(context).size.width * 0.5,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage('${entity.imageUrl}'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
              )
          ],
        ),
      ),
    );
  }
}
