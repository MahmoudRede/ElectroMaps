

import 'package:e_electromaps/business_logic/cubit/app_cubit/app_cubit.dart';
import 'package:e_electromaps/business_logic/cubit/app_states/app_states.dart';
import 'package:e_electromaps/core/local/cash_helper.dart';
import 'package:e_electromaps/presentation/screens/new_charging_station_screens/new_charging_station_2.dart';
import 'package:e_electromaps/presentation/widgets/custom_button.dart';
import 'package:e_electromaps/presentation/widgets/default_text_form_field.dart';
import 'package:e_electromaps/styles/colors/color_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../business_logic/localization_cubit/app_localization.dart';
import '../../widgets/leave_dialog.dart';

class NewChargingStationScreen1 extends StatefulWidget {
  const NewChargingStationScreen1({Key? key}) : super(key: key);

  @override
  State<NewChargingStationScreen1> createState() =>
      _NewChargingStationScreen1State();
}

class _NewChargingStationScreen1State extends State<NewChargingStationScreen1> {
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    var nameController = TextEditingController();


    var stationTypeValue = '${AppLocalizations.of(context)!.translate("station_charging_type").toString()} *';
    var stationStatusValue = '${AppLocalizations.of(context)!.translate("station_charging_status").toString()} *';
    var energySourceValue = '${AppLocalizations.of(context)!.translate("energy_source").toString()} *';

    var typeList = [
      DropdownMenuItem(
          value:
              '${AppLocalizations.of(context)!.translate("station_charging_type").toString()} *',
          child: Text(
              '${AppLocalizations.of(context)!.translate("station_charging_type").toString()} *')),
      DropdownMenuItem(
          value:
              AppLocalizations.of(context)!.translate("public_road").toString(),
          child: Text(
              '${AppLocalizations.of(context)!.translate("public_road").toString()} ')),
      DropdownMenuItem(
          value: AppLocalizations.of(context)!.translate("parking").toString(),
          child: Text(
              '${AppLocalizations.of(context)!.translate("parking").toString()} ')),
      DropdownMenuItem(
          value: AppLocalizations.of(context)!.translate("airport").toString(),
          child: Text(
              '${AppLocalizations.of(context)!.translate("airport").toString()} ')),
      DropdownMenuItem(
          value: AppLocalizations.of(context)!.translate("camping").toString(),
          child: Text(
              '${AppLocalizations.of(context)!.translate("camping").toString()} ')),
      DropdownMenuItem(
          value: AppLocalizations.of(context)!.translate("hotel").toString(),
          child: Text(
              AppLocalizations.of(context)!.translate("hotel").toString())),
      DropdownMenuItem(
          value: AppLocalizations.of(context)!.translate("private").toString(),
          child: Text(
              AppLocalizations.of(context)!.translate("private").toString())),
      DropdownMenuItem(
          value:
              AppLocalizations.of(context)!.translate("restaurant").toString(),
          child: Text(AppLocalizations.of(context)!
              .translate("restaurant")
              .toString())),
      DropdownMenuItem(
          value: AppLocalizations.of(context)!.translate("shop").toString(),
          child:
              Text(AppLocalizations.of(context)!.translate("shop").toString())),
      DropdownMenuItem(
          value: AppLocalizations.of(context)!.translate("workshop").toString(),
          child: Text(
              AppLocalizations.of(context)!.translate("workshop").toString())),
      DropdownMenuItem(
          value: AppLocalizations.of(context)!
              .translate("service_station")
              .toString(),
          child: Text(AppLocalizations.of(context)!
              .translate("service_station")
              .toString())),
      DropdownMenuItem(
          value:
              AppLocalizations.of(context)!.translate("car_dealer").toString(),
          child: Text(AppLocalizations.of(context)!
              .translate("car_dealer")
              .toString())),
      DropdownMenuItem(
          value: AppLocalizations.of(context)!.translate("mall").toString(),
          child:
              Text(AppLocalizations.of(context)!.translate("mall").toString())),
      DropdownMenuItem(
          value: AppLocalizations.of(context)!
              .translate("private_user")
              .toString(),
          child: Text(AppLocalizations.of(context)!
              .translate("private_user")
              .toString())),
      DropdownMenuItem(
          value: AppLocalizations.of(context)!.translate("taxi").toString(),
          child:
              Text(AppLocalizations.of(context)!.translate("taxi").toString())),
    ];

    var statusList = [
      DropdownMenuItem(
          value:
              '${AppLocalizations.of(context)!.translate("station_charging_status").toString()} *',
          child: Text(
              '${AppLocalizations.of(context)!.translate("station_charging_status").toString()} *')),
      DropdownMenuItem(
          value: AppLocalizations.of(context)!.translate("working").toString(),
          child: Text(
              AppLocalizations.of(context)!.translate("working").toString())),
      DropdownMenuItem(
          value: AppLocalizations.of(context)!
              .translate("some_stations_dont_work")
              .toString(),
          child: Text(AppLocalizations.of(context)!
              .translate("some_stations_dont_work")
              .toString())),
      DropdownMenuItem(
          value:
              AppLocalizations.of(context)!.translate("not_working").toString(),
          child: Text(AppLocalizations.of(context)!
              .translate("not_working")
              .toString())),
      DropdownMenuItem(
          value: AppLocalizations.of(context)!.translate("unknown").toString(),
          child: Text(
              AppLocalizations.of(context)!.translate("unknown").toString())),
    ];

    var energySourceList = [
      DropdownMenuItem(
          value:
              '${AppLocalizations.of(context)!.translate("energy_source").toString()} *',
          child: Text(
              '${AppLocalizations.of(context)!.translate("energy_source").toString()} *')),
      DropdownMenuItem(
          value:
              AppLocalizations.of(context)!.translate("renewable").toString(),
          child: Text(
              AppLocalizations.of(context)!.translate("renewable").toString())),
      DropdownMenuItem(
          value: AppLocalizations.of(context)!
              .translate("not_renewable")
              .toString(),
          child: Text(AppLocalizations.of(context)!
              .translate("not_renewable")
              .toString())),
      DropdownMenuItem(
          value: AppLocalizations.of(context)!.translate("unknown").toString(),
          child: Text(
              AppLocalizations.of(context)!.translate("unknown").toString())),
    ];

    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            leading: CloseButton(
              onPressed: () {
                closeDialog(context);
              },
              color: ColorManager.white,
            ),
            backgroundColor: ColorManager.primaryColor,
            title: Text(
              AppLocalizations.of(context)!.translate("new_charging_station").toString(),
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(color: Colors.white),
            ),
          ),
          body: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.sizeOf(context).height * 0.045,
                    margin:
                        EdgeInsets.all(MediaQuery.sizeOf(context).width * 0.05),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: ColorManager.grey.withOpacity(0.02),
                    ),
                    child: Center(
                        child: Text(
                      '${AppLocalizations.of(context)!.translate("charging_station_info").toString()}(${AppLocalizations.of(context)!.translate("step")} 1/6)',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(color: ColorManager.textColor),
                    )),
                  ),

                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.005,
                  ),

                  Text(
                    AppLocalizations.of(context)!.translate("add_new_charging_station").toString(),
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),

                  Image.asset(
                    'assets/images/add_new_charging_station_image1.jpg',
                    width: double.infinity,
                    height: MediaQuery.sizeOf(context).height * 0.2,
                  ),

                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.001,
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.sizeOf(context).height * 0.02),
                    child: DefaultTextFormField(
                        controller: nameController,
                        textInputType: TextInputType.name,
                        labelText: '${AppLocalizations.of(context)!.translate("charging_station_name").toString()} *'),
                  ),

                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.01,
                  ),

                  /// Station Charging Type
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.sizeOf(context).height * 0.012),
                    child: DropdownButtonFormField(
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        labelStyle:
                            Theme.of(context).textTheme.headlineSmall!.copyWith(
                                  fontSize: 13,
                                  color: ColorManager.black,
                                ),
                        hintStyle:
                            Theme.of(context).textTheme.headlineSmall!.copyWith(
                                  color: ColorManager.black,
                                  fontSize: 13,
                                  fontFamily: 'Nunito',
                                ),
                        errorStyle:
                            Theme.of(context).textTheme.headlineSmall!.copyWith(
                                  fontSize: 13.0,
                                  color: ColorManager.red,
                                ),
                      ),
                      style:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                fontSize: 16,
                                color: ColorManager.black,
                              ),
                      value: stationTypeValue,
                      validator: (value) {
                        if (value == '${AppLocalizations.of(context)!.translate("station_charging_type").toString()} *') {
                          return AppLocalizations.of(context)!.translate("required").toString();
                        }
                        return null;
                      },
                      hint:   Text(
                        '${AppLocalizations.of(context)!.translate("station_charging_type").toString()} *',
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      items: typeList,
                      onChanged: (value) {
                       stationTypeValue = value!;
                      },
                    ),
                  ),

                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.01,
                  ),

                  /// Station Charging Status
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.sizeOf(context).height * 0.012),
                    child: DropdownButtonFormField(
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        labelStyle:
                            Theme.of(context).textTheme.headlineSmall!.copyWith(
                                  fontSize: 13,
                                  color: ColorManager.black,
                                ),
                        hintStyle:
                            Theme.of(context).textTheme.headlineSmall!.copyWith(
                                  color: ColorManager.black,
                                  fontSize: 13,
                                  fontFamily: 'Nunito',
                                ),
                        errorStyle:
                            Theme.of(context).textTheme.headlineSmall!.copyWith(
                                  fontSize: 13.0,
                                  color: ColorManager.red,
                                ),
                      ),
                      style:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                fontSize: 16,
                                color: ColorManager.black,
                              ),
                      value: stationStatusValue,
                      validator: (value) {
                        if (value ==
                            '${AppLocalizations.of(context)!.translate("station_charging_status").toString()} *') {
                          return AppLocalizations.of(context)!.translate("required").toString();
                        }
                        return null;
                      },
                      hint: Text(
                        '${AppLocalizations.of(context)!.translate("station_charging_status").toString()} *',
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      items: statusList,
                      onChanged: (value) {
                         stationStatusValue = value!;
                      },
                    ),
                  ),

                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.01,
                  ),

                  /// Energy Source
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.sizeOf(context).height * 0.012),
                    child: DropdownButtonFormField(
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        labelStyle:
                            Theme.of(context).textTheme.headlineSmall!.copyWith(
                                  fontSize: 13,
                                  color: ColorManager.black,
                                ),
                        hintStyle:
                            Theme.of(context).textTheme.headlineSmall!.copyWith(
                                  color: ColorManager.black,
                                  fontSize: 13,
                                  fontFamily: 'Nunito',
                                ),
                        errorStyle:
                            Theme.of(context).textTheme.headlineSmall!.copyWith(
                                  fontSize: 13.0,
                                  color: ColorManager.red,
                                ),
                      ),
                      style:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                fontSize: 16,
                                color: ColorManager.black,
                              ),
                      value:  energySourceValue,
                      validator: (value) {
                        if (value == "${AppLocalizations.of(context)!.translate("energy_source").toString()} *") {
                          return AppLocalizations.of(context)!.translate("required").toString();
                        }
                        return null;
                      },
                      hint:   Text(
                        "${AppLocalizations.of(context)!.translate("energy_source").toString()} *",
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      items: energySourceList,
                      onChanged: (value) {
                         energySourceValue = value!;
                      },
                    ),
                  ),

                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.17,
                  ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  customButton(
                      borderColor: ColorManager.white,context: context, title: 'Next',
                      onTap: () async{
                        print( stationTypeValue);
                        print( stationStatusValue);
                        print( energySourceValue);
                        if(formKey.currentState!.validate()){
                          print( stationTypeValue);
                          print( stationStatusValue);
                          print( energySourceValue);
                          CashHelper.saveData(key: 'stationName', value: nameController.text);
                          CashHelper.saveData(key: 'stationType', value: stationTypeValue);
                          CashHelper.saveData(key: 'stationStatus', value: stationStatusValue);
                          CashHelper.saveData(key: 'energySource', value: energySourceValue);
                          print(CashHelper.getData(key: 'stationName'));
                          print(CashHelper.getData(key: 'stationType'));
                          print(CashHelper.getData(key: 'stationStatus'));
                          print(CashHelper.getData(key: 'energySource'));
                          await cubit.requestLocationPermission(context);
                          await cubit.getCurrentPosition();
                          cubit.currentPositionAddStation =  await cubit.getCurrentPositionAddStation();
                          Navigator.push(context, MaterialPageRoute(builder: (context) =>const  NewChargingStationScreen2(), ));
                        }
                      },
                      width: MediaQuery.sizeOf(context).width * 0.3, color: ColorManager.secondaryColor, textColor:Colors.white,
                      color2:ColorManager.primaryColor ),
                ],
              ),



            ),


                  // padding: const EdgeInsets.symmetric(horizontal: 10),
                  // items: cubit.energySourceList,
                  // onChanged: (value) {
                  //
                  //   cubit.energySourceValue=value!;
                  //
                  // },
                ]
              ),
              ),




            ),
          );

      },
    );
  }
}
