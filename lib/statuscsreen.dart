import 'package:flutter/material.dart';
import 'package:flutterapp/chat_list_view.dart';
import 'package:flutterapp/callscreen.dart';

class StatusPage extends StatefulWidget {
  @override
  _StatusPageState createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage> {
  List<Status> statuses = [
    Status(
      username: "Atika Cousin",
      time: "2 hours ago",
      text: "Feeling happy today!",
      avatar: 'assests/images/women.png',
      isUserStatus: false,
    ),
    Status(
      username: "Fabeeha Coaching",
      time: "5 hours ago",
      text: "Exploring new places.",
      avatar: 'assests/images/picture.png',
      isUserStatus: false,
    ),
    Status(
      username: "Faiqa",
      time: "10 hours ago",
      text: "Coding all day long!",
      avatar: 'assests/images/img.png',
      isUserStatus: false,
    ),
  ];
String newStatus = '';

 TextEditingController _statusController = TextEditingController(); // Add this

  @override
  void dispose() {
    _statusController.dispose(); // Dispose the controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
              radius: 25.0,
              child: Image(
                height: 40.0,
                width: 40.0,
                image: AssetImage(
                  "assests/images/dp.png",
                ),
                fit: BoxFit.cover,
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
                        MaterialPageRoute(builder: (context) => ChatListView()),
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
                        MaterialPageRoute(builder: (context) => StatusPage()),
                      );
                    },
                    child: const Text(
                      "Status",
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
                        MaterialPageRoute(builder: (context) => CallLogPage()),
                      );
                    },
                    child: const Text(
                      "Calls",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ],
              ),
            ),
           Container(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    radius: 30,
                      backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage('assests/images/dp.png'),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: TextField(
                      controller: _statusController,
                      decoration: const InputDecoration(
                        hintText: "What's on your mind?",
                      ),
                      onChanged: (value) {
                        setState(() {
                          newStatus = value;
                        });
                      },
                      onSubmitted: (text) {
                        setState(() {
                          statuses.insert(
                            0,
                            Status(
                              username: "You",
                              time: "Just now",
                              text: text,
                              
                              avatar: 'assests/images/dp.png',
                              isUserStatus: true,
                            ),
                          );
                          newStatus = '';
                          _statusController.clear(); // Clear the text input
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            const Divider(),
            Expanded(
              child: ListView(
                children: [
                  _buildStatusSection('Your Status', statuses.where((status) => status.isUserStatus).toList()),
                  _buildStatusSection('Other Status', statuses.where((status) => !status.isUserStatus).toList()),
                ],
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
    MaterialPageRoute(builder: (context) =>  StatusPage()),
  );},
          icon: const Icon(Icons.add_box_rounded),
          iconSize: 25.0,
          color: Colors.amberAccent,
        ),
      ),

      ),
    );
  }

  Widget _buildStatusSection(String title, List<Status> statusList) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: statusList.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: CircleAvatar(
                radius: 20,
                backgroundColor: Colors.transparent,
                backgroundImage: AssetImage(statusList[index].avatar),
              ),
              title: Text(statusList[index].text),
              subtitle: Text(
                "${statusList[index].username} · ${statusList[index].time}",
              ),
              trailing: statusList[index].isUserStatus
                  ? Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        IconButton(
                          icon: const Icon(Icons.edit,color: Colors.blueAccent,),
                          onPressed: () {
                            _editStatus(index);
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete,color: Colors.blueAccent,),
                          onPressed: () {
                            _deleteStatus(index);
                          },
                        ),
                      ],
                    )
                  : null,
            );
          },
        ),
        const Divider(),
      ],
    );
  }

  void _editStatus(int index) {
    String updatedStatus = statuses[index].text;
    TextEditingController controller = TextEditingController(text: updatedStatus);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Edit Status'),
          content: TextField(
            controller: controller,
            onChanged: (value) {
              updatedStatus = value;
            },
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Save'),
              onPressed: () {
                setState(() {
                  statuses[index] = Status(
                    username: statuses[index].username,
                    time: statuses[index].time,
                    text: updatedStatus,
                    avatar: statuses[index].avatar,
                    isUserStatus: statuses[index].isUserStatus,
                  );
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _deleteStatus(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Status'),
          content: const Text('Are you sure you want to delete this status?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Delete'),
              onPressed: () {
                setState(() {
                  statuses.removeAt(index);
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

class Status {
  final String username;
  final String time;
  final String text;
  final String avatar;
  final bool isUserStatus;

  Status({
    required this.username,
    required this.time,
    required this.text,
    required this.avatar,
    required this.isUserStatus,
  });
}
