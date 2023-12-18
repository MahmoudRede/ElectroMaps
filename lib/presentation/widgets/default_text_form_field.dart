// import 'package:e_electromaps/styles/colors/color_manager.dart';
// import 'package:flutter/material.dart';
//
// class EmailTextFormField extends StatelessWidget {
//
//     TextEditingController emailController;
//     EmailTextFormField({required this.emailController, super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return  Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: TextFormField(
//         controller: emailController,
//         textInputAction:  TextInputAction.next,
//         keyboardType: TextInputType.emailAddress,
//         cursorColor: ColorManager.primaryColor,
//         maxLines: 1,
//         style: Theme.of(context).textTheme.headlineMedium!.copyWith(
//           color: ColorManager.black,
//           fontSize: 16
//         ),
//         decoration:   InputDecoration(
//           labelText: 'Email *',
//            labelStyle: Theme.of(context).textTheme.headlineSmall!.copyWith(
//              color: ColorManager.primaryColor,
//              fontSize: 16,
//            ),
//         )
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import '../../styles/colors/color_manager.dart';

class DefaultTextFormField extends StatefulWidget {
  final String hintText;
  final String labelText;
  IconData? prefixIcon;
  IconData? suffixIcon;
  bool isPass;
  String value;
  int? lines;
  Color? hintColor;
  TextInputType textInputType;
  bool isEnabled;
  TextEditingController controller = TextEditingController();

  DefaultTextFormField(
      { this.hintText='',
        required this.controller,
        this.hintColor = Colors.grey,
        this.isPass = false,
        this.isEnabled = true,
        required this.textInputType,
       required this.labelText,
        this.value = '',
        this.prefixIcon,
        this.suffixIcon,
        this.lines = 1,
        Key? key})
      : super(key: key);

  @override
  State<DefaultTextFormField> createState() => _DefaultTextFormFieldState();
}

class _DefaultTextFormFieldState extends State<DefaultTextFormField> {
  bool isChecked = true;

  @override
  Widget build(BuildContext context) {
    return widget.isPass == false
        ? TextFormField(
          textInputAction: TextInputAction.next,
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
            fontSize: 15.0,
            color: ColorManager.black,
          ),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            labelText: widget.labelText,
            labelStyle:Theme.of(context).textTheme.headlineSmall!.copyWith(
              fontSize: 16.0,
              color: ColorManager.black,
            ),
            errorStyle: Theme.of(context).textTheme.headlineSmall!.copyWith(
              fontSize: 13.0,
              color: ColorManager.red,
            ),

          ),
          maxLines: widget.lines,
          keyboardType: widget.textInputType,
          controller: widget.controller,
          enabled: widget.isEnabled,
          onChanged: (value) {
            widget.value = value;
          },
          validator: (value) {
            if (value!.isEmpty) {
              return 'Required field';
            }
            return null;
          },
        )
        : TextFormField(
          textInputAction: TextInputAction.done,
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
            fontSize: 15.0,
            color: ColorManager.black,

          ),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              labelText: widget.labelText,
              labelStyle: Theme.of(context).textTheme.headlineSmall!.copyWith(
                fontSize: 16.0,
                color: ColorManager.black,
              ),
              errorStyle: Theme.of(context).textTheme.headlineSmall!.copyWith(
                fontSize: 15.0,
                color: ColorManager.red,
              ),
              suffixIcon: widget.isPass == true
                  ? IconButton(
                onPressed: () {
                  setState(() {
                    isChecked = !isChecked;
                  });
                },
                icon: isChecked == true
                    ? const Icon(
                  Icons.visibility_off,
                  color: ColorManager.primaryColor,
                )
                    : const Icon(
                  Icons.visibility,
                  color: ColorManager.primaryColor,
                ),
              )
                  : IconButton(
                onPressed: () {},
                icon: widget.suffixIcon != null
                    ? Icon(
                  widget.suffixIcon,
                  color: ColorManager.primaryColor,
                )
                    : const SizedBox(
                  height: 1,
                  width: 1,
                ),
              )),
          keyboardType: widget.textInputType,
          controller: widget.controller,
          enabled: widget.isEnabled,
          obscureText: isChecked,
          onChanged: (value) {
            widget.value = value;
          },
          validator: (value) {
            if (value!.isEmpty) {
              return 'Required field';
            }
            return null;
          },
        );
  }
}
