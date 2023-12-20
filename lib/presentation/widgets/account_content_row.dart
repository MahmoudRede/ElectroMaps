import 'package:e_electromaps/styles/colors/color_manager.dart';
import 'package:flutter/material.dart';

class AccountContentRow extends StatelessWidget {
  IconData prefixIcon;
  String content;
  Function()? onTap;
  bool isLogout = false;

    AccountContentRow({required this.isLogout, required this.content,required this.onTap, required this.prefixIcon, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
          children: [
            Icon(
              prefixIcon,
              color: isLogout==false ? ColorManager.textColor: ColorManager.red,
              size: MediaQuery.sizeOf(context).height*.03,
            ),
            SizedBox(width: MediaQuery.sizeOf(context).height*.01,),

            Text(content,style: TextStyle(
              color: isLogout==false ? ColorManager.textColor: ColorManager.red,
              fontWeight: FontWeight.w500,
              fontSize: MediaQuery.sizeOf(context).height*.023,
            )),
            const Spacer(),
            Icon(
              Icons.arrow_forward_ios_outlined,
              color: isLogout==false ? ColorManager.textColor: ColorManager.red,
              size: MediaQuery.sizeOf(context).height*.023,
            ),
          ]
      ),
    );
  }
}
