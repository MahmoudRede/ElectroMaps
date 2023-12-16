import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../styles/colors/color_manager.dart';

Widget customDropDownButtonFormField(context , value , var iemsList, String? label)=>  Padding(
    padding: EdgeInsets.symmetric(horizontal: MediaQuery.sizeOf(context).height*0.02) ,
    child: DropdownButtonFormField(
      validator: (value) => value == '-1' ? 'field required' : null,
      style:Theme.of(context).textTheme.headlineSmall!.copyWith(
        fontSize: 16,
        color: ColorManager.black,
      ),
      menuMaxHeight: MediaQuery.sizeOf(context).height * 0.35,
      itemHeight: 50,
      value:value ,
      items:iemsList, onChanged: (value){},
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        labelText:label ?? '' ,
        labelStyle:Theme.of(context).textTheme.headlineSmall!.copyWith(
          fontSize: 20,
          color: ColorManager.black,
        ),
        errorStyle: Theme.of(context).textTheme.headlineSmall!.copyWith(
          fontSize: 13.0,
          color: ColorManager.red,
        ),),)
);



