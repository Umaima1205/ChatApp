import 'package:flutter/material.dart';

void main() {
  runApp(SimpleChatApp());
}

class SimpleChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
    
      home: ChatScreen(),
    );
  }
}

class ChatMessage {
  final String text;
  final bool isSent;

  ChatMessage({required this.text, required this.isSent});
}

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final List<ChatMessage> _messages = [];

  void _sendMessage(String message) {
    if (message.isNotEmpty) {
      setState(() {
        _messages.add(ChatMessage(text: message, isSent: true));
      });
      _messageController.clear();

      // Simulate a received message after a brief delay
      Future.delayed(Duration(seconds: 1), () {
        final receivedMessages = [
          "Hello!.",
          "Yes!",
          "Its Great",
          "Yeah",
        ];

        final randomIndex = DateTime.now().millisecondsSinceEpoch % receivedMessages.length;
        _receiveMessage(receivedMessages[randomIndex]);
      });
    }
  }

  void _receiveMessage(String message) {
    setState(() {
      _messages.add(ChatMessage(text: message, isSent: false));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.white,
      appBar: AppBar(
        
  backgroundColor: const Color.fromARGB(255, 17, 110, 187),
  title: const Text(
    "ChatView",
    style: TextStyle(
      fontSize: 18,
      letterSpacing: 1,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
  ),
  
  leading: Container(
    margin: const EdgeInsets.only(left: 18.0),
     child: const CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 25.0, // Radius of the CircleAvatar
            child: Image(
              height: 40.0, // Adjust the height as needed
              width: 40.0, // Adjust the width as needed
              image: AssetImage(
                "assests/images/dp.png",
              ),
              fit: BoxFit.cover, // Make the image cover the available space
            ),
          ),
  ),
  toolbarHeight: 70,
  elevation: 5,
  actions: [
    Container(
      margin: const EdgeInsets.only(right: 18.0, left: 18.0),
      child: const Icon(
        Icons.call_sharp,
        size: 25.0,
        color: Colors.pinkAccent,
      ),
    ),
    Container(
      margin: const EdgeInsets.only(right: 18.0, left: 18.0),
      child: const Icon(
        Icons.video_call_rounded,
        size: 25.0,
        color: Colors.cyanAccent,
      ),
    ),
    Container(
      margin: const EdgeInsets.only(right: 18.0, left: 18.0),
      child: const Icon(
        Icons.menu,
        size: 25.0,
        color: Colors.amber,
      ),
    ),
  ],
),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Align(
                    alignment: _messages[index].isSent ? Alignment.centerRight : Alignment.centerLeft,
                    child: Container(
                //        height: 50,
                // width: 170,
                margin: const EdgeInsets.fromLTRB(12, 15, 12, 5),
                padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: _messages[index].isSent ? Colors.blue[50] :  const Color.fromARGB(255, 17, 110, 187),
                        borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(15.0),
                    topRight: Radius.circular(15.0),
                    topLeft: Radius.circular(15.0),
                    bottomLeft: Radius.circular(15.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                      ),
                      child: Text(_messages[index].text,
                        textAlign: TextAlign.center,
                  style: TextStyle(
                    color: _messages[index].isSent ? Colors.black : Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                  ),),
                      
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            
            padding: const EdgeInsets.all(8.0),
            child: Row(
                children: [
                  IconButton(icon: Icon(Icons.emoji_emotions_rounded , color: Colors.pinkAccent),
                  onPressed: (){},),
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(labelText: 'Send a message...',
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send , color: Colors.blueAccent,),
                  onPressed: () {
                    _sendMessage(_messageController.text);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
