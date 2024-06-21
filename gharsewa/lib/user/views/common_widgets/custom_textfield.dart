import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

Widget customTextField({
  String? title,
  String? hint,
  keyboardType = TextInputType.text,
  controller,
  required bool isPass,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      title!.text
          .color(Colors.blue)
          .fontFamily("sans_semibold")
          .size(16)
          .make(),
      10.heightBox,
      TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: isPass,
        decoration: InputDecoration(
          hintStyle: const TextStyle(
            fontFamily: "sans_regular",
            color: Color.fromRGBO(209, 209, 209, 1),
          ),
          hintText: hint,
          isDense: true,
          fillColor: const Color.fromRGBO(239, 239, 239, 1),
          filled: true,
          border: InputBorder.none,
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.blue,
            ),
          ),
        ),
      ),
      10.heightBox,
    ],
  );
}
