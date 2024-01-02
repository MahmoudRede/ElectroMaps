import 'package:e_electromaps/business_logic/cubit/app_cubit/app_cubit.dart';
import 'package:e_electromaps/business_logic/cubit/app_states/app_states.dart';
import 'package:e_electromaps/business_logic/localization_cubit/app_localization.dart';
import 'package:e_electromaps/core/local/cash_helper.dart';
import 'package:e_electromaps/presentation/widgets/custom_button.dart';
import 'package:e_electromaps/styles/colors/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

Future<dynamic> stationDetailsBottomSheet(BuildContext context,
    {required int index}) {
  return showModalBottomSheet(
    backgroundColor: ColorManager.white,
    isScrollControlled: false,
    context: context,
    builder: (context) {
      return Container(
        padding: const EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  height: MediaQuery.sizeOf(context).height * 0.007,
                  width: MediaQuery.sizeOf(context).width * .2,
                  decoration: BoxDecoration(
                    color: ColorManager.primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.02,
              ),
              Center(
                child: Text(
                  AppLocalizations.of(context)!
                      .translate("charging_station_info")
                      .toString(),
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        color: ColorManager.primaryColor,
                      ),
                ),
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.01,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BlocConsumer<AppCubit, AppStates>(
                    listener: (context, state) {
                      // TODO: implement listener
                    },
                    builder: (context, state) {
                      var cubit = AppCubit.get(context);
                      return IconButton(
                          onPressed: () {
                            cubit.insertDatabase(
                              name: cubit
                                  .stationList[index]
                                  .stationName
                                  .toString(),
                              address: cubit
                                  .stationList[index]
                                  .address
                                  .toString(),
                              lat: cubit
                                  .stationList[index]
                                  .langitude
                                  .toString(),
                              long: cubit
                                  .stationList[index]
                                  .latitude
                                  .toString(),
                              context: context,
                            ).then((value) => {
                            cubit.changeFavoriteColorToTrue(name: cubit
                                .stationList[index]
                                .stationName
                                .toString(),),
                                cubit.switchBetweenOrderAndFavorite(),
                            });

                          },
                          icon: Icon(
                            CashHelper.getData(key: 'name') == true
                                ? Icons.favorite
                                : Icons.favorite_border_rounded,
                            size: MediaQuery.sizeOf(context).width * .08,
                            color: CashHelper.getData(key: 'name') == true
                                ? ColorManager.red
                                : ColorManager.grey,
                          ));
                    },
                  ),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * .02,
                  ),
                  Align(
                    alignment: CashHelper.getData(key: CashHelper.languageKey)
                                .toString() ==
                            'en'
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: customButton(
                        context: context,
                        title: AppLocalizations.of(context)!
                            .translate("get_direction")
                            .toString(),
                        onTap: () {
                          launchUrl(Uri.parse(
                              "https://www.google.com/maps/search/?api=1&query=${AppCubit.get(context).stationList[index].langitude.toString()}+"
                              "${AppCubit.get(context).stationList[index].latitude.toString()}"));
                        },
                        width: MediaQuery.sizeOf(context).width * .33,
                        color: ColorManager.primaryColor,
                        color2: ColorManager.primaryColor,
                        textColor: ColorManager.white,
                        borderColor: ColorManager.white),
                  ),
                ],
              ),
              // Station Name
              Text(
                AppLocalizations.of(context)!
                    .translate("charging_station_name")
                    .toString(),
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: ColorManager.primaryColor,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.01,
              ),
              Text(
                AppCubit.get(context).stationList[index].stationName ??
                    "Empty field",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const Divider(),

              // Station Address
              Text(
                AppLocalizations.of(context)!.translate("address").toString(),
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: ColorManager.primaryColor,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.01,
              ),
              Text(
                AppCubit.get(context).stationList[index].address!,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const Divider(),
              // number
              Text(
                AppLocalizations.of(context)!.translate("number").toString(),
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: ColorManager.primaryColor,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.01,
              ),
              Text(
                AppCubit.get(context).stationList[index].number!,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const Divider(),

              //how to get there
              Text(
                AppLocalizations.of(context)!
                    .translate("how_to_get_there")
                    .toString(),
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: ColorManager.primaryColor,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.01,
              ),
              AppCubit.get(context).stationList[index].where == ""
                  ? Text(
                      AppLocalizations.of(context)!
                          .translate("empty_field")
                          .toString(),
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(color: ColorManager.red),
                    )
                  : Text(
                      AppCubit.get(context).stationList[index].where!,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
              const Divider(),

              // Station Type
              Text(
                AppLocalizations.of(context)!
                    .translate("station_charging_type")
                    .toString(),
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: ColorManager.primaryColor,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.01,
              ),
              AppCubit.get(context).stationList[index].stationType ==
                      "${AppLocalizations.of(context)!.translate("station_charging_type").toString()} *"
                  ? Text(
                      AppLocalizations.of(context)!
                          .translate("empty_field")
                          .toString(),
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(color: ColorManager.red),
                    )
                  : Text(
                      AppCubit.get(context).stationList[index].stationType!,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
              const Divider(),

              // Station Status
              Text(
                AppLocalizations.of(context)!
                    .translate("station_charging_status")
                    .toString(),
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: ColorManager.primaryColor,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.01,
              ),
              AppCubit.get(context).stationList[index].stationStatus ==
                      "${AppLocalizations.of(context)!.translate("station_charging_status").toString()} *"
                  ? Text(
                      AppLocalizations.of(context)!
                          .translate("empty_field")
                          .toString(),
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(color: ColorManager.red),
                    )
                  : Text(
                      AppCubit.get(context).stationList[index].stationStatus!,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
              const Divider(),

              // Energy Source
              Text(
                AppLocalizations.of(context)!
                    .translate("energy_source")
                    .toString(),
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: ColorManager.primaryColor,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.01,
              ),
              AppCubit.get(context).stationList[index].energySource ==
                      "${AppLocalizations.of(context)!.translate("energy_source").toString()} *"
                  ? Text(
                      AppLocalizations.of(context)!
                          .translate("empty_field")
                          .toString(),
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(color: ColorManager.red),
                    )
                  : Text(
                      AppCubit.get(context).stationList[index].energySource!,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.01,
              ),

              //connector info
              Center(
                child: Text(
                  AppLocalizations.of(context)!
                      .translate("connector_info")
                      .toString(),
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        color: ColorManager.primaryColor,
                      ),
                ),
              ),
              Text(
                AppLocalizations.of(context)!.translate("format").toString(),
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: ColorManager.primaryColor,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.01,
              ),
              AppCubit.get(context).stationList[index].format ==
                      "${AppLocalizations.of(context)!.translate("empty_field").toString()} *"
                  ? Text(
                      AppLocalizations.of(context)!
                          .translate("empty_field")
                          .toString(),
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(color: ColorManager.red),
                    )
                  : Text(
                      AppCubit.get(context).stationList[index].format!,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
              const Divider(),
              // power
              Text(
                AppLocalizations.of(context)!.translate("power").toString(),
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: ColorManager.primaryColor,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.01,
              ),
              AppCubit.get(context).stationList[index].power == ""
                  ? Text(
                      AppLocalizations.of(context)!
                          .translate("empty_field")
                          .toString(),
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(color: ColorManager.red),
                    )
                  : Text(
                      "${AppCubit.get(context).stationList[index].power!} (KW)",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
              const Divider(),
              //intensity
              Text(
                AppLocalizations.of(context)!.translate("intensity").toString(),
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: ColorManager.primaryColor,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.01,
              ),
              AppCubit.get(context).stationList[index].intensity == ""
                  ? Text(
                      AppLocalizations.of(context)!
                          .translate("empty_field")
                          .toString(),
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(color: ColorManager.red),
                    )
                  : Text(
                      "${AppCubit.get(context).stationList[index].intensity!} (A)",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
              const Divider(),
              // voltage
              Text(
                AppLocalizations.of(context)!.translate("voltage").toString(),
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: ColorManager.primaryColor,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.01,
              ),
              AppCubit.get(context).stationList[index].voltage == ""
                  ? Text(
                      AppLocalizations.of(context)!
                          .translate("empty_field")
                          .toString(),
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(color: ColorManager.red),
                    )
                  : Text(
                      "${AppCubit.get(context).stationList[index].voltage!} (V)",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
            ],
          ),
        ),
      );
    },
  );
}
