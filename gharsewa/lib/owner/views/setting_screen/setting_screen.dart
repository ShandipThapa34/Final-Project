import 'package:flutter/material.dart';
import 'package:gharsewa/owner/views/message_screen/owner_message_screen.dart';
import 'package:gharsewa/owner/views/setting_screen/change_password_screen.dart';
import 'package:gharsewa/owner/views/setting_screen/edit_owner_profile.dart';
import 'package:gharsewa/owner/views/widgets/text_style.dart';
import 'package:velocity_x/velocity_x.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const profileButtonsTitles = [
      "Edit Personal Information",
      "Change Password",
      "Messages"
    ];
    const profileButtonsIcons = [
      Icons.person,
      Icons.lock,
      Icons.chat,
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        automaticallyImplyLeading: false,
        title: boldText(
          text: "Settings",
          color: Colors.white,
          size: 16.0,
        ),
      ),
      body: Column(
        children: [
          10.heightBox,
          ListTile(
            leading: Image.asset(
              "assets/icons/profileic.png",
              width: 100,
              height: 100,
              fit: BoxFit.fitHeight,
            ).box.roundedFull.clip(Clip.antiAlias).make(),
            title: boldText(
              text: "Shyam Gurung",
              color: const Color.fromRGBO(73, 73, 73, 1),
            ),
            subtitle: normalText(
              text: "shyamgurung@gmail.com",
              color: const Color.fromRGBO(73, 73, 73, 1),
            ),
          ),
          const Divider(),
          10.heightBox,
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: List.generate(
                profileButtonsTitles.length,
                (index) => Card(
                  child: ListTile(
                    onTap: () {
                      switch (index) {
                        case 0:
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const EditOwnerProfileScreen(),
                            ),
                          );
                          break;
                        case 1:
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const ChangePasswordScreen(),
                            ),
                          );
                          break;
                        case 2:
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const OwnerMessageScreen(),
                            ),
                          );
                          break;
                      }
                    },
                    leading: Icon(
                      profileButtonsIcons[index],
                      color: Colors.blue,
                    ),
                    title: normalText(
                        text: profileButtonsTitles[index],
                        color: const Color.fromRGBO(73, 73, 73, 1)),
                  ),
                ),
              ),
            ),
          ),
          10.heightBox,
          OutlinedButton(
            style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.blue),
            ),
            onPressed: () {},
            child: const Text(
              "Log Out",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
