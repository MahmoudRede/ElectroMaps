import 'package:e_electromaps/business_logic/cubit/app_cubit/app_cubit.dart';
import 'package:e_electromaps/business_logic/cubit/app_states/app_states.dart';
import 'package:e_electromaps/core/local/cash_helper.dart';
import 'package:e_electromaps/presentation/screens/home_layout/home_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../business_logic/localization_cubit/app_localization.dart';
import '../../../styles/colors/color_manager.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_toast.dart';
import '../../widgets/leave_dialog.dart';

class AddStationSix extends StatelessWidget {
  var proprietaryController = TextEditingController();
  var emailController = TextEditingController();
  var phoneNumberController = TextEditingController();

  AddStationSix({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            AppLocalizations.of(context)!
                .translate("new_charging_station")
                .toString(),
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .copyWith(color: ColorManager.white),
          ),
          leading: CloseButton(
            onPressed: () {
              closeDialog(context);
            },
            color: ColorManager.white,
          ),
        ),
        body: BlocConsumer<AppCubit, AppStates>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            var cubit=AppCubit.get(context);
            return Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                height: MediaQuery.sizeOf(context).height,
                width: MediaQuery.sizeOf(context).width,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Container(
                      //   height: MediaQuery.sizeOf(context).height * .05,
                      //   width: MediaQuery.sizeOf(context).width * .56,
                      //   decoration: BoxDecoration(
                      //       color: ColorManager.grey.withOpacity(0.07),
                      //       borderRadius:
                      //           const BorderRadius.all(Radius.circular(25))),
                      //   child: Center(
                      //       child: Text(
                      //     '${AppLocalizations.of(context)!.translate("contact_info").toString()} (${AppLocalizations.of(context)!.translate("step").toString()} 6/6)',
                      //     style:
                      //         Theme.of(context).textTheme.headlineSmall!.copyWith(
                      //               fontSize: 14,
                      //               color: ColorManager.textColor,
                      //             ),
                      //   )),
                      // ),
                      // SizedBox(
                      //   height: MediaQuery.sizeOf(context).height * .07,
                      // ),
                      Align(
                        alignment:
                            CashHelper.getData(key: CashHelper.languageKey)
                                        .toString() ==
                                    'ar'
                                ? Alignment.centerRight
                                : Alignment.centerLeft,
                        child: Text(
                          AppLocalizations.of(context)!
                              .translate("owner_related_information")
                              .toString(),
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(
                                  fontSize: 14,
                                  color: ColorManager.black,
                                  fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * .03,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: TextFormField(
                            controller: proprietaryController,
                            textInputAction:  TextInputAction.next,
                            decoration: InputDecoration(
                              hintText: AppLocalizations.of(context)!
                                  .translate("proprietary")
                                  .toString(),
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(
                                    fontSize: 18,
                                    color: ColorManager.textColor,
                                  ),
                            )),
                      ),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * .03,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: TextFormField(
                            controller: emailController,
                            textInputAction:  TextInputAction.next,
                            decoration: InputDecoration(
                              hintText: AppLocalizations.of(context)!
                                  .translate("email")
                                  .toString(),
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(
                                    fontSize: 18,
                                    color: ColorManager.textColor,
                                  ),
                            )),
                      ),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * .03,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: TextFormField(
                            controller: phoneNumberController,
                            keyboardType: TextInputType.phone,
                            textInputAction:  TextInputAction.done,
                            decoration: InputDecoration(
                              hintText: AppLocalizations.of(context)!
                                  .translate("phone_number")
                                  .toString(),
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(
                                    fontSize: 18,
                                    color: ColorManager.textColor,
                                  ),
                            )),
                      ),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * .44,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: customButton(
                                context: context,
                                title: AppLocalizations.of(context)!
                                    .translate("previous")
                                    .toString(),
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                width: MediaQuery.sizeOf(context).width * .3,
                                color: ColorManager.white,
                                textColor: ColorManager.black,
                                borderColor: ColorManager.grey.withOpacity(.2),
                                color2: ColorManager.white),
                          ),
                          SizedBox(
                            width: MediaQuery.sizeOf(context).width * .05,
                          ),
                          Expanded(
                            child: customButton(
                                context: context,
                                title: AppLocalizations.of(context)!
                                    .translate("finish")
                                    .toString(),
                                onTap: () {
                                  CashHelper.saveData(
                                      key: 'proprietary',
                                      value: proprietaryController.text);
                                  CashHelper.saveData(
                                      key: 'email',
                                      value: emailController.text);
                                  CashHelper.saveData(
                                      key: 'phoneNumber',
                                      value: phoneNumberController.text);

                                  AppCubit.get(context)
                                      .updateStationDetails(context,
                                          stationId: cubit.stationList[cubit.stationIndex!].stationId!,
                                          chargingSession: CashHelper.getData(key: "chargingSession"),
                                          email: CashHelper.getData(key: "email"),
                                          format: CashHelper.getData(key: "format"),
                                          howWork: CashHelper.getData(key: "howWork"),
                                          intensity: CashHelper.getData(key: "intensity"),
                                          limitTime: CashHelper.getData(key: "limitTime"),
                                          parkingPrice: CashHelper.getData(key: "parkingPrice"),
                                          phoneNumber: CashHelper.getData(key: "phoneNumber"),
                                          proprietary: CashHelper.getData(key: "proprietary"),
                                          schedule: CashHelper.getData(key: "schedule"),
                                          typeCurrent: CashHelper.getData(key: "typeCurrent"),
                                          voltage: CashHelper.getData(key: "voltage"),
                                          connectorType: CashHelper.getData(key: "connectorType"),
                                          power: CashHelper.getData(key: "power"),
                                          bookingOptions: CashHelper.getData(key: "bookingOptions"),
                                          )
                                      .then((value) {
                                    customToast(
                                        title: AppLocalizations.of(context)!
                                            .translate(
                                                "station_added_successfully")
                                            .toString(),
                                        color: ColorManager.primaryColor);

                                    AppCubit.get(context).getStationFromFire();
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const HomeLayout(),
                                      ),
                                    );
                                  });
                                },
                                width: MediaQuery.sizeOf(context).width * .3,
                                color: ColorManager.primaryColor,
                                textColor: ColorManager.white,
                                borderColor: ColorManager.white,
                                color2: ColorManager.primaryColor),
                          ),
                        ],
                      )
                    ],
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
