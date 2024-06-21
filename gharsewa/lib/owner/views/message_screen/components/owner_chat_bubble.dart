import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;
import 'package:velocity_x/velocity_x.dart';

Widget ownerChatBubble() {
  var t = DateTime.now();
  var time = intl.DateFormat("h:mma").format(t);
  return Directionality(
    textDirection: TextDirection.ltr,
    child: Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(bottom: 8),
      decoration: const BoxDecoration(
        color: Color.fromRGBO(73, 73, 73, 1),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          "Hello can we talk".text.size(16).white.make(),
          10.heightBox,
          time.text.color(Colors.white.withOpacity(0.5)).make(),
        ],
      ),
    ),
  );
}
