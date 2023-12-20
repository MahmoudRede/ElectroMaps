import 'package:e_electromaps/business_logic/cubit/app_cubit/app_cubit.dart';
import 'package:e_electromaps/business_logic/cubit/app_states/app_states.dart';
import 'package:e_electromaps/presentation/screens/register_screen/register_screen.dart';
import 'package:e_electromaps/presentation/widgets/default_button.dart';
import 'package:e_electromaps/presentation/widgets/default_text_form_field.dart';
import 'package:e_electromaps/styles/colors/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/pinTextField.dart';
import '../home_layout/home_layout.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorManager.white,
        body: BlocConsumer<AppCubit, AppStates>(
          listener: (context, state) {
            if(state is LoginSuccessState){
              phoneController.clear();
              passwordController.clear();
              Navigator.pushReplacement(
              context,
              MaterialPageRoute(
              builder: (context) =>
              const HomeLayout(),
              ));
            }
          },
          builder: (context, state) {
            var cubit = AppCubit.get(context);
            return Padding(
              padding: const EdgeInsets.all(15.0),
              child: SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.1,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                height:
                                    MediaQuery.sizeOf(context).height * 0.07,
                                width: MediaQuery.sizeOf(context).width * 0.2,
                                decoration: const BoxDecoration(
                                  color: ColorManager.primaryColor,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.arrow_back,
                                  color: ColorManager.white,
                                ),
                              )),
                        ),
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.05,
                        ),
                        Text(
                          "Welcome!",
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .copyWith(
                                  color: ColorManager.black, fontSize: 30),
                        ),
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.02,
                        ),
                        Text(
                          "Sign in to your account",
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .copyWith(
                                  color: ColorManager.black, fontSize: 18),
                        ),
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.03,
                        ),
                        DefaultTextFormField(
                            labelText: 'Phone Number',
                            controller: phoneController,
                            textInputType: TextInputType.phone),
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.03,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                            "Password",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(fontSize: 16),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.02,
                        ),

                        PinTextField(
                          passwordController: passwordController,
                        ),
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                            onTap: () {},
                            child: Text(
                              "Forgot Password?",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(
                                      color: ColorManager.primaryColor,
                                      fontSize: 16),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.02,
                        ),
                        state is LoginLoadingState
                            ? const Center(
                          child: CircularProgressIndicator(
                            color: ColorManager.primaryColor,
                          ),
                        )
                            :DefaultButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              cubit.loginWithFirebaseAuth(
                                  password: passwordController.text,
                                  phone: phoneController.text
                              );
                            }
                          },
                          backGroundColor: ColorManager.primaryColor,
                          height: MediaQuery.sizeOf(context).height * 0.06,
                          width: MediaQuery.sizeOf(context).height * 0.5,
                          content: Text(
                            "Login",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                    color: ColorManager.white,
                                    fontSize:
                                        MediaQuery.sizeOf(context).height *
                                            0.02),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.03,
                        ),
                        Column(
                          children: [
                            Text(
                              "Don't have an account?",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(
                                      color: ColorManager.black, fontSize: 16),
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const RegisterScreen(),
                                    ),
                                  );
                                },
                                child: Text(
                                  "Sign up now for free",
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
            );
          },
        ),
      ),
    );
  }
}
