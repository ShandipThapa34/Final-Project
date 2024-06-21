import 'package:flutter/material.dart';
import 'package:gharsewa/owner/views/widgets/text_style.dart';
import 'package:velocity_x/velocity_x.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  var oldpassController = TextEditingController();
  var newpassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: boldText(
          text: "Change Password",
          color: Colors.white,
          size: 16.0,
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            10.heightBox,
            TextFormField(
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "Old Password",
                hintText: "******",
                labelStyle: TextStyle(color: Colors.blue),
                focusedBorder: OutlineInputBorder(),
                border: OutlineInputBorder(),
              ),
              controller: oldpassController,
            ),
            10.heightBox,
            TextFormField(
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "New Password",
                hintText: "******",
                labelStyle: TextStyle(color: Colors.blue),
                focusedBorder: OutlineInputBorder(),
                border: OutlineInputBorder(),
              ),
              controller: newpassController,
            ),
            20.heightBox,
            OutlinedButton(
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.blue),
              ),
              onPressed: () {},
              child: const Text(
                "Save",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
