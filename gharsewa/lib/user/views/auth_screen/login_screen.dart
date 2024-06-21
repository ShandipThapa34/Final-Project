import 'package:flutter/material.dart';
import 'package:gharsewa/user/models/user_login_model.dart';
import 'package:gharsewa/user/services/auth_service.dart';
import 'package:gharsewa/user/views/auth_screen/signup_screen.dart';
import 'package:gharsewa/user/views/common_widgets/custom_textfield.dart';
import 'package:gharsewa/user/views/common_widgets/our_button.dart';
import 'package:gharsewa/user/views/home_screen/home.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginUserScreen extends StatefulWidget {
  const LoginUserScreen({super.key});

  @override
  State<LoginUserScreen> createState() => _LoginUserScreenState();
}

class _LoginUserScreenState extends State<LoginUserScreen> {
  var emailController = TextEditingController();
  var passController = TextEditingController();
  final AuthService authService = AuthService();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            "Log In to GharSewa(Rentee)"
                .text
                .fontFamily("sans_bold")
                .size(18)
                .color(Colors.blue)
                .make(),
            15.heightBox,
            Column(
              children: [
                customTextField(
                  title: "Email",
                  hint: "example@gmail.com",
                  isPass: false,
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                ),
                customTextField(
                  title: "Password",
                  hint: "*******",
                  isPass: true,
                  controller: passController,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: "Forget Password".text.make(),
                  ),
                ),
                10.heightBox,
                _isLoading
                    ? const CircularProgressIndicator() // Show CircularProgressIndicator when loading
                    : ourButton(
                        color: Colors.blue,
                        textColor: const Color.fromRGBO(255, 255, 255, 1),
                        title: "Login",
                        onPress: () async {
                          if (emailController.text.isEmpty ||
                              passController.text.isEmpty) {
                            VxToast.show(context, msg: "Fill all the fields");
                          } else {
                            setState(() {
                              _isLoading = true;
                            });

                            final loginRequest = LoginRequest(
                              email: emailController.text,
                              password: passController.text,
                            );

                            try {
                              final response =
                                  await authService.login(loginRequest);
                              if (response.statusCode == 200) {
                                VxToast.show(context, msg: response.message);
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Home(),
                                  ),
                                );
                              } else {
                                VxToast.show(context, msg: response.message);
                              }
                            } catch (e) {
                              VxToast.show(context, msg: "Login failed: $e");
                            } finally {
                              setState(() {
                                _isLoading = false;
                              });
                            }
                          }
                        },
                      ).box.width(context.screenWidth - 50).make(),
                10.heightBox,
                "Don't have an account? Click below."
                    .text
                    .color(const Color.fromRGBO(107, 115, 119, 1))
                    .make(),
                10.heightBox,
                ourButton(
                  color: const Color.fromARGB(255, 212, 232, 240),
                  textColor: Colors.blue,
                  title: "SignUp",
                  onPress: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignupUserScreen(),
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
                .shadowSm
                .make(),
          ],
        ),
      ),
    );
  }
}
