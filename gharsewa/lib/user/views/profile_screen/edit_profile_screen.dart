import 'package:flutter/material.dart';
import 'package:gharsewa/user/views/common_widgets/custom_textfield.dart';
import 'package:gharsewa/user/views/common_widgets/our_button.dart';
import 'package:velocity_x/velocity_x.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var nameController = TextEditingController();
    var phoneController = TextEditingController();
    var addressController = TextEditingController();

    return Scaffold(
      backgroundColor: const Color.fromRGBO(239, 239, 239, 1),
      appBar: AppBar(
        title: "Edit Profile".text.fontFamily("sans_semibold").white.make(),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              "assets/icons/profileic.png",
              width: 100,
              fit: BoxFit.cover,
            ).box.roundedFull.clip(Clip.antiAlias).make(),
            10.widthBox,
            10.heightBox,
            ourButton(
                color: Colors.blue,
                onPress: () {},
                textColor: Colors.white,
                title: "Change"),
            const Divider(),
            20.heightBox,
            customTextField(
              controller: nameController,
              title: "Full Name",
              hint: "Hari Pun",
              isPass: false,
            ),
            customTextField(
              controller: phoneController,
              title: "Phone Number",
              hint: "9800000000",
              isPass: false,
            ),
            customTextField(
              controller: addressController,
              title: "Address",
              hint: "Pokhara, Ranipauwa",
              isPass: true,
            ),
            20.heightBox,
            SizedBox(
              width: context.screenWidth - 60,
              child: ourButton(
                  color: Colors.blue,
                  onPress: () async {},
                  textColor: Colors.white,
                  title: "Save"),
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
