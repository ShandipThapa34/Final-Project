import 'package:flutter/material.dart';
import 'package:gharsewa/owner/views/widgets/text_style.dart';
import 'package:intl/intl.dart' as intl;
import 'package:velocity_x/velocity_x.dart';

AppBar appbarWidget(title) {
  return AppBar(
    backgroundColor: Colors.blue,
    automaticallyImplyLeading: false,
    title: boldText(text: title, color: Colors.white, size: 18.0),
    actions: [
      Center(
        child: normalText(
            text: intl.DateFormat('EEE, MMM d,' 'yyyy').format(DateTime.now()),
            color: Colors.white),
      ),
      10.widthBox,
    ],
  );
}
