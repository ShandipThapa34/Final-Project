import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gharsewa/owner/views/booking_screen/booking_screen.dart';
import 'package:gharsewa/owner/views/home_screen/dashboard_screen.dart';
import 'package:gharsewa/owner/views/setting_screen/setting_screen.dart';
import 'package:gharsewa/owner/views/property_screen/property_screen.dart';
import 'package:gharsewa/user/views/common_widgets/exit_dialog.dart';

class HomeOwner extends StatefulWidget {
  const HomeOwner({super.key});

  @override
  State<HomeOwner> createState() => _HomeOwnerState();
}

class _HomeOwnerState extends State<HomeOwner> {
  var navIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    var navScreens = const [
      DashboardScreen(),
      PropertyScreen(),
      BookingScreen(),
      SettingScreen(),
    ];

    var bottomNavBar = [
      BottomNavigationBarItem(
        icon: Obx(
          () => Image.asset(
            "assets/icons/dashboard.png",
            width: 25,
            color: navIndex == 0.obs ? Colors.blue : Colors.black,
          ),
        ),
        label: "Dashboard",
      ),
      BottomNavigationBarItem(
        icon: Obx(
          () => Image.asset(
            "assets/icons/home.png",
            width: 25,
            color: navIndex == 1.obs ? Colors.blue : Colors.black,
          ),
        ),
        label: "Property",
      ),
      BottomNavigationBarItem(
        icon: Obx(
          () => Badge(
            label: const Text("2"),
            isLabelVisible: true,
            smallSize: 12,
            child: Image.asset(
              "assets/icons/booking.png",
              color: navIndex == 2.obs ? Colors.blue : Colors.black,
              width: 25,
            ),
          ),
        ),
        label: "Booking",
      ),
      BottomNavigationBarItem(
        icon: Obx(
          () => Image.asset(
            "assets/icons/settings.png",
            width: 25,
            color: navIndex == 3.obs ? Colors.blue : Colors.black,
          ),
        ),
        label: "Settings",
      ),
    ];
    return PopScope(
      canPop: false,
      onPopInvoked: (canPop) {
        showDialog(
          context: context,
          builder: (context) => exitDialog(context),
        );
      },
      child: Obx(
        () => Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: navIndex.value,
            onTap: (index) {
              navIndex.value = index;
            },
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.black,
            items: bottomNavBar,
          ),
          body: Column(
            children: [
              Expanded(
                child: navScreens.elementAt(navIndex.value),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
