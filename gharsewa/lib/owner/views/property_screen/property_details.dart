import 'package:flutter/material.dart';
import 'package:gharsewa/owner/models/property_model.dart';
import 'package:gharsewa/owner/views/widgets/text_style.dart';
import 'package:velocity_x/velocity_x.dart';

class PropertyDetails extends StatelessWidget {
  final OwnerRoom room;

  const PropertyDetails({super.key, required this.room});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: boldText(text: room.address, color: Colors.white, size: 16.0),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VxSwiper.builder(
              autoPlay: true,
              height: 350,
              itemCount: room.images.length,
              aspectRatio: 16 / 9,
              viewportFraction: 1.0,
              itemBuilder: (context, index) {
                return Image.network(
                  room.images[index],
                  width: double.infinity,
                  fit: BoxFit.cover,
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  10.heightBox,
                  Row(
                    children: [
                      const Icon(Icons.location_pin),
                      5.widthBox,
                      boldText(
                        text: room.address,
                        color: const Color.fromRGBO(73, 73, 73, 1),
                        size: 22.0,
                      ),
                    ],
                  ),
                  normalText(
                    text: room.address,
                    color: const Color.fromRGBO(112, 112, 112, 1),
                    size: 18.0,
                  ),
                  const Divider(),
                  //rating
                  Row(
                    children: [
                      boldText(text: "Rating: ", color: Colors.black),
                      VxRating(
                        isSelectable: false,
                        value: double.parse(
                            "4.8"), // Replace with actual rating value
                        onRatingUpdate: (value) {},
                        normalColor: const Color.fromRGBO(209, 209, 209, 1),
                        selectionColor: Colors.yellow,
                        count: 5,
                        maxRating: 5,
                        size: 25,
                      ),
                    ],
                  ),
                  const Divider(),

                  //price

                  Row(
                    children: [
                      boldText(
                        text: "Price: ",
                        color: Colors.black,
                      ),
                      boldText(
                        text: "Rs. ${room.price}/month",
                        color: Colors.red,
                        size: 16.0,
                      ),
                    ],
                  ),

                  const Divider(),

                  boldText(
                    text: "Description: ",
                    color: const Color.fromRGBO(73, 73, 73, 1),
                  ),

                  Column(
                    children: [
                      normalText(
                        text: room.description,
                        color: const Color.fromRGBO(73, 73, 73, 1),
                      ),
                    ],
                  ),

                  const Divider(),

                  Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            child: boldText(
                                text: "Number of rooms: ",
                                color: const Color.fromRGBO(73, 73, 73, 1)),
                          ),
                          normalText(
                              text: room.roomNumber.toString(),
                              color: const Color.fromRGBO(73, 73, 73, 1)),
                        ],
                      ),
                    ],
                  ),

                  const Divider(),
                  Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            child: boldText(
                                text: "Property type: ",
                                color: const Color.fromRGBO(73, 73, 73, 1)),
                          ),
                          normalText(
                              text: room.roomType,
                              color: const Color.fromRGBO(73, 73, 73, 1)),
                        ],
                      ),
                    ],
                  ),

                  const Divider(),
                  Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            child: boldText(
                                text: "Availability: ",
                                color: const Color.fromRGBO(73, 73, 73, 1)),
                          ),
                          normalText(
                              text: room.availability
                                  ? "Available"
                                  : "Not Available",
                              color: const Color.fromRGBO(73, 73, 73, 1)),
                        ],
                      ),
                    ],
                  ),

                  const Divider(),
                  //amenities section
                  boldText(text: "Amenities: ", color: Colors.black),
                  10.heightBox,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: room.amenities.entries.map((entry) {
                      return Row(
                        children: [
                          normalText(
                            text: entry.key,
                            color: const Color.fromRGBO(73, 73, 73, 1),
                          ),
                          5.widthBox,
                          Icon(
                            entry.value ? Icons.check : Icons.close,
                            color: entry.value ? Colors.green : Colors.red,
                          ),
                        ],
                      );
                    }).toList(),
                  )
                ],
              ).box.white.padding(const EdgeInsets.all(8)).shadowSm.make(),
            ),
          ],
        ),
      ),
    );
  }
}
