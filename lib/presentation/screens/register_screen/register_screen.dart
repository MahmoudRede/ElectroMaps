import 'package:country_code_picker/country_code_picker.dart';
import 'package:e_electromaps/business_logic/cubit/app_cubit/app_cubit.dart';
import 'package:e_electromaps/business_logic/cubit/app_states/app_states.dart';
import 'package:e_electromaps/business_logic/localization_cubit/app_localization.dart';
import 'package:e_electromaps/presentation/screens/home_layout/home_layout.dart';
import 'package:e_electromaps/presentation/screens/login_screen/login_screen.dart';
import 'package:e_electromaps/presentation/widgets/custom_button.dart';
import 'package:e_electromaps/presentation/widgets/default_text_form_field.dart';
import 'package:e_electromaps/styles/colors/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/local/cash_helper.dart';
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
          listener: (context, state) {
            if (state is SignUpSuccessState) {
              phoneController.clear();
              passwordController.clear();
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
                        //                       key: CashHelper.languageKey)
                        //                   .toString() ==
                        //               'en'
                        //           ? const Icon(
                        //               Icons.arrow_back,
                        //               color: ColorManager.white,
                        //             )
                        //           : const Icon(
                        //               Icons.arrow_forward,
                        //               color: ColorManager.white,
                        //             ),
                        //     ),
                        //   ),
                        // ),
                        Image.asset(
                          'assets/images/horizontal_logo.png',
                          // color: ColorManager.primaryColor,
                          width: MediaQuery.sizeOf(context).width * 0.3,
                        ),

                        //name
                        DefaultTextFormField(
                            labelText: AppLocalizations.of(context)!
                                .translate("user_name")
                                .toString(),
                            controller: nameController,
                            textInputType: TextInputType.text),
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.02,
                        ),
                        //phone
                        Row(
                          children: [
                            Expanded(
                              child: CountryCodePicker(
                                alignLeft: true,
                                enabled: false,
                                textOverflow: TextOverflow.visible,
                                textStyle:
                                    Theme.of(context).textTheme.headlineSmall,
                                onChanged: (CountryCode countryCode) {
                                 CashHelper.saveData(
                                          key: "countryCode",
                                          value: countryCode.dialCode??"+966");
                                  debugPrint(
                                      'New Country selected: ${countryCode.dialCode}');
                                },
                                initialSelection: 'SA',
                                dialogSize: Size(
                                    MediaQuery.sizeOf(context).width * 0.8,
                                    MediaQuery.sizeOf(context).height * 0.6),
                                dialogTextStyle:
                                    Theme.of(context).textTheme.headlineSmall,
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

                              // DefaultTextFormField(
                              //
                              //     labelText: AppLocalizations.of(context)!
                              //         .translate("phone_number")
                              //         .toString(),
                              //     controller: phoneController,
                              //     textInputType: TextInputType.phone),
                            ),
                          ],
                        ),
                        //password
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
                          height: MediaQuery.sizeOf(context).height * 0.02,
                        ),
                        state is SignUpLoadingState
                            ? const Center(
                                child: CircularProgressIndicator(
                                  color: ColorManager.primaryColor,
                                ),
                              )
                            : customButton(
                                onTap: () {
                                  if (formKey.currentState!.validate()) {
                                    cubit.createAccountWithFirebaseAuth(
                                        name: nameController.text,
                                        phone: phoneController.text,
                                        password: passwordController.text,
                                        countryCode: CashHelper.getData(
                                            key: "countryCode")??'+966',
                                        context: context);
                                  }
                                },
                                color: ColorManager.primaryColor,
                                width: MediaQuery.sizeOf(context).height * 0.5,
                                title: AppLocalizations.of(context)!
                                    .translate("sign_up")
                                    .toString(),
                                context: context,
                                color2: ColorManager.primaryColor,
                                textColor: ColorManager.white,
                                borderColor: ColorManager.white,
                              ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              AppLocalizations.of(context)!
                                  .translate("already_have_an_account")
                                  .toString(),
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
                                AppLocalizations.of(context)!
                                    .translate("login_now")
                                    .toString(),
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
