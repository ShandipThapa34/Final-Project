import 'dart:io';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/material.dart';
import 'package:gharsewa/owner/models/property_model.dart';
import 'package:gharsewa/owner/services/property_services.dart';
import 'package:gharsewa/owner/views/widgets/text_style.dart';
import 'package:gharsewa/user/views/common_widgets/custom_textfield.dart';
import 'package:gharsewa/constant/colors.dart';
import 'package:gharsewa/constant/constant.dart';
import 'package:image_picker/image_picker.dart';
import 'package:velocity_x/velocity_x.dart';

class AddProperty extends StatefulWidget {
  const AddProperty({super.key});

  @override
  State<AddProperty> createState() => _AddPropertyState();
}

class _AddPropertyState extends State<AddProperty> {
  //text controller
  var pAddressController = TextEditingController();
  var pDescController = TextEditingController();
  var pPriceController = TextEditingController();
  var pRoomController = TextEditingController();
  var maxOccupancyController = TextEditingController();
  String? propertyType;
  String? propertyFor;

  // Cloudinary configuration
  final cloudinary = CloudinaryPublic('duxgyka18', 'tgiikg5i');

  List<File> selectedImages = [];
  PropertyService propertyService = PropertyService();

  bool isLoading = false;

  Future<void> uploadImagesToCloudinaryAndSaveRoom() async {
    setState(() {
      isLoading = true;
    });

    try {
      List<String> imageUrls = [];
      for (var imageFile in selectedImages) {
        var response = await cloudinary.uploadFile(
          CloudinaryFile.fromFile(imageFile.path),
        );

        // add url from cloudinary to imageUrls
        imageUrls.add(response.secureUrl);
      }
      // Collect form data
      String address = pAddressController.text;
      String description = pDescController.text;
      String price = pPriceController.text;
      String roomNumber = pRoomController.text;
      String roomType = propertyType ?? '';
      String maxOccupancy = maxOccupancyController.text;
      //String propertyFor = propertyFor ?? '';

      // Create RoomRequest object
      RoomRequest roomRequest = RoomRequest(
        roomNumber: roomNumber,
        roomType: roomType,
        price: price,
        description: description,
        availability: true,
        maxOccupancy: maxOccupancy,
        images: imageUrls,
        amenities: {
          "Wifi": true,
          "Parking": false,
        },
        address: address,
      );

      // Call createRoom function
      await propertyService.createRoom(roomRequest);
    } catch (e) {
      print('Error uploading images: $e');
    } finally {
      setState(() {
        isLoading = false;
      });
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 245, 244, 243),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: boldText(text: "Add Property", color: Colors.white, size: 16.0),
        actions: [
          isLoading
              ? const CircularProgressIndicator(color: Colors.white)
              : TextButton(
                  onPressed: () async {
                    await uploadImagesToCloudinaryAndSaveRoom();
                  },
                  child:
                      boldText(text: "Save", size: 16.0, color: Colors.white),
                )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              10.heightBox,
              customTextField(
                title: "Property Address",
                hint: "Room for student",
                isPass: false,
                controller: pAddressController,
              ),
              10.heightBox,
              customTextField(
                title: "Property Description",
                hint: "Room for student",
                isPass: false,
                controller: pDescController,
              ),
              10.heightBox,
              customTextField(
                title: "Price Per Month",
                hint: "3000",
                isPass: false,
                controller: pPriceController,
                keyboardType: TextInputType.number,
              ),
              10.heightBox,
              "Property Type"
                  .text
                  .color(Colors.blue)
                  .fontFamily("sans_semibold")
                  .size(16)
                  .make(),
              DropdownButtonFormField<String>(
                iconEnabledColor: Colors.blue,
                value: propertyType,
                validator: (value) {
                  if (value.isEmptyOrNull) {
                    return emptyFieldErrMessage;
                  } else {
                    return null;
                  }
                },
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    errorStyle: TextStyle(color: Colors.blue)),
                hint: normalText(text: "Room", color: fontGrey),
                isExpanded: true,
                items: propertiesType
                    .map((propertytype) => DropdownMenuItem<String>(
                          value: propertytype,
                          child: Text(propertytype),
                        ))
                    .toList(),
                onChanged: (value) {
                  propertyType = value;
                },
              )
                  .box
                  .roundedSM
                  .padding(const EdgeInsets.symmetric(horizontal: 4))
                  .color(textfieldGrey)
                  .make(),
              15.heightBox,
              customTextField(
                title: "Number of Rooms",
                hint: "2",
                isPass: false,
                controller: pRoomController,
                keyboardType: TextInputType.number,
              ),
              10.heightBox,
              customTextField(
                title: "Max Occupancy",
                hint: "2",
                isPass: false,
                controller: maxOccupancyController,
                keyboardType: TextInputType.number,
              ),
              10.heightBox,
              // "Property For"
              //     .text
              //     .color(Colors.blue)
              //     .fontFamily("sans_semibold")
              //     .size(16)
              //     .make(),
              // DropdownButtonFormField<String>(
              //   iconEnabledColor: Colors.blue,
              //   value: propertyFor,
              //   validator: (value) {
              //     if (value.isEmptyOrNull) {
              //       return emptyFieldErrMessage;
              //     } else {
              //       return null;
              //     }
              //   },
              //   decoration: const InputDecoration(
              //       border: InputBorder.none,
              //       errorStyle: TextStyle(color: Colors.blue)),
              //   hint: normalText(text: "Student", color: fontGrey),
              //   isExpanded: true,
              //   items: propertiesFor
              //       .map((propertyfor) => DropdownMenuItem<String>(
              //             value: propertyfor,
              //             child: Text(propertyfor),
              //           ))
              //       .toList(),
              //   onChanged: (value) {
              //     propertyFor = value;
              //   },
              // )
              //     .box
              //     .roundedSM
              //     .padding(const EdgeInsets.symmetric(horizontal: 4))
              //     .color(textfieldGrey)
              //     .make(),
              15.heightBox,

              const Divider(),
              boldText(
                text: "Choose Property Images:",
                color: const Color.fromRGBO(73, 73, 73, 1),
              ),
              10.heightBox,
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  // Display selected images
                  ...selectedImages.map(
                    (image) => Stack(
                      children: [
                        Image.file(image,
                            width: 100, height: 100, fit: BoxFit.cover),
                        Positioned(
                          top: 0,
                          right: 0,
                          child: IconButton(
                            icon: Icon(Icons.remove_circle),
                            onPressed: () {
                              setState(() {
                                selectedImages.remove(image);
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Button to add more images
                  IconButton(
                    icon: Icon(Icons.add_a_photo),
                    onPressed: () async {
                      // Implement image selection logic
                      // For example, using image_picker package
                      final imagePicker = ImagePicker();
                      final pickedFile = await imagePicker.pickImage(
                          source: ImageSource.gallery);
                      if (pickedFile != null) {
                        setState(() {
                          selectedImages.add(File(pickedFile.path));
                        });
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
