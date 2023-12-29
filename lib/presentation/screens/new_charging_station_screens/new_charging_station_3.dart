
import 'dart:async';

import 'package:e_electromaps/business_logic/cubit/app_cubit/app_cubit.dart';
import 'package:e_electromaps/business_logic/cubit/app_states/app_states.dart';

import 'package:e_electromaps/core/local/cash_helper.dart';

import 'package:e_electromaps/presentation/widgets/default_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../business_logic/localization_cubit/app_localization.dart';

import '../../../styles/colors/color_manager.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_toast.dart';
import '../../widgets/leave_dialog.dart';
import '../home_layout/home_layout.dart';

class NewChargingStationScreen3 extends StatelessWidget {
  const NewChargingStationScreen3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var addressController = TextEditingController();
    var numberController = TextEditingController();
    var whereController = TextEditingController();
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    var cubit= AppCubit.get(context);
    CameraPosition _kGooglePlex = CameraPosition(
      target: LatLng( cubit.locationPosition.latitude ?? 37.42796133580664,cubit.locationPosition.longitude  ??-122.085749655962),
      zoom: 14,
    );
    List< Marker> locationMarkers =[
      Marker(
        markerId: const MarkerId("1"),
        position: LatLng(
          double.parse("${CashHelper.getData(key: "lat")}").toDouble(),
          double.parse("${CashHelper.getData(key: "lng")}").toDouble(),
        ),
      ),
    ];
    final Completer<GoogleMapController> _controller =
    Completer<GoogleMapController>();

    return BlocConsumer<AppCubit, AppStates>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    addressController.text =BlocProvider.of<AppCubit>(context).mainAddress;
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
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Container(
              //   height: MediaQuery.sizeOf(context).height * 0.045,
              //   margin: EdgeInsets.all(MediaQuery.sizeOf(context).width * 0.05),
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(18),
              //     color: ColorManager.grey.withOpacity(0.02),
              //   ),
              //   child: Center(
              //       child: Text(
              //         '${AppLocalizations.of(context)!.translate("charging_station_info").toString()}(${AppLocalizations.of(context)!.translate("step")} 3/6)',
              //     style: Theme.of(context)
              //         .textTheme
              //         .headlineSmall!
              //         .copyWith(color: ColorManager.textColor),
              //   )),
              // ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.04,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.sizeOf(context).height * 0.25,
                  color: ColorManager.primaryColor,
                  child: GoogleMap(

                    mapType: MapType.normal,
                    initialCameraPosition: _kGooglePlex,
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);
                    },
                    markers: locationMarkers.toSet(),


                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.03,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                        child: DefaultTextFormField(
                            controller: addressController,
                            value:BlocProvider.of<AppCubit>(context).mainAddress ,
                            textInputType: TextInputType.text,
                            labelText: '${AppLocalizations.of(context)!.translate("address").toString()} *')),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.03,
                    ),
                    Expanded(
                        child: DefaultTextFormField(
                            controller: numberController,
                            textInputType: TextInputType.number,
                            labelText: '${AppLocalizations.of(context)!.translate("number").toString()} *')
                    )
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.02,
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    controller: whereController,
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          fontSize: 15.0,
                          color: ColorManager.black,
                        ),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      labelText: AppLocalizations.of(context)!.translate("how_to_get_there").toString(),
                      labelStyle:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                fontSize: 16.0,
                                color: ColorManager.black,
                              ),
                    ),
                  )),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.25,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal:  20, vertical: 20),
                child: Row(
                  children: [
                    Expanded(
                        child: customButton(
                            borderColor: ColorManager.grey,
                            context: context,
                            title: AppLocalizations.of(context)!.translate("previous").toString(),
                            onTap: () {
                              Navigator.pop(context);
                            },
                            width: MediaQuery.sizeOf(context).width * 0.35,
                            color: Colors.white,
                            textColor: ColorManager.textColor, color2: ColorManager.white)),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.05,
                    ),
                    Expanded(
                      child: customButton(
                          borderColor: ColorManager.white,
                          context: context,
                          title: AppLocalizations.of(context)!.translate("add").toString(),
                          onTap: () {
                            if (formKey.currentState!.validate()) {

                                CashHelper.saveData(key: 'address',value:addressController.text);
                                CashHelper.saveData(key: 'number',value:numberController.text);
                                CashHelper.saveData(key: 'where',value:whereController.text);
                                AppCubit.get(context)
                                    .addStationToFire(
                                  chargingSession: "",
                                  email: "",
                                  format: "",
                                  howWork: "",
                                  intensity: "",
                                  limitTime: "",
                                  parkingPrice:"",
                                  phoneNumber:"",
                                  proprietary:"",
                                  schedule: "",
                                  typeCurrent: "",
                                  voltage: "",
                                  where: CashHelper.getData(key: 'where'),
                                  stationName: CashHelper.getData(key: 'stationName'),
                                  stationType: CashHelper.getData(key: 'stationType'),
                                  stationStatus: CashHelper.getData(key: 'stationStatus'),
                                  energySource: CashHelper.getData(key: 'energySource'),
                                  langitude: double.parse(CashHelper.getData(key: 'lat')).toDouble(),
                                  latitude: double.parse(CashHelper.getData(key: 'lng')).toDouble(),
                                  location: CashHelper.getData(key: 'address'),
                                  address: CashHelper.getData(key: 'address'),
                                  number: CashHelper.getData(key: 'number'),
                                  connectorType: "",
                                  power: "",
                                  bookingOptions: "",
                                ).then((value) {
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

                            }
                          },
                          width: MediaQuery.sizeOf(context).width * 0.35,
                          color: ColorManager.secondaryColor,
                          textColor: ColorManager.white, color2: ColorManager.primaryColor),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  },
);
  }
}
