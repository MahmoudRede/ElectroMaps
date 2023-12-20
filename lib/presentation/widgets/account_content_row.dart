import 'package:e_electromaps/styles/colors/color_manager.dart';
import 'package:flutter/material.dart';

class AccountContentRow extends StatelessWidget {
  IconData prefixIcon;
  String content;
  Function()? onTap;

    AccountContentRow({required this.content,required this.onTap, required this.prefixIcon, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
          children: [
            Icon(
              prefixIcon,
              color: ColorManager.textColor,
              size: MediaQuery.sizeOf(context).height*.03,
            ),
            SizedBox(width: MediaQuery.sizeOf(context).height*.01,),

            Text(content,style: TextStyle(
              color: ColorManager.textColor,
              fontWeight: FontWeight.w500,
              fontSize: MediaQuery.sizeOf(context).height*.023,
            )),
            const Spacer(),
            Icon(
              Icons.arrow_forward_ios_outlined,
              color: ColorManager.textColor,
              size: MediaQuery.sizeOf(context).height*.023,
            ),
          ]
      ),
    );
  }
}
