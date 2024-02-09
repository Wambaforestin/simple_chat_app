import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 4, 146, 146),
        title: const Text(
          "Hi Forestin!",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app, color: Colors.white),
            onPressed: () {
              // Navigator.pushNamed(context, '/');
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          Container(
            // creating the chat bubbles
            padding: const EdgeInsets.all(25),
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
                const Text(
                  'Hi Forestin, first message',
                  style: TextStyle(fontSize: 20),
                ),
                Image.network("https://www.w3schools.com/w3images/lights.jpg"),
              ],
            ),
          ),
          Container(
            // creating the chat bubbles
            padding: const EdgeInsets.all(25),
            margin: const EdgeInsets.all(40),
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
                const Text(
                  'Hi Forestin, first message',
                  style: TextStyle(fontSize: 20),
                ),
                Image.network("https://www.w3schools.com/w3images/lights.jpg"),
              ],
            ),
          ),
          Container(
            // creating the chat bubbles
            padding: const EdgeInsets.all(25),
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
                const Text(
                  'Hi Forestin, first message',
                  style: TextStyle(fontSize: 20),
                ),
                Image.network("https://www.w3schools.com/w3images/lights.jpg"),
              ],
            ),
          ),
          Container(
            height: 80,
            decoration: const BoxDecoration(
              color:   Color.fromARGB(255, 4, 146, 146),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.camera_alt, color: Colors.white),
                  onPressed: () {},
                ),
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Type a message....",
                      hintStyle: TextStyle(color: Colors.white),
                    ),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send, color: Colors.white),
                  onPressed: () {},
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
// decoration: const BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage("assets/images/chat_background.jpg"),
//             fit: BoxFit.cover,
//           ),
//         ),