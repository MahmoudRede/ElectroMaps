import 'package:e_electromaps/presentation/widgets/custom_button.dart';
import 'package:e_electromaps/styles/colors/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class PrivacyAndTermsScreen extends StatelessWidget {
  const PrivacyAndTermsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.13,
            ),
            Text(
              'Terms of service',
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(color: ColorManager.black,),
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.05,
            ),
            Lottie.asset(
              'assets/images/terms_2.json',

              height: MediaQuery.sizeOf(context).height * 0.3,
              width: MediaQuery.sizeOf(context).width * 0.8,
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Please review our ',
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(fontSize: 18),
                ),
                InkWell(
                    onTap: () {},
                    child: Text(
                      'Terms and Conditions',
                      style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          color: ColorManager.primaryColor),
                    )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'and ',
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!.copyWith(
                      color: ColorManager.primaryColor),
                ),
                InkWell(
                    onTap: () {},
                    child: Text(
                      'Privacy Policy',
                      style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          color: ColorManager.primaryColor),
                    )),
                Text(
                  ' if you wish to know',
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall,
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text('more about the usage details of\n Electro Maps',
                style:
                    Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsets.only(
                left: MediaQuery.sizeOf(context).width * 0.05,
                right: MediaQuery.sizeOf(context).width * 0.05,
                bottom: MediaQuery.sizeOf(context).height * 0.03,
              ),
              child: customButton(
                  context: context,
                  title: 'I have read and accept',
                  onTap: () {},
                  width: MediaQuery.sizeOf(context).width,
                  color: ColorManager.primaryColor,
                  textColor: ColorManager.white,
                  borderColor: ColorManager.primaryColor),
            ),
          ],
        ),
      ),
    );
  }
}
