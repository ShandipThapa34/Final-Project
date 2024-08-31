import 'package:flutter/material.dart';
import 'package:gharsewa/owner/models/register_model.dart';
import 'package:gharsewa/owner/services/owner_auth_service.dart';
import 'package:gharsewa/owner/views/auth_screen/owner_login_screen.dart';
import 'package:gharsewa/user/views/common_widgets/custom_textfield.dart';
import 'package:gharsewa/user/views/common_widgets/our_button.dart';
import 'package:velocity_x/velocity_x.dart';

class SignupOwnerScreen extends StatefulWidget {
  const SignupOwnerScreen({super.key});

  @override
  State<SignupOwnerScreen> createState() => _SignupOwnerScreenState();
}

class _SignupOwnerScreenState extends State<SignupOwnerScreen> {
  // Text controllers
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthService authService = AuthService();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            "Join the GharSewa(Renter)"
                .text
                .fontFamily("sans_bold")
                .size(18)
                .color(Colors.white)
                .make(),
            15.heightBox,
            Column(
              children: [
                customTextField(
                  title: "User Name",
                  hint: "Ram Thapa",
                  controller: userNameController,
                  isPass: false,
                  keyboardType: TextInputType.name,
                ),
                customTextField(
                  title: "Email",
                  hint: "Ram@gmail.com",
                  controller: emailController,
                  isPass: false,
                  keyboardType: TextInputType.emailAddress,
                ),
                customTextField(
                  title: "Phone Number",
                  hint: "9800000000",
                  controller: phoneNumberController,
                  isPass: false,
                  keyboardType: TextInputType.phone,
                ),
                customTextField(
                  title: "Password",
                  hint: "******",
                  controller: passwordController,
                  isPass: true,
                ),
                10.heightBox,
                _isLoading
                    ? const CircularProgressIndicator()
                    : ourButton(
                        color: Colors.blue,
                        textColor: Colors.white,
                        title: "SignUp",
                        onPress: () async {
                          if (userNameController.text.isNotEmpty &&
                              emailController.text.isNotEmpty &&
                              phoneNumberController.text.isNotEmpty &&
                              passwordController.text.isNotEmpty) {
                            setState(() {
                              _isLoading = true;
                            });

                            final user = User(
                              userName: userNameController.text,
                              email: emailController.text,
                              phoneNumber: phoneNumberController.text,
                              password: passwordController.text,
                              role: "Renter",
                            );

                            try {
                              final response = await authService.register(user);

                              if (response.statusCode == 200) {
                                if (!mounted) return;
                                VxToast.show(context,
                                    msg: "Account Created successfully");

                                if (!mounted) return;
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const LoginOwnerScreen(),
                                  ),
                                );
                              } else {
                                if (!mounted) return;
                                VxToast.show(context, msg: response.message);
                              }
                            } catch (e) {
                              if (!mounted) return;
                              VxToast.show(context,
                                  msg: "Registration failed: $e");
                            } finally {
                              if (!mounted) return;
                              setState(() {
                                _isLoading = false;
                              });
                            }
                          } else {
                            VxToast.show(context,
                                msg: "Fill all the text fields");
                          }
                        },
                      ).box.width(context.screenWidth - 50).make(),
                10.heightBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    "Already have an Account "
                        .text
                        .color(const Color.fromRGBO(107, 115, 119, 1))
                        .make(),
                    "Login here".text.color(Colors.blue).make().onTap(
                      () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
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
