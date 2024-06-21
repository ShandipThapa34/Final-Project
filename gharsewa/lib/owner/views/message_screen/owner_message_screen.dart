import "package:flutter/material.dart";
import "package:gharsewa/owner/views/message_screen/owner_chat_screen.dart";
import "package:gharsewa/owner/views/widgets/text_style.dart";
import 'package:intl/intl.dart' as intl;

class OwnerMessageScreen extends StatelessWidget {
  const OwnerMessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: boldText(text: "Messages", size: 16.0, color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: List.generate(
              2,
              (index) {
                var t = DateTime.now();
                var time = intl.DateFormat("h:ma").format(t);

                return Card(
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const OwnerChatScreen(),
                        ),
                      );
                      // Get.to(() => const ChatScreen(), arguments: [
                      //   data[index]['sender_name'],
                      //   data[index]['fromId'],
                      // ]);
                    },
                    leading: const CircleAvatar(
                      backgroundColor: Colors.blue,
                      child: Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                    ),
                    title: boldText(
                      text: "Hari Thapa",
                      color: const Color.fromRGBO(73, 73, 73, 1),
                    ),
                    subtitle: normalText(
                      text: "hello can we talk",
                      color: const Color.fromRGBO(112, 112, 112, 1),
                    ),
                    trailing: normalText(
                      text: time,
                      color: const Color.fromRGBO(112, 112, 112, 1),
                    ),
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
