import 'package:flutter/material.dart';
import 'package:gharsewa/owner/services/owner_service.dart';
import 'package:gharsewa/owner/views/widgets/text_style.dart';
import 'package:velocity_x/velocity_x.dart';

class EditOwnerProfileScreen extends StatefulWidget {
  const EditOwnerProfileScreen({super.key});

  @override
  State<EditOwnerProfileScreen> createState() => _EditOwnerProfileScreenState();
}

class _EditOwnerProfileScreenState extends State<EditOwnerProfileScreen> {
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var addressController = TextEditingController();
  var phoneController = TextEditingController();
  OwnerService ownerService = OwnerService();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchUserDetails();
  }

  Future<void> fetchUserDetails() async {
    try {
      final userDetails = await ownerService.getUserDetails();
      setState(() {
        nameController.text = userDetails['userName'] ?? '';
        emailController.text = userDetails['email'] ?? '';
        addressController.text = userDetails['address'] ?? '';
        phoneController.text = userDetails['phoneNumber'] ?? '';
      });
    } catch (e) {
      print('Error fetching user details: $e');
      // Handle error gracefully
    }
  }

  Future<void> saveUserDetails() async {
    setState(() {
      isLoading = true;
    });

    try {
      final userId = await ownerService.getUserId();
      if (userId == null) {
        throw Exception('User ID not found');
      }

      final updatedData = {
        'userName': nameController.text,
        'email': emailController.text,
        'address': addressController.text,
        'phoneNumber': phoneController.text,
      };

      await ownerService.updateUserDetails(userId, updatedData);
      VxToast.show(context, msg: "User details updated successfully");

      Navigator.pop(context); // Pop the screen upon successful update
    } catch (e) {
      print('Error updating user details: $e');
      // Handle error gracefully
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: boldText(
          text: "Edit Profile",
          color: Colors.white,
          size: 16.0,
        ),
        actions: [
          TextButton(
            onPressed: isLoading ? null : saveUserDetails,
            child: isLoading
                ? const CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  )
                : normalText(
                    text: "Save",
                    color: Colors.white,
                  ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Image.asset(
              "assets/icons/profileic.png",
              width: 100,
              height: 100,
              fit: BoxFit.fitHeight,
            ).box.roundedFull.clip(Clip.antiAlias).make(),
            10.heightBox,
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              onPressed: () {},
              child: normalText(text: "Change Image"),
            ),
            10.heightBox,
            const Divider(),
            10.heightBox,
            TextFormField(
              decoration: const InputDecoration(
                labelText: "Username",
                hintText: "eg. Rajesh Hamal",
                labelStyle: TextStyle(color: Colors.blue),
                focusedBorder: OutlineInputBorder(),
                border: OutlineInputBorder(),
              ),
              controller: nameController,
            ),
            10.heightBox,
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: "Email",
                hintText: "eg. user@gmail.com",
                labelStyle: TextStyle(color: Colors.blue),
                focusedBorder: OutlineInputBorder(),
                border: OutlineInputBorder(),
              ),
              controller: emailController,
            ),
            10.heightBox,
            TextFormField(
              decoration: const InputDecoration(
                labelText: "Address",
                hintText: "eg. Pokhara, Newroad",
                labelStyle: TextStyle(color: Colors.blue),
                focusedBorder: OutlineInputBorder(),
                border: OutlineInputBorder(),
              ),
              controller: addressController,
            ),
            10.heightBox,
            TextFormField(
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                labelText: "Phone Number",
                hintText: "9800000000",
                labelStyle: TextStyle(color: Colors.blue),
                focusedBorder: OutlineInputBorder(),
                border: OutlineInputBorder(),
              ),
              controller: phoneController,
            ),
            20.heightBox,
          ],
        ),
      ),
    );
  }
}
