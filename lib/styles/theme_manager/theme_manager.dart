import 'package:e_electromaps/styles/colors/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData getApplicationTheme(BuildContext context) {
  return ThemeData(
    //main colors
    primaryColor: ColorManager.primaryColor,
    useMaterial3: true,
    // app bar theme
      appBarTheme:   AppBarTheme(
          elevation: 0.0,
          color: ColorManager.primaryColor,
          titleTextStyle: Theme.of(context).textTheme.headlineMedium!.copyWith(
            color: ColorManager.white,
            fontSize: 20,
          ),
          iconTheme: const IconThemeData(
            color: ColorManager.white,
          ),
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: ColorManager.primaryColor,
            statusBarIconBrightness: Brightness.light,
          )),
//text theme
    textTheme: const TextTheme(
      headlineSmall: TextStyle(
        fontSize: 16,
          fontFamily: 'Nunito',
          color: ColorManager.black

      ),
      headlineMedium: TextStyle(
        fontSize: 20,
          fontFamily: 'Nunito',
          color: ColorManager.black

      ),
      headlineLarge: TextStyle(
        fontSize: 24,
          fontFamily: 'Nunito',
          color: ColorManager.black

      ),

    ),

  );
}
