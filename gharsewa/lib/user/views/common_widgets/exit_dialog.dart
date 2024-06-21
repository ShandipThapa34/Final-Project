import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:gharsewa/user/views/common_widgets/our_button.dart';

Widget exitDialog(context) {
  return Dialog(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        "Confirm"
            .text
            .color(const Color.fromRGBO(62, 68, 71, 1))
            .fontFamily("sans_bold")
            .size(18)
            .make(),
        const Divider(),
        10.heightBox,
        "Are you sure you want to exit?"
            .text
            .color(const Color.fromRGBO(62, 68, 71, 1))
            .size(16)
            .make(),
        10.heightBox,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ourButton(
              title: "Yes",
              color: Colors.blue,
              textColor: Colors.white,
              onPress: () {
                SystemNavigator.pop();
              },
            ),
            ourButton(
              title: "No",
              color: Colors.blue,
              textColor: Colors.white,
              onPress: () {
                Navigator.pop(context);
              },
            )
          ],
        )
      ],
    )
        .box
        .color(const Color.fromRGBO(239, 239, 239, 1))
        .padding(const EdgeInsets.all(12))
        .roundedSM
        .make(),
  );
}
