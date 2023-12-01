import 'package:e_electromaps/presentation/screens/onboarding_screens/onboarding.dart';
import 'package:e_electromaps/presentation/screens/privacy_and_terms_screen/privacy_and_terms_screen.dart';
import 'package:e_electromaps/presentation/widgets/onboarding_buttons.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

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
            height: 300,
            child: Image.asset(
              bording[index].image,
              fit: BoxFit.cover,
              height: 300,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
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
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Text(
            bording[index].title,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.black, fontSize: 25),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Text(
            bording[index].body,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 18),
          ),
        ),
        const Spacer(),
        if (index == 3)
          Padding(
            padding: const EdgeInsets.only(bottom: 40),
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
                height: 60,
                width: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.greenAccent),
                child: const Center(
                    child: Text(
                  'Get Started',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.white),
                )),
              ),
            ),
          ),
        if (index != 3)
          onBoardingButtons(context, onboardingController, isLast),
      ],
    );
