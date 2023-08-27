import 'package:flutter/material.dart';
import 'package:flutterapp/secondscreen.dart';
import 'package:flutterapp/widgets/chat_tile.dart';
import 'package:flutterapp/statuscsreen.dart';

class ChatListView extends StatelessWidget {
  const ChatListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 17, 110, 187),
        title: const Text(
          "Chattie",
          style: TextStyle(
            fontSize: 18,
            letterSpacing: 2,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        centerTitle: true, // Aligns the title text to the center
        toolbarHeight: 70,
        elevation: 0,
        leading: Container(
          margin:
              const EdgeInsets.only(left: 12.0), // Adjust the margin as needed
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
        actions: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 18.0),
            child: const Icon(
              Icons.camera_alt_sharp,
              size: 25.0,
              color: Colors.pinkAccent,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 18.0),
            child: const Icon(
              Icons.search_rounded,
              size: 25.0,
              color: Colors.cyanAccent,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 50,
            color: const Color.fromARGB(255, 17, 110, 187),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              SimpleChatApp()), // Replace with your status screen widget
                    );
                  },
                  child: const Text(
                    "Chats",
                    style: TextStyle(
                      color: Colors.amberAccent,
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                 GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              StatusPage()), // Replace with your status screen widget
                    );
                  },
                  child: const Text(
                    "Status",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                const Text(
                  "Calls",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
          const Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ChatTile(
                      name: "Fabeeha College", msg: "Okay", time: "4:00PM",img: "assests/images/picture.png"),
                  ChatTile(
                      name: "Atika Cousin", msg: "Alright!", time: "2:00PM" , img: "assests/images/women.png"),
                  ChatTile(
                      name: "Ayesha Coaching", msg: "How are You?", time: "3:00PM" ,img:"assests/images/avatar.png"),
                  ChatTile(name: "Faiqa", msg: "Okay♥ ", time: "6:00PM" , img:"assests/images/img.png"),
                  ChatTile(
                      name: "College Group",
                      msg: "~ Sent A Photo",
                      time: "9:00PM" , img: "assests/images/girl.png"),
                   ChatTile(
                      name: "Fabeeha College", msg: "Okay", time: "4:00PM",img: "assests/images/picture.png"),
                  ChatTile(
                      name: "Atika Cousin", msg: "Alright!", time: "2:00PM" , img: "assests/images/women.png"),
                  ChatTile(
                      name: "Ayesha Coaching", msg: "How are You?", time: "3:00PM" ,img:"assests/images/avatar.png"),
                  ChatTile(name: "Faiqa", msg: "Okay♥ ", time: "6:00PM" , img:"assests/images/img.png"),
                  ChatTile(
                      name: "College Group",
                      msg: "~ Sent A Photo",
                      time: "9:00PM" , img: "assests/images/girl.png"),
                   ChatTile(
                      name: "Fabeeha College", msg: "Okay", time: "4:00PM",img: "assests/images/picture.png"),
                  ChatTile(
                      name: "Atika Cousin", msg: "Alright!", time: "2:00PM" , img: "assests/images/women.png"),
                  ChatTile(
                      name: "Ayesha Coaching", msg: "How are You?", time: "3:00PM" ,img:"assests/images/avatar.png"),
                  ChatTile(name: "Faiqa", msg: "Okay♥ ", time: "6:00PM" , img:"assests/images/img.png"),
                  ChatTile(
                      name: "College Group",
                      msg: "~ Sent A Photo",
                      time: "9:00PM" , img: "assests/images/girl.png"),
                   

                 
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Container(
        width: 60,
        height: 60,
        margin: const EdgeInsets.only(right: 10, bottom: 10),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 17, 110, 187),
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 12,
              offset: const Offset(0, -1),
            ),
          ],
        ),
        child: IconButton(
          onPressed: (){ Navigator.push(
    context,
    MaterialPageRoute(builder: (context) =>  SimpleChatApp()),
  );},
          icon: const Icon(Icons.add_box_rounded),
          iconSize: 25.0,
          color: Colors.amberAccent,
        ),
      ),
    );
  }
}
