import 'package:chat_app_flutter2022/model/user.dart';
import 'package:chat_app_flutter2022/screen/select_contact.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key key, this.user}) : super(key: key);

  final List<UserData> user;

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xFF5A2E02),
          child: const Icon(Icons.chat),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SelectContact()));
          },
        ),
        // body: ListView.builder(
        //   itemCount: widget.user.length,
        //   itemBuilder: (context, index) => CustomCard(
        //     user: widget.user,
        //   ),
        // ),
      ),
    );
  }
}
