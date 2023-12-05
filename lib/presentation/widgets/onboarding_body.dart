import 'package:e_electromaps/data/model/onboarding_model/onboarding_model.dart';

import 'package:e_electromaps/presentation/screens/privacy_and_terms_screen/privacy_and_terms_screen.dart';
import 'package:e_electromaps/presentation/widgets/onboarding_buttons.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../styles/colors/color_manager.dart';

Widget onBoardingBody(onboardingController, List<BoardingModel> bording, index,
        context, bool isLast) =>
    Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40)),
          child: Container(
            height: MediaQuery.sizeOf(context).height * 0.38,
            child: Image.asset(
              bording[index].image,
              fit: BoxFit.cover,
              // height: 300,
            ),
          ),
        ),
         SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.03,
        ),
        SmoothPageIndicator(
          controller: onboardingController,
          count: bording.length,
          effect: const ScrollingDotsEffect(
            dotColor: Colors.grey,
            activeDotColor: Colors.greenAccent,
            dotHeight: 10,
            dotWidth: 10,
            spacing: 5,
          ),
        ),
         SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.03,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Text(
            bording[index].title,
            textAlign: TextAlign.center,
            style:Theme.of(context)
                .textTheme
                .labelLarge!
                .copyWith(
                color: ColorManager.black, fontSize: 20),
          ),
        ),
         SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.02,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              bording[index].body,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(color: ColorManager.textColor,fontSize: 16),
            ),
          ),
        ),

        SizedBox(height: MediaQuery.sizeOf(context).height * 0.25,),

          index == 3 ? Padding(
            padding: EdgeInsets.only(left: MediaQuery.sizeOf(context).width * 0.1 , right:MediaQuery.sizeOf(context).width * 0.1,bottom:MediaQuery.sizeOf(context).height * 0.1  ),
            child: GestureDetector(
              onTap: () {
                if (isLast == true) {
                  Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) {
                      return const PrivacyAndTermsScreen();
                    },
                  ));
                }
                onboardingController.nextPage(
                    duration: const Duration(milliseconds: 750),
                    curve: Curves.fastLinearToSlowEaseIn);
              },
              child: Container(
                height: MediaQuery.sizeOf(context).height * 0.06,
                width: MediaQuery.sizeOf(context).width * 0.4,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: ColorManager.primaryColor),
                child:  Center(
                    child: Text(
                  'Get Started',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(color: ColorManager.white,fontSize: 18),
                )),
              ),
            ),
          ):onBoardingButtons(context, onboardingController, isLast),


      ],
    );
