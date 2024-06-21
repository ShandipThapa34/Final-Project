import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

Widget propertyImages({required label, onPress}) {
  return "$label"
      .text
      .bold
      .color(const Color.fromRGBO(73, 73, 73, 1))
      .size(25.0)
      .makeCentered()
      .box
      .color(const Color.fromRGBO(209, 209, 209, 1))
      .size(100, 100)
      .roundedSM
      .make();
}
