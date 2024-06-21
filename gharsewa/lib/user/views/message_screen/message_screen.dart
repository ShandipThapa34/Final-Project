import 'package:flutter/material.dart';
import 'package:gharsewa/user/views/message_screen/chat_screen.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:intl/intl.dart' as intl;

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: "My Messages"
            .text
            .color(Colors.white)
            .fontFamily("sans_semibold")
            .make(),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: List.generate(
              3,
              (index) {
                var t = DateTime.now();
                var time = intl.DateFormat("h:ma").format(t);

                return Card(
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ChatScreen(),
                        ),
                      );
                    },
                    leading: const CircleAvatar(
                      backgroundColor: Colors.blue,
                      child: Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                    ),
                    title: "Shyam Gurung"
                        .text
                        .fontFamily("sans_semibold")
                        .color(Colors.black)
                        .make(),
                    subtitle: "hello gharbeti".text.make(),
                    trailing: time.text.color(Colors.black).make(),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
