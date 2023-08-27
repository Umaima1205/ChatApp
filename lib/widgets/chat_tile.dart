import 'package:flutter/material.dart';
import 'package:flutterapp/secondscreen.dart';

class ChatTile extends StatelessWidget {
  final String name;
  final String msg;
  final String time;
  final String img;
  
  const ChatTile({
    Key? key,
    required this.name,
    required this.msg,
    required this.time,
    required this.img,
 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 2),
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.white,
            blurRadius: 5,
          ),
        ],
      ),
      child: ListTile(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  SimpleChatApp()),
          );
        },
        tileColor: Colors.white,
        leading: CircleAvatar(
          backgroundColor: Colors.transparent,
          backgroundImage: AssetImage(img), // Fixed typo
          radius: 25,
        ),
        title: Text(name),
        subtitle: Text(msg),
        trailing: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
             
            Text(
              time,
              style: const TextStyle(fontSize: 12),
            ),
            const Icon(
              Icons.circle_notifications_rounded,
              color:Color.fromARGB(255, 17, 110, 187),
              size: 20,
            ),

            const SizedBox(width: 10), // Add some spacing
           
          ],
        ),
      ),
    );
  }
}
