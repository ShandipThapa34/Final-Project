import 'package:flutter/material.dart';
import 'package:gharsewa/user/views/common_widgets/custom_textfield.dart';
import 'package:gharsewa/user/views/common_widgets/our_button.dart';
import 'package:velocity_x/velocity_x.dart';

class EditPasswordScreen extends StatelessWidget {
  const EditPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var newpassController = TextEditingController();
    var oldpassController = TextEditingController();

    return Scaffold(
      backgroundColor: const Color.fromRGBO(239, 239, 239, 1),
      appBar: AppBar(
        title: "Change Password".text.fontFamily("sans_semibold").white.make(),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            customTextField(
              controller: oldpassController,
              title: "Old Password",
              hint: "******",
              isPass: true,
            ),
            customTextField(
              controller: newpassController,
              title: "New Password",
              hint: "******",
              isPass: true,
            ),
            20.heightBox,
            SizedBox(
              width: context.screenWidth - 60,
              child: ourButton(
                  color: Colors.blue,
                  onPress: () async {},
                  textColor: Colors.white,
                  title: "Change"),
            ),
          ],
        )
            .box
            .white
            .padding(const EdgeInsets.all(16))
            .margin(const EdgeInsets.only(top: 30, left: 15, right: 15))
            .shadowSm
            .rounded
            .make(),
      ),
    );
  }
}
