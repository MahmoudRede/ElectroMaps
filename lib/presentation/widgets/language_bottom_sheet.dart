import 'package:e_electromaps/business_logic/localization_cubit/app_localization.dart';
import 'package:flutter/material.dart';

import '../../business_logic/localization_cubit/localization_cubit.dart';
import '../../core/local/cash_helper.dart';
import '../../styles/colors/color_manager.dart';

Future<dynamic> languageBottomSheet(BuildContext context) {
  return showModalBottomSheet(
      backgroundColor: ColorManager.primaryColor,
      context: context,
      builder: (context) {
        return Container(
            padding: const EdgeInsets.all(15),
            height: MediaQuery.of(context).size.height * .15,
            width: MediaQuery.of(context).size.width,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () {
                        if (CashHelper.getData(key: CashHelper.languageKey)
                                .toString() ==
                            'en') {
                          LocalizationCubit.get(context)
                              .changeLanguage(code: 'ar');
                          Navigator.pop(context);
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            AppLocalizations.of(context)!
                                .translate("arabic")
                                .toString(),
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                  color: ColorManager.white,
                                  fontSize: 17.0,
                                ),
                          ),
                          (CashHelper.getData(key: CashHelper.languageKey)
                                      .toString() ==
                                  'ar')
                              ? const Icon(
                                  Icons.check,
                                  color: ColorManager.white,
                                )
                              : Container(),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () {
                        if (CashHelper.getData(key: CashHelper.languageKey)
                                .toString() ==
                            'ar') {
                          LocalizationCubit.get(context)
                              .changeLanguage(code: 'en');
                          Navigator.pop(context);
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            AppLocalizations.of(context)!
                                .translate("english")
                                .toString(),
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                              color: ColorManager.white,

                              fontSize: 17.0,
                                ),
                          ),
                          (CashHelper.getData(key: CashHelper.languageKey)
                                      .toString() ==
                                  'en')
                              ? const Icon(Icons.check,
                            color: ColorManager.white,
                          )
                              : Container(),
                        ],
                      ),
                    ),
                  ),
                ]));
      });
}
