import 'package:flutter/material.dart';
import 'package:simple_chat_app/models/chat_message_entity.dart';
import 'package:simple_chat_app/utils/brand_color.dart';
import 'package:simple_chat_app/widgets/picker_body.dart';

class ChatInput extends StatefulWidget {
  final Function(ChatMessageEntity) onSendMessage;
  ChatInput({super.key, required this.onSendMessage});

  @override
  State<ChatInput> createState() => _ChatInputState();
}

class _ChatInputState extends State<ChatInput> {
  final TextEditingController chatMessageController = TextEditingController();

  String _newImageUrl = '';
  void sendMessage() {
    print('Message Sent: ${chatMessageController.text}');

    final newChatMessage = ChatMessageEntity(
      text: chatMessageController.text,
      id: '1',
      createdAt: DateTime.now().millisecondsSinceEpoch,
      author: Author(userName: 'forestin'),
    );
    if (_newImageUrl.isNotEmpty) {
      newChatMessage.imageUrl = _newImageUrl;
    }
    widget.onSendMessage(newChatMessage);
    // clear the text field after sending the message
    chatMessageController.clear();
    _newImageUrl = '';
    setState(() {});
  }

  void onImagePicked(String newImageUrl) {
    setState(() {
      _newImageUrl = newImageUrl;
    });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
                barrierColor: Colors.black.withOpacity(0.5),
                backgroundColor: BrandColor.quaternaryColor,
                context: context,
                builder: (BuildContext context) {
                  return NetworkImagePickerBody(
                    onImageSelected: onImagePicked,
                  );
                },
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.camera_alt, color: Colors.white),
            onPressed: () {
              // implement Camera Image Picker
            },
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
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
                if (_newImageUrl.isNotEmpty)
                  Image.network(
                    _newImageUrl,
                    width: 50,
                    height: 50,
                  ),
              ],
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
