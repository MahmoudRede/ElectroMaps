import 'package:e_electromaps/business_logic/localization_cubit/app_localization.dart';
import 'package:e_electromaps/presentation/widgets/custom_button.dart';
import 'package:e_electromaps/styles/colors/color_manager.dart';
import 'package:flutter/material.dart';

import '../../business_logic/cubit/app_cubit/app_cubit.dart';
import '../../core/local/cash_helper.dart';
import '../screens/login_screen/login_screen.dart';

Future<dynamic> confirmDeleteDialog(BuildContext context) {
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
            AppLocalizations.of(context)!.translate("sure_delete_account").toString(),
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
                    title:  AppLocalizations.of(context)!.translate("yes_delete").toString(),
                    onTap: () {
                      AppCubit.get(context)
                          .deleteUser(
                          id: '${CashHelper.getData(key: "isUid")}',
                          context: context)
                          .then(
                            (value) => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                            const LoginScreen(),
                          ),
                        ),
                      );
                    },
                    width: MediaQuery.sizeOf(context).width,
                    color: ColorManager.red,
                    textColor: ColorManager.white,
                    borderColor: ColorManager.red,
                    color2: ColorManager.red),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * .02,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      AppLocalizations.of(context)!.translate("cancel").toString(),
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
