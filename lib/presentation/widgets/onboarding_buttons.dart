import 'package:e_electromaps/presentation/screens/privacy_and_terms_screen/privacy_and_terms_screen.dart';
import 'package:flutter/material.dart';

import '../../styles/colors/color_manager.dart';

Widget onBoardingButtons(context, onboardingController, isLast) => Padding(
      padding:  EdgeInsets.only(left: MediaQuery.sizeOf(context).width * 0.1 , right:MediaQuery.sizeOf(context).width * 0.1,bottom:MediaQuery.sizeOf(context).height * 0.1  ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(context, MaterialPageRoute(
                builder: (context) {
                  return const PrivacyAndTermsScreen();
                },
              ));
            },
            child: Container(
              height: MediaQuery.sizeOf(context).height * 0.06,
              width: MediaQuery.sizeOf(context).width * 0.2,
              decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.white),
              child:  Center(
                  child: Text(
                'SKIP',
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(
                    color: ColorManager.textColor, fontSize: 18),
              )),
            ),
          ),
          GestureDetector(
            onTap: () {
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
            },
            child: Container(
              height: MediaQuery.sizeOf(context).height * 0.06,
              width: MediaQuery.sizeOf(context).width * 0.2,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: ColorManager.primaryColor),
              child:  Center(
                  child: Text(
                'Next',
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(
                    color: ColorManager.white, fontSize: 18),
              )),
            ),
          )
        ],
      ),
    );
