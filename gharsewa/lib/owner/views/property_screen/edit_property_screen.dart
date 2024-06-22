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

class EditProperty extends StatefulWidget {
  final OwnerRoom room;
  final VoidCallback onPropertyUpdated; // Callback to refresh property list
  const EditProperty(
      {super.key, required this.room, required this.onPropertyUpdated});

  @override
  State<EditProperty> createState() => _EditPropertyState();
}

class _EditPropertyState extends State<EditProperty> {
  // Text controllers
  late TextEditingController pAddressController;
  late TextEditingController pDescController;
  late TextEditingController pPriceController;
  late TextEditingController pRoomController;
  late TextEditingController maxOccupancyController;
  String? propertyType;

  bool wifi = false;
  bool parking = false;
  bool airConditioning = false;
  bool pool = false;

  // Cloudinary configuration
  final cloudinary = CloudinaryPublic('duxgyka18', 'tgiikg5i');

  List<File> selectedImages = [];
  List<String> existingImageUrls = [];
  PropertyService propertyService = PropertyService();

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    // Initialize text controllers with existing room data
    pAddressController = TextEditingController(text: widget.room.address);
    pDescController = TextEditingController(text: widget.room.description);
    pPriceController =
        TextEditingController(text: widget.room.price.toString());
    pRoomController = TextEditingController(text: widget.room.roomNumber);
    maxOccupancyController =
        TextEditingController(text: widget.room.maxOccupancy.toString());
    propertyType = widget.room.roomType;

    wifi = widget.room.amenities["Wifi"] ?? false;
    parking = widget.room.amenities["Parking"] ?? false;
    airConditioning = widget.room.amenities["Air Conditioning"] ?? false;
    pool = widget.room.amenities["Pool"] ?? false;

    existingImageUrls = widget.room.images;
  }

  Future<void> updateRoomDetails() async {
    setState(() {
      isLoading = true;
    });

    try {
      List<String> newImageUrls = [];
      for (var imageFile in selectedImages) {
        var response = await cloudinary.uploadFile(
          CloudinaryFile.fromFile(imageFile.path),
        );
        newImageUrls.add(response.secureUrl);
      }

      String address = pAddressController.text;
      String description = pDescController.text;
      String price = pPriceController.text;
      String roomNumber = pRoomController.text;
      String roomType = propertyType ?? '';
      String maxOccupancy = maxOccupancyController.text;

      RoomRequest roomRequest = RoomRequest(
        roomNumber: roomNumber,
        roomType: roomType,
        price: price,
        description: description,
        availability: true,
        maxOccupancy: maxOccupancy,
        images: newImageUrls.isNotEmpty ? newImageUrls : widget.room.images,
        amenities: {
          "Wifi": wifi,
          "Parking": parking,
          "Air Conditioning": airConditioning,
          "Pool": pool,
        },
        address: address,
      );

      await propertyService.updateRoom(widget.room.id, roomRequest);
      widget.onPropertyUpdated(); // Notify parent to refresh property list
      VxToast.show(context, msg: "Property updated successfully");
    } catch (e) {
      print('Error updating room: $e');
      VxToast.show(context, msg: "Failed to update Property");
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
        title: boldText(text: "Edit Property", color: Colors.white, size: 16.0),
        actions: [
          isLoading
              ? const CircularProgressIndicator(color: Colors.white)
              : TextButton(
                  onPressed: () async {
                    await updateRoomDetails();
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
                hint: "Enter address",
                isPass: false,
                controller: pAddressController,
              ),
              10.heightBox,
              customTextField(
                title: "Property Description",
                hint: "Enter description",
                isPass: false,
                controller: pDescController,
              ),
              10.heightBox,
              customTextField(
                title: "Price Per Month",
                hint: "Enter price",
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
                  if (value == null || value.isEmpty) {
                    return emptyFieldErrMessage;
                  }
                  return null;
                },
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    errorStyle: TextStyle(color: Colors.blue)),
                hint: normalText(text: "Select type", color: fontGrey),
                isExpanded: true,
                items: propertiesType
                    .map((propertytype) => DropdownMenuItem<String>(
                          value: propertytype,
                          child: Text(propertytype),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    propertyType = value;
                  });
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
                hint: "Enter number of rooms",
                isPass: false,
                controller: pRoomController,
                keyboardType: TextInputType.number,
              ),
              10.heightBox,
              customTextField(
                title: "Max Occupancy",
                hint: "Enter max occupancy",
                isPass: false,
                controller: maxOccupancyController,
                keyboardType: TextInputType.number,
              ),
              15.heightBox,
              const Divider(),
              boldText(
                text: "Amenities:",
                color: const Color.fromRGBO(73, 73, 73, 1),
              ),
              buildAmenitySwitch("Wifi", wifi, (value) {
                setState(() {
                  wifi = value;
                });
              }),
              buildAmenitySwitch("Parking", parking, (value) {
                setState(() {
                  parking = value;
                });
              }),
              buildAmenitySwitch("Air Conditioning", airConditioning, (value) {
                setState(() {
                  airConditioning = value;
                });
              }),
              buildAmenitySwitch("Pool", pool, (value) {
                setState(() {
                  pool = value;
                });
              }),
              10.heightBox,
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  // Display existing images from URLs
                  ...existingImageUrls.map(
                    (url) => Stack(
                      children: [
                        Image.network(url,
                            width: 100, height: 100, fit: BoxFit.cover),
                        Positioned(
                          top: 0,
                          right: 0,
                          child: IconButton(
                            icon: const Icon(Icons.remove_circle),
                            onPressed: () {
                              setState(() {
                                existingImageUrls.remove(url);
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Display new selected images
                  ...selectedImages.map(
                    (image) => Stack(
                      children: [
                        Image.file(image,
                            width: 100, height: 100, fit: BoxFit.cover),
                        Positioned(
                          top: 0,
                          right: 0,
                          child: IconButton(
                            icon: const Icon(Icons.remove_circle),
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
                  IconButton(
                    icon: const Icon(Icons.add_a_photo),
                    onPressed: () async {
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

  Widget buildAmenitySwitch(
      String title, bool value, Function(bool) onChanged) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        normalText(text: title, color: const Color.fromRGBO(73, 73, 73, 1)),
        Switch(
          value: value,
          onChanged: onChanged,
          activeColor: Colors.blue,
        ),
      ],
    );
  }
}
