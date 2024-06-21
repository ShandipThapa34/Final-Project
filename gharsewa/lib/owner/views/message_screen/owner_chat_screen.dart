import 'package:flutter/material.dart';
import 'package:gharsewa/owner/views/message_screen/components/owner_chat_bubble.dart';
import 'package:gharsewa/owner/views/widgets/text_style.dart';
import 'package:velocity_x/velocity_x.dart';

class OwnerChatScreen extends StatelessWidget {
  const OwnerChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var msgController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: boldText(text: "Hari Thapa", size: 16.0, color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: ownerChatBubble(),
                  )
                ],
              ),
            ),
            10.heightBox,
            SizedBox(
              height: 80,
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: msgController,
                      decoration: const InputDecoration(
                        isDense: true,
                        hintText: "Enter your message",
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue)),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.send,
                      color: Colors.blue,
                    ),
                  )
                ],
              ).box.padding(const EdgeInsets.all(12)).make(),
            )
          ],
        ),
      ),
    );
  }
}
