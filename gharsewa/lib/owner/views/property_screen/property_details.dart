import 'package:flutter/material.dart';
import 'package:gharsewa/owner/views/widgets/text_style.dart';
import 'package:velocity_x/velocity_x.dart';

class PropertyDetails extends StatelessWidget {
  const PropertyDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: boldText(
            text: "Single room for student", color: Colors.white, size: 16.0),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VxSwiper.builder(
              autoPlay: true,
              height: 350,
              itemCount: 3,
              aspectRatio: 16 / 9,
              viewportFraction: 1.0,
              itemBuilder: (context, index) {
                return Image.asset(
                  "assets/images/room4.jpg",
                  width: double.infinity,
                  fit: BoxFit.fill,
                );
              },
            ),
            const Divider(
              thickness: 2.0,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  10.heightBox,
                  boldText(
                    text: "Single room for student",
                    color: const Color.fromRGBO(73, 73, 73, 1),
                    size: 18.0,
                  ),
                  normalText(
                    text: "Pokhara, chipledunga",
                    color: const Color.fromRGBO(112, 112, 112, 1),
                    size: 18.0,
                  ),

                  const Divider(),

                  //rating
                  10.heightBox,
                  Row(
                    children: [
                      boldText(text: "Rating: ", color: Colors.black),
                      VxRating(
                        isSelectable: false,
                        value: double.parse("4.8".toString()),
                        onRatingUpdate: (value) {},
                        normalColor: const Color.fromRGBO(209, 209, 209, 1),
                        selectionColor: Colors.yellow,
                        count: 5,
                        maxRating: 5,
                        size: 25,
                      ),
                    ],
                  ),

                  //price
                  10.heightBox,
                  boldText(
                    text: "Rs. 3000/month",
                    color: Colors.red,
                    size: 18.0,
                  ),

                  10.heightBox,
                  const Divider(
                    thickness: 2.0,
                  ),
                  10.heightBox,
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
                              text: "1",
                              color: const Color.fromRGBO(73, 73, 73, 1)),
                        ],
                      ),
                    ],
                  ),
                  10.heightBox,
                  const Divider(
                    thickness: 2.0,
                  ),
                  //description section
                  10.heightBox,
                  boldText(
                    text: "Description: ",
                    color: const Color.fromRGBO(73, 73, 73, 1),
                  ),
                  10.heightBox,
                  Column(
                    children: [
                      normalText(
                        text: "Best for single person only",
                        color: const Color.fromRGBO(73, 73, 73, 1),
                      ),
                    ],
                  ),
                  10.heightBox,
                  const Divider(
                    thickness: 2.0,
                  ),
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
                              text: "Room",
                              color: const Color.fromRGBO(73, 73, 73, 1)),
                        ],
                      ),
                    ],
                  ),
                  10.heightBox,
                  const Divider(
                    thickness: 2.0,
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            child: boldText(
                                text: "Property for: ",
                                color: const Color.fromRGBO(73, 73, 73, 1)),
                          ),
                          normalText(
                              text: "Student",
                              color: const Color.fromRGBO(73, 73, 73, 1)),
                        ],
                      ),
                    ],
                  ),
                ],
              ).box.white.padding(const EdgeInsets.all(8)).shadowSm.make(),
            ),
          ],
        ),
      ),
    );
  }
}
