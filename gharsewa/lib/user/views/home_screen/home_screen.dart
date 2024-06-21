import 'package:flutter/material.dart';
import 'package:gharsewa/user/models/room_model.dart';
import 'package:gharsewa/user/services/room_service.dart';
import 'package:gharsewa/user/views/home_screen/room_details.dart';
import 'package:gharsewa/user/views/home_screen/search_screen.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final RoomService roomService = RoomService();
  late Future<List<Room>> rooms;

  @override
  void initState() {
    super.initState();
    rooms = _fetchRooms();
  }

  Future<List<Room>> _fetchRooms() async {
    try {
      List<Room> fetchedRooms = await roomService.getAllRooms();
      return fetchedRooms;
    } catch (e) {
      print('Error fetching rooms: $e');
      // Handle error (e.g., token expired, navigate to login)
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    var searchController = TextEditingController();
    return Scaffold(
      body: Container(
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
                  child: "Welcome! Hari Bahadur Thapa"
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
                FutureBuilder<List<Room>>(
                  future: rooms,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Text('No rooms found.');
                    } else {
                      return Column(
                        children: [
                          // Recommended for you
                          Container(
                            padding: const EdgeInsets.all(12),
                            width: double.infinity,
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
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
                                    itemCount: snapshot.data!.length,
                                    itemBuilder: (BuildContext context, index) {
                                      final room = snapshot.data![index];
                                      return Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Image.network(
                                            room.images[
                                                0], // Assuming images are URLs
                                            width: 150,
                                            height: 150,
                                            fit: BoxFit.contain,
                                          ),
                                          SizedBox(
                                            width: 150,
                                            child: Text(
                                              "Description: ${room.description}",
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                fontFamily: "san_bold",
                                                color: Color.fromRGBO(
                                                    62, 68, 71, 1),
                                              ),
                                            ),
                                          ),
                                          10.heightBox,
                                          "Rs. ${room.price}"
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
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                RoomDetails(room: room),
                                          ),
                                        );
                                      });
                                    },
                                  ),
                                ),
                              ],
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
                              children: [
                                Row(
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
                                                color: Color.fromRGBO(
                                                    62, 68, 71, 1)),
                                          ),
                                        )
                                      ],
                                    )
                                        .box
                                        .white
                                        .width(150)
                                        .margin(const EdgeInsets.symmetric(
                                            horizontal: 4))
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
                                                color: Color.fromRGBO(
                                                    62, 68, 71, 1)),
                                          ),
                                        )
                                      ],
                                    )
                                        .box
                                        .white
                                        .width(150)
                                        .margin(const EdgeInsets.symmetric(
                                            horizontal: 4))
                                        .padding(const EdgeInsets.all(8))
                                        .roundedSM
                                        .outerShadowSm
                                        .make()
                                        .onTap(() {}),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          20.heightBox,
                          Align(
                            alignment: Alignment.topLeft,
                            child: "All Listings"
                                .text
                                .size(20)
                                .color(Colors.black)
                                .make(),
                          ),
                          10.heightBox,
                          GridView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: snapshot.data!.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 8,
                              crossAxisSpacing: 8,
                              mainAxisExtent: 300,
                            ),
                            itemBuilder: (BuildContext context, index) {
                              final room = snapshot.data![index];
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.network(
                                    room.images[0], // Assuming images are URLs
                                    width: 200,
                                    height: 200,
                                    fit: BoxFit.contain,
                                  ),
                                  const Spacer(),
                                  SizedBox(
                                    width: 150,
                                    child: Text(
                                      "Description: ${room.description}",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontFamily: "sans_semibold",
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  10.heightBox,
                                  "Rs. ${room.price}"
                                      .text
                                      .size(16)
                                      .fontFamily("sans_bold")
                                      .color(Colors.red)
                                      .make(),
                                ],
                              )
                                  .box
                                  .white
                                  .margin(
                                      const EdgeInsets.symmetric(horizontal: 3))
                                  .roundedSM
                                  .padding(const EdgeInsets.all(12))
                                  .make()
                                  .onTap(() {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        RoomDetails(room: room),
                                  ),
                                );
                              });
                            },
                          ),
                        ],
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
