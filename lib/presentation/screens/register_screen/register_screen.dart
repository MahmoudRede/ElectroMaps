import 'package:e_electromaps/business_logic/cubit/app_cubit/app_cubit.dart';
import 'package:e_electromaps/business_logic/cubit/app_states/app_states.dart';
import 'package:e_electromaps/presentation/screens/home_layout/home_layout.dart';
import 'package:e_electromaps/presentation/screens/login_screen/login_screen.dart';
import 'package:e_electromaps/presentation/widgets/custom_toast.dart';
import 'package:e_electromaps/presentation/widgets/default_button.dart';
import 'package:e_electromaps/presentation/widgets/default_text_form_field.dart';
import 'package:e_electromaps/styles/colors/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../widgets/pinTextField.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorManager.white,
        body: BlocConsumer<AppCubit, AppStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = AppCubit.get(context);
            return Padding(
              padding: const EdgeInsets.all(20.0),
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
                                decoration: BoxDecoration(
                                  color: ColorManager.grey.withOpacity(.6),
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
                        //title
                        Text(
                          "JOIN MUGEEP",
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .copyWith(
                                  color: ColorManager.black, fontSize: 28),
                        ),
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.02,
                        ),
                        //name
                        DefaultTextFormField(
                            labelText: 'User Name *',
                            controller: nameController,
                            textInputType: TextInputType.text),
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.02,
                        ),
                        //phone
                        DefaultTextFormField(
                            labelText: 'Phone Number *',
                            controller: phoneController,
                            textInputType: TextInputType.phone),
                        //password
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.03,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                            "Password *",
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
                          height: MediaQuery.sizeOf(context).height * 0.02,
                        ),
                        // DefaultTextFormField(
                        //     isPass: true,
                        //     labelText: 'Password *',
                        //     controller: passwordController,
                        //     textInputType: TextInputType.text),
                        // SizedBox(
                        //   height: MediaQuery.sizeOf(context).height * 0.01,
                        // ),
                        // Wrap(
                        //   runSpacing: 1,
                        //   children: [
                        //     Text(
                        //         'Must contain at least 8 characters, and at least one uppercase,lowercase, and number.',
                        //         textAlign: TextAlign.start,
                        //         style: Theme.of(context)
                        //             .textTheme
                        //             .headlineSmall!
                        //             .copyWith(
                        //               color: ColorManager.textColor,
                        //               fontSize: 15,
                        //             ))
                        //   ],
                        // ),
                        // SizedBox(
                        //   height: MediaQuery.sizeOf(context).height * 0.03,
                        // ),
                        state is SignUpLoadingState
                            ? const Center(
                                child: CircularProgressIndicator(
                                  color: ColorManager.primaryColor,
                                ),
                              )
                            : DefaultButton(
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {

                                    AppCubit.get(context)
                                        .createAccountWithFirebaseAuth(
                                            name: nameController.text,
                                            email: emailController.text,
                                            phone: phoneController.text,
                                            password: passwordController.text,
                                            context: context);
                                    if (cubit.getUser(
                                            id: "${cubit.userModel?.uId}") !=
                                        null) {
                                      emailController.clear();
                                      passwordController.clear();
                                      nameController.clear();
                                      phoneController.clear();
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) =>
                                                  const HomeLayout()));
                                    } else {
                                      customToast(
                                          title: 'This  email is already used',
                                          color: ColorManager.red);
                                    }
                                  }
                                },
                                backGroundColor: ColorManager.primaryColor,
                                height:
                                    MediaQuery.sizeOf(context).height * 0.06,
                                width: MediaQuery.sizeOf(context).height * 0.5,
                                content: Text(
                                  "Sign up for free",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall!
                                      .copyWith(
                                          color: ColorManager.white,
                                          fontSize: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.022),
                                ),
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
                                      color: ColorManager.black, fontSize: 16),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const LoginScreen(),
                                  ),
                                );
                              },
                              child: Text(
                                "Login now",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(
                                        color: ColorManager.primaryColor,
                                        fontSize: 16),
                              ),
                            ),
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
