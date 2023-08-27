import 'package:flutter/material.dart';
import 'package:flutterapp/statuscsreen.dart';
import 'package:flutterapp/chat_list_view.dart';

class CallLogPage extends StatelessWidget {
  final List<CallLogEntry> callLog = [
    CallLogEntry(name: "Friend", time: "30 minutes ago", isMissed: false, imagePath: "assests/images/human.png"),
    CallLogEntry(
      name: "Faiqa",
      time: "2 hours ago",
      isMissed: true,
      imagePath: "assests/images/img.png",
    ),
    CallLogEntry(
      name: "Ayesha Coaching",
      time: "Yesterday",
      isMissed: false,
      imagePath: "assests/images/girl.png",
    ),
    // Add more call log entries
  ];

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
        centerTitle: true,
        toolbarHeight: 70,
        elevation: 0,
        leading: Container(
          margin: const EdgeInsets.only(left: 12.0),
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
                            const ChatListView(),
                      ),
                    );
                  },
                  child: const Text(
                    "Chats",
                    style: TextStyle(
                      color: Colors.white,
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
                            StatusPage(),
                      ),
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
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            CallLogPage(),
                      ),
                    );
                  },
                  child: const Text(
                    "Calls",
                    style: TextStyle(
                      color: Colors.amberAccent,
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: callLog.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage(callLog[index].imagePath),
                    // fit: BoxFit.cover,
                  ),
                  title: Text(callLog[index].name),
                  subtitle: Text(callLog[index].time),
                  trailing: callLog[index].isMissed
                      ? const Icon(Icons.call_missed_rounded, color: Colors.red)
                      : const Icon(Icons.call_received_rounded, color: Colors.green),
                  onTap: () {
                    // Handle call log entry tap
                  },
                );
              },
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
    MaterialPageRoute(builder: (context) =>  CallLogPage()),
  );},
          icon: const Icon(Icons.add_box_rounded),
          iconSize: 25.0,
          color: Colors.amberAccent,
        ),
      ),
    );
  }
}

class CallLogEntry {
  final String name;
  final String time;
  final bool isMissed;
  final String imagePath;

  CallLogEntry({
    required this.name,
    required this.time,
    required this.isMissed,
    required this.imagePath,
  });
}
