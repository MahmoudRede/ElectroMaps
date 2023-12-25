import 'package:e_electromaps/business_logic/localization_cubit/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../styles/colors/color_manager.dart';

class PinTextField extends StatefulWidget {
  String value;
  TextEditingController passwordController;

  PinTextField({this.value = '', required this.passwordController, super.key});

  @override
  State<PinTextField> createState() => _PinTextFieldState();
}

class _PinTextFieldState extends State<PinTextField> {
  late String pinCode;

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      errorTextSpace: MediaQuery.sizeOf(context).height * 0.025,
      appContext: context,
      autoFocus: false,
      controller: widget.passwordController,
      onChanged: (value) {
        widget.value = value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          return AppLocalizations.of(context)!.translate("required").toString();
        }
        return null;
      },
      cursorColor: ColorManager.primaryColor,
      keyboardType: TextInputType.number,
      autoDismissKeyboard: true,
      blinkWhenObscuring: true,
      length: 6,
      hintCharacter: '_',
      textStyle: Theme.of(context).textTheme.headlineSmall!.copyWith(
            color: ColorManager.textColor,
            fontSize: 16,
          ),
      hintStyle: TextStyle(
        color: ColorManager.grey,
        fontSize: 15,
        fontWeight: FontWeight.bold,
      ),
      obscureText: true,
      obscuringCharacter: "*",
      animationType: AnimationType.scale,
      pinTheme: PinTheme(
        errorBorderColor: ColorManager.red,
        selectedColor: ColorManager.primaryColor,
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(10),
        fieldHeight: MediaQuery.sizeOf(context).height * 0.062,
        fieldWidth: MediaQuery.sizeOf(context).width * 0.12,
        fieldOuterPadding: const EdgeInsets.symmetric(horizontal: 5),
        disabledColor: Colors.white,
        activeColor: ColorManager.grey,
        inactiveColor: ColorManager.grey,
        inactiveFillColor: Colors.white,
        activeFillColor: ColorManager.white,
        selectedFillColor: Colors.white,
      ),
      animationDuration: const Duration(milliseconds: 200),
      backgroundColor: Colors.white,
      enableActiveFill: true,
      onCompleted: (submittedCode) {
        pinCode = submittedCode;
      },
    );
  }
}
