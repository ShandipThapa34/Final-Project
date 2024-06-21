import 'package:flutter/material.dart';
import 'package:gharsewa/owner/views/auth_screen/login_screen.dart';
import 'package:gharsewa/user/views/auth_screen/login_screen.dart';
import 'package:gharsewa/user/views/common_widgets/our_button.dart';
import 'package:velocity_x/velocity_x.dart';

class UserSelectionScreen extends StatefulWidget {
  const UserSelectionScreen({super.key});

  @override
  State<UserSelectionScreen> createState() => _UserSelectionScreenState();
}

class _UserSelectionScreenState extends State<UserSelectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                "Are you a:"
                    .text
                    .fontFamily("sans_bold")
                    .size(20)
                    .color(Colors.blue)
                    .make(),
                15.heightBox,
                ourButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  title: "Rentee",
                  onPress: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginUserScreen(),
                      ),
                    );
                  },
                ).box.width(context.screenWidth - 50).make(),
                10.heightBox,
                "or"
                    .text
                    .fontFamily("sans_bold")
                    .size(18)
                    .color(Colors.blue)
                    .make(),
                10.heightBox,
                ourButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  title: "Renter",
                  onPress: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginOwnerScreen(),
                      ),
                    );
                  },
                ).box.width(context.screenWidth - 50).make(),
              ],
            )
                .box
                .white
                .rounded
                .padding(const EdgeInsets.all(16))
                .width(context.screenWidth - 70)
                .shadowMd
                .make(),
          ],
        ),
      ),
    );
  }
}
