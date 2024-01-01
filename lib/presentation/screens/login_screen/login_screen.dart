import 'package:country_code_picker/country_code_picker.dart';
import 'package:e_electromaps/business_logic/cubit/app_cubit/app_cubit.dart';
import 'package:e_electromaps/business_logic/cubit/app_states/app_states.dart';
import 'package:e_electromaps/presentation/screens/register_screen/register_screen.dart';
import 'package:e_electromaps/presentation/widgets/custom_button.dart';
import 'package:e_electromaps/styles/colors/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../business_logic/localization_cubit/app_localization.dart';
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
            if (state is LoginSuccessState) {
              phoneController.clear();
              passwordController.clear();
              AppCubit.get(context).currentIndex = 0;
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeLayout(),
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
                        // Align(
                        //   alignment: Alignment.topLeft,
                        //   child: GestureDetector(
                        //     onTap: () {
                        //       Navigator.pop(context);
                        //     },
                        //     child: Container(
                        //       height: MediaQuery.sizeOf(context).height * 0.07,
                        //       width: MediaQuery.sizeOf(context).width * 0.2,
                        //       decoration: const BoxDecoration(
                        //         color: ColorManager.primaryColor,
                        //         shape: BoxShape.circle,
                        //       ),
                        //       child: CashHelper.getData(
                        //           key: CashHelper.languageKey)
                        //           .toString() ==
                        //           'en'
                        //           ? const Icon(
                        //         Icons.arrow_back,
                        //         color: ColorManager.white,
                        //       )
                        //           : const Icon(
                        //         Icons.arrow_forward,
                        //         color: ColorManager.white,
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        Image.asset('assets/images/horizontal_logo.png',
                          // color:  ColorManager.primaryColor,
                          width: MediaQuery.sizeOf(context).width * 0.3,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: CountryCodePicker(
                                padding:  EdgeInsets.all(20),
                                enabled: false,
                                textOverflow: TextOverflow.visible,
                                textStyle: Theme.of(context).textTheme.headlineSmall,
                                onChanged: (CountryCode countryCode) {
                                  print(
                                      'New Country selected: ${countryCode.dialCode}');

                                },
                                initialSelection: 'SA',
                                dialogSize: Size(
                                    MediaQuery.sizeOf(context).width * 0.8,
                                    MediaQuery.sizeOf(context).height * 0.6),
                                dialogTextStyle: Theme.of(context).textTheme.headlineSmall,
                                flagDecoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                ),
                              ),
                            ),
                            Expanded(
                              child: TextFormField(
                              controller: phoneController,
                              keyboardType: TextInputType.phone,
                              textInputAction:  TextInputAction.next,
                              maxLength:  9,
                              decoration: InputDecoration(
                                labelText: AppLocalizations.of(context)!
                                    .translate("phone_number")
                                    .toString(),

                              ),
                              validator: (text) {
                                if (text!.trim() == "") {
                                  return AppLocalizations.of(context)!.translate("required").toString();
                                }
                                final bool phoneValid = RegExp(r'^[0-9]{9}$').hasMatch(text);
                                if (phoneValid == false) {
                                  return AppLocalizations.of(context)!.translate("required").toString();
                                }
                                return null;
                              },
                            )

              ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.03,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                            AppLocalizations.of(context)!
                                .translate("password")
                                .toString(),
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
                        //forget password

                        // Align(
                        //   alignment: Alignment.centerRight,
                        //   child: GestureDetector(
                        //     onTap: () {
                        //       Navigator.push(
                        //         context, MaterialPageRoute(
                        //           builder: (context) =>   const ForgetPassword(),)
                        //       );
                        //     },
                        //     child: Text(
                        //       AppLocalizations.of(context)!
                        //           .translate("forgot_password")
                        //           .toString(),
                        //       style: Theme.of(context)
                        //           .textTheme
                        //           .headlineSmall!
                        //           .copyWith(
                        //               color: ColorManager.primaryColor,
                        //               fontSize: 16),
                        //     ),
                        //   ),
                        // ),
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.02,
                        ),
                        state is LoginLoadingState
                            ? const Center(
                                child: CircularProgressIndicator(
                                  color: ColorManager.primaryColor,
                                ),
                              )
                            : customButton(
                                context: context,
                                onTap: () {
                                  if (formKey.currentState!.validate()) {
                                    cubit.loginWithFirebaseAuth(
                                        password: passwordController.text,
                                        phone: phoneController.text,
                                        countryCode: cubit.userModel?.countryCode??'+966',
                                        context: context);
                                  }

                                },
                                color: ColorManager.primaryColor,
                                textColor: ColorManager.white,
                                width: MediaQuery.sizeOf(context).height * 0.5,
                          title: AppLocalizations.of(context)!
                              .translate("login")
                              .toString(), color2: ColorManager.primaryColor,
                          borderColor: ColorManager.white,

                              ),
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.03,
                        ),
                        Column(
                          children: [
                            Text(
                              AppLocalizations.of(context)!
                                  .translate("don't_have_an_account")
                                  .toString(),
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
                                  AppLocalizations.of(context)!
                                      .translate("sign_up_for_free")
                                      .toString(),
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
