import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gharsewa/user/models/room_model.dart';
import 'package:gharsewa/user/views/common_widgets/our_button.dart';
import 'package:gharsewa/user/views/message_screen/chat_screen.dart';
import 'package:velocity_x/velocity_x.dart';

class RoomDetails extends StatefulWidget {
  final Room room;

  const RoomDetails({super.key, required this.room});

  @override
  State<RoomDetails> createState() => _RoomDetailsState();
}

class _RoomDetailsState extends State<RoomDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(239, 239, 239, 1),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: widget.room.address.text
            .overflow(TextOverflow.ellipsis)
            .fontFamily("sans_bold")
            .make(),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.bookmark_add,
              color: Colors.blue,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Swiper section
                    VxSwiper.builder(
                      autoPlay: true,
                      height: 350,
                      itemCount: widget.room.images.length,
                      aspectRatio: 16 / 9,
                      viewportFraction: 1.0,
                      itemBuilder: (context, index) {
                        return Image.network(
                          widget.room.images[index],
                          width: double.infinity,
                          fit: BoxFit.cover,
                        );
                      },
                    ),
                    const Divider(
                      thickness: 1.5,
                    ),
                    // Title and details section
                    10.heightBox,
                    widget.room.address.text
                        .overflow(TextOverflow.ellipsis)
                        .size(20)
                        .color(Colors.black)
                        .fontFamily("sans_bold")
                        .make(),

                    // Rating
                    10.heightBox,
                    // Row(
                    //   children: [
                    //     VxRating(
                    //       isSelectable: false,
                    //       value: widget.listing.rating,
                    //       onRatingUpdate: (value) {},
                    //       normalColor: const Color.fromRGBO(209, 209, 209, 1),
                    //       selectionColor: const Color.fromARGB(255, 226, 205, 19),
                    //       count: 5,
                    //       maxRating: 5,
                    //       size: 25,
                    //     ),
                    //     "${widget.listing.rating}".text.make(),
                    //   ],
                    // ),

                    // Price
                    10.heightBox,
                    "Rs.${widget.room.price}"
                        .text
                        .size(18)
                        .fontFamily("sans_bold")
                        .color(Colors.red)
                        .make(),

                    10.heightBox,
                    // Row(
                    //   children: [
                    //     Expanded(
                    //       child: Column(
                    //         mainAxisAlignment: MainAxisAlignment.center,
                    //         crossAxisAlignment: CrossAxisAlignment.start,
                    //         children: [
                    //           "Owner"
                    //               .text
                    //               .size(16)
                    //               .color(Colors.blue)
                    //               .fontFamily("sans_semibold")
                    //               .make(),
                    //           5.heightBox,
                    //           widget.listing.owner
                    //               .text
                    //               .fontFamily("sans_semibold")
                    //               .color(Colors.black)
                    //               .size(18)
                    //               .make(),
                    //         ],
                    //       ),
                    //     ),
                    //     const CircleAvatar(
                    //       backgroundColor: Colors.blue,
                    //       child: Icon(
                    //         Icons.message,
                    //         color: Colors.white,
                    //       ),
                    //     ).onTap(
                    //       () {
                    //         Get.to(
                    //           () => const ChatScreen(),
                    //         );
                    //       },
                    //     ),
                    //   ],
                    // )
                    //     .box
                    //     .height(60)
                    //     .padding(const EdgeInsets.symmetric(horizontal: 16))
                    //     .color(const Color.fromARGB(239, 255, 255, 255))
                    //     .roundedSM
                    //     .outerShadowSm
                    //     .make(),

                    // Description section
                    10.heightBox,
                    "Description"
                        .text
                        .fontFamily("sans_semibold")
                        .color(Colors.black)
                        .make(),
                    5.heightBox,
                    widget.room.description.text
                        .color(Colors.black)
                        .make()
                        .box
                        .padding(const EdgeInsets.all(8))
                        .shadowXs
                        .color(const Color.fromARGB(239, 255, 255, 255))
                        .make(),

                    10.heightBox,

                    "Location on Map"
                        .text
                        .fontFamily("sans_semibold")
                        .color(Colors.black)
                        .make(),
                    10.heightBox,
                    Center(
                      child: Image.network(
                        'https://www.google.com/maps/d/thumbnail?mid=1CCgtaayHGohENSdnYzBkX6t2B-s&hl=en',
                      ),
                    ),

                    10.heightBox,

                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              "Give your reviews"
                                  .text
                                  .fontFamily("sans_semibold")
                                  .size(16)
                                  .make(),
                              const Icon(Icons.arrow_forward),
                            ],
                          ).onTap(
                            () {},
                          ),
                        ),
                        10.heightBox,
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              "Rating & Reviews"
                                  .text
                                  .fontFamily("sans_semibold")
                                  .size(16)
                                  .make(),
                              const Icon(Icons.arrow_forward),
                            ],
                          ).onTap(
                            () {},
                          ),
                        ),
                      ],
                    )
                        .box
                        .color(const Color.fromARGB(239, 255, 255, 255))
                        .make(),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 60,
            child: ourButton(
              color: Colors.blue,
              onPress: () {},
              textColor: Colors.white,
              title: "Book Now",
            ),
          )
        ],
      ),
    );
  }
}
