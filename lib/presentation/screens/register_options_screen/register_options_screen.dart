import 'package:e_electromaps/presentation/screens/register_screen/register_screen.dart';
import 'package:e_electromaps/presentation/widgets/default_button.dart';
import 'package:flutter/material.dart';

import '../../../styles/colors/color_manager.dart';

class RegisterOptionsScreen extends StatelessWidget {
  const RegisterOptionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text('Logo Here',
                    textAlign: TextAlign.center,
                    style:
                        Theme.of(context).textTheme.headlineLarge!.copyWith()),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.55,
                ),
                DefaultButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegisterScreen(),
                        ));
                  },
                  content: Text('Continue With Email',  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(color: ColorManager.white, fontSize: 18),),

                  height: MediaQuery.sizeOf(context).height * 0.06,
                  width: MediaQuery.sizeOf(context).height * 0.5,
                  backGroundColor: ColorManager.primaryColor,
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.05,
                ),
                Wrap(
                  children: [
                    Text(
                        'You can use a limited version of our app without signing up.',
                        textAlign: TextAlign.center,
                        style:
                            Theme.of(context).textTheme.headlineSmall!.copyWith(
                                  color: ColorManager.black,
                                  fontSize: 17,
                                ))
                  ],
                ),
                TextButton(
                    onPressed: () {},
                    child:   Text(
                      " Continue as a Guest",
                      style: Theme
                          .of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(
                          color: ColorManager.primaryColor,
                          fontSize: 16),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
