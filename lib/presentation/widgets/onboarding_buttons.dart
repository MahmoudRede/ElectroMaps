import 'package:e_electromaps/presentation/screens/privacy_and_terms_screen/privacy_and_terms_screen.dart';
import 'package:flutter/material.dart';

Widget onBoardingButtons(context, onboardingController, isLast) => Padding(
      padding: const EdgeInsets.all(40),
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
              height: 60,
              width: 100,
              decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.white),
              child: const Center(
                  child: Text(
                'SKIP',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
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
              height: 60,
              width: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.greenAccent),
              child: const Center(
                  child: Text(
                'Next',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.white),
              )),
            ),
          )
        ],
      ),
    );
