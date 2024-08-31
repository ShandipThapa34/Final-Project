import 'package:flutter/material.dart';
import 'package:gharsewa/user/models/user_room_model.dart';
import 'package:gharsewa/user/services/room_service.dart';
import 'package:gharsewa/user/views/home_screen/room_details.dart';
import 'package:gharsewa/user/views/home_screen/search_screen.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var searchController = TextEditingController();
  late Future<List<UserRoom>> futureRooms;
  final RoomService roomService = RoomService();

  @override
  void initState() {
    super.initState();
    futureRooms = roomService.getAllRooms();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      width: context.screenWidth,
      height: context.screenHeight,
      color: const Color.fromRGBO(239, 239, 239, 1),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SafeArea(
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: "Welcome! Ram Bahadur"
                    .text
                    .size(18)
                    .fontFamily("sans_bold")
                    .make(),
              ),
              10.heightBox,
              Container(
                alignment: Alignment.center,
                height: 60,
                color: const Color.fromRGBO(239, 239, 239, 1),
                child: TextFormField(
                  controller: searchController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    suffixIcon: GestureDetector(
                      onTap: () {
                        if (searchController.text.isNotEmpty) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SearchScreen(
                                title: searchController.text.trim(),
                              ),
                            ),
                          );
                        } else {
                          VxToast.show(context,
                              msg: "Please enter a textfield");
                        }
                      },
                      child: const Icon(
                        Icons.search,
                        color: Colors.blue,
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "Search Here",
                    hintStyle: const TextStyle(
                      color: Color.fromRGBO(209, 209, 209, 1),
                    ),
                  ),
                ),
              ),
              10.heightBox,
              SizedBox(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      // Recommended for you
                      Container(
                        padding: const EdgeInsets.all(12),
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          color: Colors.blue,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            "Recommended For You"
                                .text
                                .white
                                .size(18)
                                .fontFamily("sans_bold")
                                .make(),
                            10.heightBox,
                            SizedBox(
                              height: 250,
                              child: ListView.builder(
                                physics: const BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemCount: 4,
                                itemBuilder: (BuildContext context, index) {
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        "assets/images/room1.jpg",
                                        width: 150,
                                        height: 150,
                                        fit: BoxFit.contain,
                                      ),
                                      const SizedBox(
                                        width: 150,
                                        child: Text(
                                          "2 Room with parking available",
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontFamily: "san_bold",
                                            color:
                                                Color.fromRGBO(62, 68, 71, 1),
                                          ),
                                        ),
                                      ),
                                      10.heightBox,
                                      "Rs. 7000"
                                          .text
                                          .size(16)
                                          .fontFamily("san_bold")
                                          .color(Colors.red)
                                          .make(),
                                    ],
                                  )
                                      .box
                                      .white
                                      .margin(const EdgeInsets.symmetric(
                                          horizontal: 5))
                                      .roundedSM
                                      .padding(const EdgeInsets.all(8))
                                      .make()
                                      .onTap(() {
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //     builder: (context) => RoomDetails(
                                    //       room: futureRooms,
                                    //     ),
                                    //   ),
                                    // );
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              10.heightBox,
              // Property type
              Align(
                alignment: Alignment.center,
                child: "Property Type"
                    .text
                    .size(24)
                    .color(const Color.fromRGBO(62, 68, 71, 1))
                    .fontFamily("sans_bold")
                    .make(),
              ),
              10.heightBox,
              Align(
                alignment: Alignment.center,
                child: Column(
                  children: List.generate(
                    1,
                    (index) => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              "assets/icons/room.png",
                              height: 60,
                              width: 60,
                              color: Colors.blue,
                              fit: BoxFit.contain,
                            ),
                            20.widthBox,
                            const Expanded(
                              child: Text(
                                "Room",
                                style: TextStyle(
                                  fontFamily: "sans_bold",
                                  color: Color.fromRGBO(62, 68, 71, 1),
                                ),
                              ),
                            ),
                          ],
                        )
                            .box
                            .white
                            .width(150)
                            .margin(const EdgeInsets.symmetric(horizontal: 4))
                            .padding(const EdgeInsets.all(8))
                            .roundedSM
                            .outerShadowSm
                            .make()
                            .onTap(() {}),
                        10.heightBox,
                        Row(
                          children: [
                            Image.asset(
                              "assets/icons/flats.png",
                              height: 60,
                              width: 60,
                              color: Colors.blue,
                              fit: BoxFit.contain,
                            ),
                            20.widthBox,
                            const Expanded(
                              child: Text(
                                "Flat",
                                style: TextStyle(
                                  fontFamily: "sans_bold",
                                  color: Color.fromRGBO(62, 68, 71, 1),
                                ),
                              ),
                            ),
                            // title!.text.fontFamily(semibold).color(darkFontGrey).make(),
                          ],
                        )
                            .box
                            .white
                            .width(150)
                            .margin(const EdgeInsets.symmetric(horizontal: 4))
                            .padding(const EdgeInsets.all(8))
                            .roundedSM
                            .outerShadowSm
                            .make()
                            .onTap(() {}),
                      ],
                    ),
                  ),
                ),
              ),
              20.heightBox,
              Align(
                alignment: Alignment.topLeft,
                child: "All Listings".text.size(20).color(Colors.black).make(),
              ),
              10.heightBox,
              // All listings
              FutureBuilder<List<UserRoom>>(
                future: futureRooms,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('No rooms found'));
                  } else {
                    final rooms = snapshot.data!;
                    return GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: rooms.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                        mainAxisExtent: 300,
                      ),
                      itemBuilder: (BuildContext context, index) {
                        final room = rooms[index];
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.network(
                              room.images.first,
                              width: 200,
                              height: 200,
                              fit: BoxFit.contain,
                            ),
                            const Spacer(),
                            SizedBox(
                              width: 150,
                              child: Text(
                                room.address,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontFamily: "sans_semibold",
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            10.heightBox,
                            "Rs.${room.price}"
                                .text
                                .size(16)
                                .fontFamily("sans_bold")
                                .color(Colors.red)
                                .make(),
                          ],
                        )
                            .box
                            .white
                            .margin(const EdgeInsets.symmetric(horizontal: 3))
                            .roundedSM
                            .padding(const EdgeInsets.all(12))
                            .make()
                            .onTap(() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RoomDetails(
                                room: room,
                              ),
                            ),
                          );
                        });
                      },
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
