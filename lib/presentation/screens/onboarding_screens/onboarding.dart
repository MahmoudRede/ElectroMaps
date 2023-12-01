import 'package:e_electromaps/presentation/widgets/onboarding_body.dart';

import 'package:flutter/material.dart';

class BoardingModel {
  final String image;
  final String title;
  final String body;

  BoardingModel({required this.image, required this.title, required this.body});
}

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  var onboardingController = PageController();
  List<BoardingModel> bording = [
    BoardingModel(
        image: 'assets/images/chargesession.jpg',
        title: 'Welcome ',
        body: 'Welcome to the largets community of electric driviers.'),
    BoardingModel(
        image: 'assets/images/onboardingCharging.png',
        title: 'All the charging stations at your fingertips ',
        body:
            'Know all about the charging stations where and whenever you want .'),
    BoardingModel(
        image: 'assets/images/onboarding1.jpg',
        title: 'Charging sessions',
        body: 'Charge your vechile and view you previous charges'),
    BoardingModel(
        image: 'assets/images/onboarding4.jpg',
        title: 'Share with the community ',
        body:
            'Share information about the charging stations with rest electric vechile drivers '),
  ];
  bool isLast = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView.builder(
        onPageChanged: (index) {
          if (index == bording.length - 1) {
            setState(() {
              isLast = true;
            });
          } else {
            setState(() {
              isLast = false;
            });
          }
        },
        physics: BouncingScrollPhysics(),
        controller: onboardingController,
        itemCount: bording.length,
        itemBuilder: (context, index) => onBoardingBody(
            onboardingController, bording, index, context, isLast),
      ),
    );
  }
}
