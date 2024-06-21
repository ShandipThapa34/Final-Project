import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gharsewa/owner/controllers/booking_controller.dart';
import 'package:gharsewa/owner/views/booking_screen/components/booking_place_details.dart';
import 'package:gharsewa/owner/views/widgets/text_style.dart';
import 'package:gharsewa/user/views/common_widgets/our_button.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:intl/intl.dart' as intl;

class BookingDetails extends StatefulWidget {
  const BookingDetails({super.key});

  @override
  State<BookingDetails> createState() => _BookingDetailsState();
}

class _BookingDetailsState extends State<BookingDetails> {
  var controller = Get.put(BookingController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          title: boldText(
            text: "Booking Details",
            color: Colors.white,
            size: 16.0,
          ),
        ),
        bottomNavigationBar: Visibility(
          visible: !controller.confirmed.value && !controller.cancelled.value,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 60,
                  width: context.screenWidth * 0.45,
                  child: ourButton(
                      color: Colors.green,
                      textColor: Colors.white,
                      onPress: () {
                        controller.confirmed.value = true;
                      },
                      title: "Confirm"),
                ),
                5.widthBox,
                SizedBox(
                  height: 60,
                  width: context.screenWidth * 0.45,
                  child: ourButton(
                      color: Colors.red,
                      textColor: Colors.white,
                      onPress: () {
                        controller.cancelled.value = true;
                      },
                      title: "Cancel"),
                ),
              ],
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                //booking status section
                Visibility(
                    visible: controller.confirmed.value ||
                        controller.cancelled.value,
                    child: controller.confirmed.value
                        ? Column(
                            children: [
                              10.heightBox,
                              boldText(
                                text: "Order Status",
                                color: const Color.fromRGBO(73, 73, 73, 1),
                                size: 16.0,
                              ),
                              SwitchListTile(
                                activeColor: Colors.green,
                                value: controller.confirmed.value,
                                onChanged: (value) {},
                                title: boldText(
                                    text: "Confirmed",
                                    color: const Color.fromRGBO(73, 73, 73, 1)),
                              ),
                            ],
                          )
                            .box
                            .white
                            .outerShadowMd
                            .border(
                                color: const Color.fromRGBO(239, 239, 239, 1))
                            .roundedSM
                            .make()
                        : Column(
                            children: [
                              10.heightBox,
                              boldText(
                                  text: "Order Status",
                                  color: const Color.fromRGBO(73, 73, 73, 1),
                                  size: 16.0),
                              SwitchListTile(
                                activeColor: Colors.red,
                                value: controller.cancelled.value,
                                onChanged: (value) {},
                                title: boldText(
                                    text: "Cancelled",
                                    color: const Color.fromRGBO(73, 73, 73, 1)),
                              ),
                            ],
                          )
                            .box
                            .white
                            .outerShadowMd
                            .border(
                                color: const Color.fromRGBO(239, 239, 239, 1))
                            .roundedSM
                            .make()),
                10.heightBox,
                //order details section
                Column(
                  children: [
                    bookingPlaceDetails(
                      d1: "23452345234",
                      d2: intl.DateFormat().add_yMd().format(DateTime.now()),
                      title1: "Booking Code",
                      title2: "Booking Date",
                    ),
                    const Divider(),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 200,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                boldText(
                                  text: "Renter Information",
                                  color: const Color.fromRGBO(73, 73, 73, 1),
                                  size: 16.0,
                                ),
                                "Name: Ram Bahadur Thapa".text.make(),
                                "Email: rambahadur@gmail.com".text.make(),
                                "Phone: 9800000000".text.make(),
                                "Address: Ranipauwa".text.make(),
                                "City: Pokhara".text.make(),
                                "State: Gandaki".text.make(),
                                "Postal code: 33700".text.make(),
                              ],
                            ),
                          ),
                          // SizedBox(
                          //   child: Column(
                          //     mainAxisAlignment: MainAxisAlignment.start,
                          //     crossAxisAlignment: CrossAxisAlignment.start,
                          //     children: [
                          //       boldText(
                          //         text: "Price per month",
                          //         color: const Color.fromRGBO(73, 73, 73, 1),
                          //       ),
                          //       boldText(
                          //         text: "Rs 3000",
                          //         color: Colors.red,
                          //         size: 16.0,
                          //       ),
                          //     ],
                          //   ),
                          // )
                        ],
                      ),
                    )
                  ],
                )
                    .box
                    .white
                    .outerShadowMd
                    .border(color: const Color.fromRGBO(239, 239, 239, 1))
                    .roundedSM
                    .make(),

                20.heightBox,
                boldText(
                    text: "Property Details",
                    color: const Color.fromRGBO(73, 73, 73, 1),
                    size: 16.0),
                10.heightBox,
                ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: List.generate(
                    1,
                    (index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          bookingPlaceDetails(
                            title1: "Title:",
                            title2: "Price:",
                            d1: "Single Room for student",
                            d2: "Rs 3000/month",
                          ),
                          bookingPlaceDetails(
                            title1: "Property Type:",
                            title2: "Number of Rooms:",
                            d1: "Room",
                            d2: "1",
                          )
                        ],
                      );
                    },
                  ).toList(),
                )
                    .box
                    .outerShadowMd
                    .white
                    .margin(const EdgeInsets.only(bottom: 4))
                    .make(),
                20.heightBox,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
