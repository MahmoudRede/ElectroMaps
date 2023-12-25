import 'package:flutter/material.dart';

Widget customButton({
  required context,
  required String title,
  required Function()? onTap,
  required double width,
  required Color? color,
  required Color? color2,
  required Color? textColor,
  required Color borderColor,

}) =>
    GestureDetector(
      onTap: onTap,
      child: Container(
        height: MediaQuery
            .sizeOf(context)
            .height * 0.06,
        width: width,
        decoration: BoxDecoration(
            border: Border.all(color:borderColor),
            borderRadius: BorderRadius.circular(25),
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  color!,
                  color2!,
                ]),

            color: color),
        child: Center(
            child: Text(
              title,
              style: Theme
                  .of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(
                  color: textColor, fontSize: 16),
            )),
      ),
    );