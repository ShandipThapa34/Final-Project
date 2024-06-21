import 'package:flutter/material.dart';
import 'package:gharsewa/user/services/auth_service.dart';
import 'package:gharsewa/user/views/auth_screen/login_screen.dart';
import 'package:gharsewa/user/views/bookmark_screen/bookmark_screen.dart';
import 'package:gharsewa/user/views/message_screen/message_screen.dart';
import 'package:gharsewa/user/views/profile_screen/edit_password_screen.dart';
import 'package:gharsewa/user/views/profile_screen/edit_profile_screen.dart';
import 'package:velocity_x/velocity_x.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final profileButtonsList = [
    "Personal Information",
    "Change Password",
    "Bookmarks",
    "Messages",
  ];

  final profileButtonsIcon = [
    "assets/icons/profile.png",
    "assets/icons/lock.png",
    "assets/icons/bookmark.png",
    "assets/icons/message.png",
  ];

  final AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(239, 239, 239, 1),
      appBar: AppBar(
        title: "Account"
            .text
            .color(Colors.white)
            .fontFamily("sans_semibold")
            .make(),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              //user details section
              10.heightBox,
              Row(
                children: [
                  10.widthBox,
                  Image.asset(
                    "assets/icons/profileic.png",
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ).box.roundedFull.clip(Clip.antiAlias).make(),
                  10.widthBox,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        "Ram Bahadur"
                            .text
                            .fontFamily("sans_semibold")
                            .size(16)
                            .make(),
                        "rambahadur@gmail.com".text.make(),
                      ],
                    ),
                  ),
                ],
              )
                  .box
                  .white
                  .padding(const EdgeInsets.all(8))
                  .margin(const EdgeInsets.only(left: 8, right: 8))
                  .shadowXs
                  .rounded
                  .make(),
              20.heightBox,

              //buttons section
              ListView.separated(
                shrinkWrap: true,
                separatorBuilder: (context, index) {
                  return const Divider(
                    color: Color.fromRGBO(239, 239, 239, 1),
                  );
                },
                itemCount: profileButtonsList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      switch (index) {
                        case 0:
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const EditProfileScreen(),
                            ),
                          );
                          break;
                        case 1:
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const EditPasswordScreen(),
                            ),
                          );
                        case 2:
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const BookmarkScreen(),
                            ),
                          );
                          break;
                        case 3:
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MessageScreen(),
                            ),
                          );
                          break;
                      }
                    },
                    leading: Image.asset(
                      profileButtonsIcon[index],
                      width: 22,
                      color: Colors.blue,
                    ),
                    title: profileButtonsList[index]
                        .text
                        .fontFamily("sans_semibold")
                        .color(Colors.black)
                        .make(),
                  );
                },
              )
                  .box
                  .white
                  .rounded
                  .shadowSm
                  .margin(const EdgeInsets.only(left: 12, right: 12))
                  .padding(const EdgeInsets.symmetric(horizontal: 16))
                  .make(),
              10.heightBox,
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(
                        vertical: 12.0, horizontal: 24.0),
                  ),
                  onPressed: () {
                    authService.logout();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginUserScreen()));
                  },
                  child: "Log Out"
                      .text
                      .size(16)
                      .color(Colors.white)
                      .fontFamily("sans_semibold")
                      .make(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
