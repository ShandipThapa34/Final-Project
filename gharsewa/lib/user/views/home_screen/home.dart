import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gharsewa/user/views/home_screen/home_screen.dart';
import 'package:gharsewa/user/views/bookmark_screen/bookmark_screen.dart';
import 'package:gharsewa/user/views/message_screen/message_screen.dart';
import 'package:gharsewa/user/views/profile_screen/profile_screen.dart';
import 'package:gharsewa/user/views/common_widgets/exit_dialog.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var currentNavIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    var navBarItem = [
      BottomNavigationBarItem(
        icon: Obx(
          () => Image.asset(
            "assets/icons/home.png",
            width: 26,
            color: currentNavIndex == 0.obs ? Colors.blue : Colors.black,
          ),
        ),
        label: "Home",
      ),
      BottomNavigationBarItem(
        icon: Obx(
          () => Image.asset(
            "assets/icons/bookmark.png",
            width: 26,
            color: currentNavIndex == 1.obs ? Colors.blue : Colors.black,
          ),
        ),
        label: "Bookmark",
      ),
      BottomNavigationBarItem(
        icon: Badge(
          label: const Text("0"),
          isLabelVisible: true,
          smallSize: 12,
          textColor: Colors.white,
          child: Obx(
            () => Image.asset(
              "assets/icons/message.png",
              width: 26,
              color: currentNavIndex == 2.obs ? Colors.blue : Colors.black,
            ),
          ),
        ),
        label: "Messages",
      ),
      BottomNavigationBarItem(
        icon: Obx(
          () => Image.asset(
            "assets/icons/user.png",
            width: 26,
            color: currentNavIndex == 3.obs ? Colors.blue : Colors.black,
          ),
        ),
        label: "Account",
      ),
    ];

    var navBody = const [
      HomeScreen(),
      BookmarkScreen(),
      MessageScreen(),
      ProfileScreen(),
    ];

    return PopScope(
      canPop: false,
      onPopInvoked: (canPop) {
        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) => exitDialog(context),
        );
      },
      child: Scaffold(
        body: Column(
          children: [
            Obx(
              () => Expanded(
                child: navBody.elementAt(currentNavIndex.value),
              ),
            ),
          ],
        ),
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            currentIndex: currentNavIndex.value,
            selectedItemColor: Colors.blue,
            selectedIconTheme: const IconThemeData(color: Colors.blue),
            selectedLabelStyle: const TextStyle(
              fontFamily: "san_bold",
            ),
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            items: navBarItem,
            onTap: (value) {
              currentNavIndex.value = value;
            },
          ),
        ),
      ),
    );
  }
}
