import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simple_chat_app/login_page.dart';
import 'package:simple_chat_app/models/chat_message_entity.dart';
import 'package:simple_chat_app/models/images_model.dart';
import 'package:simple_chat_app/repo/image_repository.dart';
import 'package:simple_chat_app/widgets/chat_bubble.dart';
import 'package:simple_chat_app/widgets/chat_input.dart';
import 'package:http/http.dart' as http;

class ChatPage extends StatefulWidget {
  const ChatPage({super.key, required this.username});
  final String username;

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  // initial messages
  List<ChatMessageEntity> _messages = [
    // Empty list of messages
  ];
  _loadInitialMessages() async {
    // Load initial messages from the the json file in the assets folder
    rootBundle.loadString('assets/default_messages.json').then((response) {
      // print(response);
      final List<dynamic> decodedlist = jsonDecode(response) as List;

      final List<ChatMessageEntity> _chatMessages = decodedlist.map((listItem) {
        return ChatMessageEntity.fromJson(listItem);
      }).toList();

      print(_chatMessages.length);
      // final state of the messages
      setState(() {
        _messages = _chatMessages;
      });
    }); //<- the file path for the json file
  }

//  the sendMessage method is used to add a new message to the list of messages
  sendMessage(ChatMessageEntity newChatMessage) {
    print('Message Sent: ${newChatMessage.text}');
    setState(() {
      _messages.add(newChatMessage);
    });
  }

// getting the network image from the API
 
 final ImageRepository _imageRepository = ImageRepository();

  @override
  void initState() {
    _loadInitialMessages();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 4, 146, 146),
        title: Text(
          'Chat App - ${widget.username}😊',
          style: const TextStyle(
              color: Colors.white,
              fontFamily: 'ZillaSlab',
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app, color: Colors.white),
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => LoginPage()));
            },
          ),
        ],
      ),
      body: Column(
        children: [
          FutureBuilder<List<PixelformImage>>(
            future: _imageRepository.getNetworkImages(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text(
                    'Error: ${snapshot.error}',
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: 5,
                      fontWeight: FontWeight.bold,  
                    
                    ),
                  ),
                );
              } else {
                return Expanded(
                  child: ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return Image.network(snapshot.data![index].urlFullSize);
                    },
                   ),
                );
              }
            },
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return ChatBubble(
                  alignment: _messages[index].author.userName == 'forestin'
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  entity: _messages[index],
                );
              },
            ),
          ),
          // Chat input
          ChatInput(
            onSendMessage: sendMessage,
          ),
        ],
      ),
    );
  }
}
