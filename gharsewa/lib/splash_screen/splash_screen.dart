import 'package:flutter/material.dart';
import 'package:gharsewa/owner/views/home_screen/owner_home.dart';
import 'package:gharsewa/user/views/home_screen/home.dart';
import 'package:gharsewa/user_selection/user_selection_screen.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isUserLoggedIn = prefs.getBool('isUserLoggedIn') ?? false;
    bool isOwnerLoggedIn = prefs.getBool('isOwnerLoggedIn') ?? false;

    // Log the login status to see what value we're getting
    print('isUserLoggedIn: $isUserLoggedIn');

    if (isUserLoggedIn == true && isOwnerLoggedIn == false) {
      // Navigate to Home screen
      Future.delayed(
        const Duration(seconds: 2),
        () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const Home(),
            ),
          );
        },
      );
    } else if (isUserLoggedIn == false && isOwnerLoggedIn == true) {
      // Navigate to Home screen
      Future.delayed(
        const Duration(seconds: 2),
        () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const HomeOwner(),
            ),
          );
        },
      );
    } else {
      // Navigate to User Selection screen
      Future.delayed(
        const Duration(seconds: 2),
        () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const UserSelectionScreen(),
            ),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.center,
              child: Image.asset(
                "assets/icons/home.png",
                width: 30,
                color: Colors.white,
              ),
            ),
            10.heightBox,
            "Ghar Sewa".text.fontFamily("sans_bold").white.size(20).make(),
            10.heightBox,
            "Version 1.0.0".text.white.size(15).make(),
          ],
        ),
      ),
    );
  }
}
