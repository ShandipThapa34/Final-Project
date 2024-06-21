import 'package:flutter/material.dart';
import 'package:gharsewa/owner/views/widgets/text_style.dart';
import 'package:velocity_x/velocity_x.dart';

Widget bookingPlaceDetails({title1, title2, d1, d2}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            boldText(
                text: "$title1", color: const Color.fromRGBO(73, 73, 73, 1)),
            boldText(text: "$d1", color: Colors.blue),
            10.heightBox,
            boldText(
                text: "$title2", color: const Color.fromRGBO(73, 73, 73, 1)),
            boldText(text: "$d2", color: Colors.blue),
          ],
        ),
        // SizedBox(
        //   width: 130,
        //   child: Column(
        //     crossAxisAlignment: CrossAxisAlignment.end,
        //     children: [
        //       boldText(
        //           text: "$title2", color: const Color.fromRGBO(73, 73, 73, 1)),
        //       boldText(text: "$d2", color: Colors.red),
        //     ],
        //   ),
        // ),
      ],
    ),
  );
}
