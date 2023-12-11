
import 'package:flutter/material.dart';

import '../../styles/colors/color_manager.dart';
import '../screens/privacy_and_terms_screen/privacy_and_terms_screen.dart';

Widget customButton({required context,required String title,required Function()? onTap , required double width,required Color? color, required Color? textColor })=> GestureDetector(
  onTap: onTap,
  child: Container(
    height: MediaQuery.sizeOf(context).height * 0.06,
    width: width,
    decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(25),
        color:color),
    child:  Center(
        child: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .copyWith(
              color: textColor, fontSize: 16),
        )),
  ),
);