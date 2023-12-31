import 'package:e_electromaps/data/model/onboarding_model/onboarding_model.dart';

import 'package:e_electromaps/presentation/screens/privacy_and_terms_screen/privacy_and_terms_screen.dart';
import 'package:e_electromaps/presentation/widgets/custom_button.dart';
import 'package:e_electromaps/presentation/widgets/onboarding_buttons.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../styles/colors/color_manager.dart';

Widget onBoardingBody(onboardingController, List<BoardingModel> bording, index,
        context, bool isLast) =>
    SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40), boxShadow: const []),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 5),
              child: Lottie.asset(
                bording[index].image,
                fit: BoxFit.contain,
                height: MediaQuery.sizeOf(context).height * 0.4,
                width: MediaQuery.sizeOf(context).width * 0.8,
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.03,
          ),
          SmoothPageIndicator(
            controller: onboardingController,
            count: bording.length,
            effect: ScrollingDotsEffect(
              dotColor: Colors.grey,
              activeDotColor: ColorManager.primaryColor,
              dotHeight: MediaQuery.sizeOf(context).height * 0.005,
              dotWidth: MediaQuery.sizeOf(context).width * 0.05,
              spacing: MediaQuery.sizeOf(context).width * 0.05,
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
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(color: ColorManager.black),
            ),
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.01,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.sizeOf(context).width * 0.1),
              child: Text(
                bording[index].body,
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(color: ColorManager.textColor),
                overflow: TextOverflow.visible,
              ),
            ),
          ),
          index == 3
              ? Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.sizeOf(context).width * 0.05,
                    right: MediaQuery.sizeOf(context).width * 0.05,
                    bottom: MediaQuery.sizeOf(context).height * 0.03,
                  ),
                  child: customButton(
                    context: context,
                    title: "Get Started",
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
                    width: MediaQuery.sizeOf(context).width,
                    color: ColorManager.primaryColor,
                    textColor: ColorManager.white,
                    borderColor: ColorManager.white,
                    color2: ColorManager.primaryColor,
                  ),
                )
              : onBoardingButtons(context, onboardingController, isLast),
        ],
      ),
    );
