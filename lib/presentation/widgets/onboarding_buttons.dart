import 'package:e_electromaps/presentation/screens/privacy_and_terms_screen/privacy_and_terms_screen.dart';
import 'package:e_electromaps/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';

import '../../styles/colors/color_manager.dart';

Widget onBoardingButtons(context, onboardingController, isLast) => Padding(
      padding:  EdgeInsets.only(left: MediaQuery.sizeOf(context).width * 0.1 , right:MediaQuery.sizeOf(context).width * 0.1,bottom:MediaQuery.sizeOf(context).height * 0.1  ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          customButton(context:context ,title: 'Skip', onTap: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
              return PrivacyAndTermsScreen();
            },));
          }, width: MediaQuery.sizeOf(context).width * 0.2, color: Colors.white ,textColor: ColorManager.textColor,borderColor: Colors.black),
          customButton(context: context, title: 'Next', onTap: (){
            if (isLast == true) {
              Navigator.pushReplacement(context, MaterialPageRoute(
                builder: (context) {
                  return const PrivacyAndTermsScreen();
                },
              ));
            }
            onboardingController.nextPage(
                duration: const Duration(milliseconds: 10),
                curve: Curves.fastLinearToSlowEaseIn);
          }, width:MediaQuery.sizeOf(context).width * 0.2 , color: ColorManager.primaryColor,textColor: Colors.white,borderColor: ColorManager.primaryColor),
        ],
      ),
    );
