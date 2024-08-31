import 'package:flutter/material.dart';
import 'package:gharsewa/user/models/user_room_model.dart';
import 'package:gharsewa/user/views/home_screen/room_details.dart';
import 'package:velocity_x/velocity_x.dart';

class BookmarkScreen extends StatelessWidget {
  const BookmarkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: "My Bookmark"
            .text
            .fontFamily("sans_semibold")
            .color(Colors.white)
            .make(),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: GestureDetector(
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => RoomDetails(listing: listing),
                  //   ),
                  // );
                },
                child: ListTile(
                  leading: Image.asset(
                    "assets/images/room3.jpg",
                    width: 80,
                    fit: BoxFit.contain,
                  ),
                  title: "Room for students"
                      .text
                      .overflow(TextOverflow.ellipsis)
                      .size(16)
                      .fontFamily("sans_semibold")
                      .make(),
                  subtitle: "Rs. 3000"
                      .text
                      .color(Colors.red)
                      .fontFamily("sans_semibold")
                      .make(),
                  trailing: const Icon(
                    Icons.bookmark_added,
                    color: Colors.blue,
                  ).onTap(
                    () {},
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
