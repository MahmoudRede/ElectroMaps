import 'package:e_electromaps/presentation/screens/login_screen/login_screen.dart';
import 'package:e_electromaps/presentation/widgets/default_button.dart';
import 'package:e_electromaps/presentation/widgets/default_text_form_field.dart';
import 'package:e_electromaps/styles/colors/color_manager.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorManager.white,
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.1,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: DefaultButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        backGroundColor: Colors.black54,
                        height: MediaQuery.sizeOf(context).height * 0.07,
                        width: MediaQuery.sizeOf(context).width * 0.07,
                        content: const Icon(
                          Icons.arrow_back,
                          color: ColorManager.white,
                        )),
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.05,
                  ),
                  Text(
                    "Join 'App Name'",
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge!
                        .copyWith(color: ColorManager.black, fontSize: 30),
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.03,
                  ),
                  DefaultTextFormField(
                      labelText: 'Email *',
                      controller: emailController,
                      textInputType: TextInputType.emailAddress),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.05,
                  ),
                  DefaultTextFormField(
                      isPass: true,
                      labelText: 'Password *',
                      controller: passwordController,
                      textInputType: TextInputType.text),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.01,
                  ),
                  Wrap(
                    runSpacing: 1,
                    children: [
                      Text(
                          'Must contain at least 8 characters, and at least one uppercase,lowercase, and number.',
                          textAlign: TextAlign.start,
                          style:
                              Theme.of(context).textTheme.headlineSmall!.copyWith(
                                    color: ColorManager.black.withOpacity(.7),
                                    fontSize: 15,
                                  ))
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.07,
                  ),
                  DefaultButton(
                    onPressed: () {},
                    backGroundColor: ColorManager.primaryColor,
                    height: MediaQuery.sizeOf(context).height * 0.06,
                    width: MediaQuery.sizeOf(context).height * 0.5,
                    content: Text(
                      "SIGN UP FOR FREE",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(color: ColorManager.white, fontSize: 18),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?",
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(
                                color: ColorManager.textColor, fontSize: 16),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LoginScreen(),
                                ));
                          },
                          child: Text(
                            "Login now",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                    color: ColorManager.primaryColor,
                                    fontSize: 16),
                          ))
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
