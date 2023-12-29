import 'package:e_electromaps/core/local/cash_helper.dart';
import 'package:e_electromaps/presentation/screens/add_station_screens/add_station_6.dart';
import 'package:flutter/material.dart';

import '../../../business_logic/localization_cubit/app_localization.dart';
import '../../../styles/colors/color_manager.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/leave_dialog.dart';

class AddStationFive extends StatelessWidget {
  var howWorkController = TextEditingController();
  var scheduleController = TextEditingController();
  var limitTimeController = TextEditingController();
  var chargingSessionController = TextEditingController();
  var parkingPriceController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  AddStationFive({super.key});

  @override
  Widget build(BuildContext context) {
    var bookingOptionsValue =
        '${AppLocalizations.of(context)!.translate("booking_options").toString()} *';

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
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width,
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Container(
                    //   height: MediaQuery.sizeOf(context).height * .05,
                    //   width: MediaQuery.sizeOf(context).width * .54,
                    //   decoration: BoxDecoration(
                    //       color: ColorManager.grey.withOpacity(0.07),
                    //       borderRadius:
                    //           const BorderRadius.all(Radius.circular(25))),
                    //   child: Center(
                    //       child: Text(
                    //     '${AppLocalizations.of(context)!.translate("more_info").toString()} (${AppLocalizations.of(context)!.translate("step").toString()} 5/6)',
                    //     style:
                    //         Theme.of(context).textTheme.headlineSmall!.copyWith(
                    //               fontSize: 14,
                    //               color: ColorManager.textColor,
                    //             ),
                    //   )),
                    // ),
                    // SizedBox(
                    //   height: MediaQuery.sizeOf(context).height * .05,
                    // ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: TextFormField(
                          controller: howWorkController,
                          decoration: InputDecoration(
                            hintText: AppLocalizations.of(context)!
                                .translate("how_it_works")
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
                      height: MediaQuery.sizeOf(context).height * .04,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: DropdownButtonFormField(
                        decoration: InputDecoration(
                          labelStyle: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(
                                fontSize: 13,
                                color: ColorManager.black,
                              ),
                          hintStyle: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(
                                color: ColorManager.black,
                                fontSize: 13,
                                fontFamily: 'Nunito',
                              ),
                          errorStyle: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(
                                fontSize: 13.0,
                                color: ColorManager.red,
                              ),
                        ),
                        style:
                            Theme.of(context).textTheme.headlineSmall!.copyWith(
                                  fontSize: 16,
                                  color: ColorManager.black,
                                ),
                        value: bookingOptionsValue,
                        validator: (value) {
                          if (value ==
                              "${AppLocalizations.of(context)!.translate("booking_options").toString()} *") {
                            return AppLocalizations.of(context)!
                                .translate("required")
                                .toString();
                          }
                          return null;
                        },
                        hint: Text(
                          "${AppLocalizations.of(context)!.translate("booking_options").toString()} *",
                        ),
                        items: [
                          DropdownMenuItem(
                            value:
                                "${AppLocalizations.of(context)!.translate("booking_options").toString()} *",
                            child: Text(
                                "${AppLocalizations.of(context)!.translate("booking_options").toString()} *",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(
                                        fontSize: 18,
                                        color: ColorManager.textColor)),
                          ),
                          DropdownMenuItem(
                            value: AppLocalizations.of(context)!
                                .translate("cannot_be_booked")
                                .toString(),
                            child: Text(
                                AppLocalizations.of(context)!
                                    .translate("cannot_be_booked")
                                    .toString(),
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(
                                        fontSize: 18,
                                        color: ColorManager.textColor)),
                          ),
                          DropdownMenuItem(
                            value: AppLocalizations.of(context)!
                                .translate("by_email")
                                .toString(),
                            child: Text(
                                AppLocalizations.of(context)!
                                    .translate("by_email")
                                    .toString(),
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(
                                        fontSize: 18,
                                        color: ColorManager.textColor)),
                          ),
                          DropdownMenuItem(
                            value: AppLocalizations.of(context)!
                                .translate("mobile_app")
                                .toString(),
                            child: Text(
                                AppLocalizations.of(context)!
                                    .translate("mobile_App")
                                    .toString(),
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(
                                        fontSize: 18,
                                        color: ColorManager.textColor)),
                          ),
                          DropdownMenuItem(
                            value: AppLocalizations.of(context)!
                                .translate("by_phone")
                                .toString(),
                            child: Text(
                                AppLocalizations.of(context)!
                                    .translate("by_phone")
                                    .toString(),
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(
                                        fontSize: 18,
                                        color: ColorManager.textColor)),
                          ),
                          DropdownMenuItem(
                            value: AppLocalizations.of(context)!
                                .translate("must_contact_before")
                                .toString(),
                            child: Text(
                                AppLocalizations.of(context)!
                                    .translate("must_contact_before")
                                    .toString(),
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(
                                        fontSize: 18,
                                        color: ColorManager.textColor)),
                          ),
                          DropdownMenuItem(
                            value: AppLocalizations.of(context)!
                                .translate(
                                    "contact_before_going_(tel_or_email)")
                                .toString(),
                            child: Text(
                                AppLocalizations.of(context)!
                                    .translate(
                                        "contact_before_going_(tel_or_email)")
                                    .toString(),
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(
                                        fontSize: 18,
                                        color: ColorManager.textColor)),
                          ),
                          DropdownMenuItem(
                            value: AppLocalizations.of(context)!
                                .translate("unknown")
                                .toString(),
                            child: Text(
                                AppLocalizations.of(context)!
                                    .translate("unknown")
                                    .toString(),
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(
                                        fontSize: 18,
                                        color: ColorManager.textColor)),
                          ),
                        ],
                        onChanged: (value) {
                          bookingOptionsValue = value!;
                          print(bookingOptionsValue);
                        },
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * .04,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: TextFormField(
                          controller: scheduleController,
                          decoration: InputDecoration(
                            hintText: AppLocalizations.of(context)!
                                .translate("schedule")
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
                      height: MediaQuery.sizeOf(context).height * .04,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: TextFormField(
                          controller: limitTimeController,
                          decoration: InputDecoration(
                            hintText: AppLocalizations.of(context)!
                                .translate("limit_time")
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
                      height: MediaQuery.sizeOf(context).height * .04,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: TextFormField(
                          controller: chargingSessionController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: AppLocalizations.of(context)!
                                .translate("charging_session_price")
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
                      height: MediaQuery.sizeOf(context).height * .04,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: TextFormField(
                          controller: parkingPriceController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: AppLocalizations.of(context)!
                                .translate("parking_price")
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
                      height: MediaQuery.sizeOf(context).height * .2,
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
                              borderColor: ColorManager.grey.withOpacity(.2), color2: ColorManager.white),
                        ),
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width * .05,
                        ),
                        Expanded(
                          child: customButton(
                              context: context,
                              title: AppLocalizations.of(context)!
                                  .translate("next")
                                  .toString(),
                              onTap: () {
                                if (formKey.currentState!.validate()) {
                                  CashHelper.saveData(
                                      key: 'schedule',
                                      value: scheduleController.text);
                                  CashHelper.saveData(
                                      key: 'howWork',
                                      value: howWorkController.text);
                                  CashHelper.saveData(
                                      key: 'limitTime',
                                      value: limitTimeController.text);
                                  CashHelper.saveData(
                                      key: 'chargingSession',
                                      value: chargingSessionController.text);
                                  CashHelper.saveData(
                                      key: 'parkingPrice',
                                      value: parkingPriceController.text);
                                  CashHelper.saveData(
                                      key: 'bookingOptions',
                                      value: bookingOptionsValue);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => AddStationSix(),
                                      ));
                                }
                              },
                              width: MediaQuery.sizeOf(context).width * .3,
                              color: ColorManager.secondaryColor,
                              textColor: ColorManager.white,
                              borderColor: ColorManager.white, color2: ColorManager.primaryColor),
                        ),
                      ],
                    )
                  ]),
            ),
          ),
        ),
      ),
    ));
  }
}
