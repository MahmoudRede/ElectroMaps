import 'package:e_electromaps/presentation/screens/home_layout/home_layout.dart';
import 'package:e_electromaps/presentation/widgets/custom_button.dart';
import 'package:e_electromaps/styles/colors/color_manager.dart';
import 'package:flutter/material.dart';

import '../../business_logic/localization_cubit/app_localization.dart';

Future<dynamic> closeDialog(BuildContext context) {
  return showAdaptiveDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
          insetPadding: EdgeInsets.symmetric(
              vertical: MediaQuery.sizeOf(context).height * .15,
              horizontal: MediaQuery.sizeOf(context).width * .05),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          backgroundColor: ColorManager.white,
          title: const SizedBox(),
          content: Text(
            '${AppLocalizations.of(context)!.translate("sure_leave").toString()}\n ${AppLocalizations.of(context)!.translate("lose_info").toString()}',
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(fontSize: 18),
            textAlign: TextAlign.center,
            overflow: TextOverflow.visible,
          ),
          actions: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                customButton(
                    context: context,
                    title: AppLocalizations.of(context)!
                        .translate("yes_leave")
                        .toString(),
                    onTap: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(
                        builder: (context) {
                          return const HomeLayout();
                        },
                      ));
                    },
                    width: MediaQuery.sizeOf(context).width,
                    color: ColorManager.secondaryColor,
                    textColor: ColorManager.white,
                    borderColor: ColorManager.white,
                    color2: ColorManager.primaryColor),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * .02,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      AppLocalizations.of(context)!
                          .translate("cancel")
                          .toString(),
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(color: ColorManager.black, fontSize: 18),
                    ))
              ],
            )
          ]);
    },
  );
}
