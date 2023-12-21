import 'dart:async';

import 'package:e_electromaps/business_logic/cubit/app_cubit/app_cubit.dart';
import 'package:e_electromaps/business_logic/cubit/app_states/app_states.dart';
import 'package:e_electromaps/styles/colors/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../new_charging_station_screens/new_charging_station_1.dart';

class StationsScreen extends StatefulWidget {
  const StationsScreen({super.key});

  @override
  State<StationsScreen> createState() => _StationsScreenState();
}

class _StationsScreenState extends State<StationsScreen> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();



  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(30.033333522243, 31.233334225536),
    zoom: 14,
  );

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
        listener: (context,state){

        },
      builder: (context,state){
          var cubit=AppCubit.get(context);
        List<Marker> markers=List.generate(cubit.stationList.length, (index) => Marker(
            markerId: MarkerId(index.toString()),
            position: LatLng(
                double.parse(cubit.stationList[index].latitude!),double.parse(cubit.stationList[index].langitude!)
            )
        ));

        return Scaffold(
            floatingActionButton: FloatingActionButton(
              shape: const CircleBorder(),
              backgroundColor: ColorManager.primaryColor,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NewChargingStationScreen1(),
                    ));
              },
              child: Row(mainAxisSize: MainAxisSize.min, children: [
                Icon(Icons.add_rounded,
                    color: ColorManager.white,
                    size: MediaQuery.sizeOf(context).width * 0.05),
                Icon(Icons.ev_station,
                    color: ColorManager.white,
                    size: MediaQuery.sizeOf(context).width * 0.072),
              ]),
            ),
            body: SizedBox(
              height: MediaQuery.sizeOf(context).height,
              child: Stack(
                children: [
                  GoogleMap(
                    mapType: MapType.normal,
                    initialCameraPosition: _kGooglePlex,
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);
                    },
                    markers: Set<Marker>.of(markers),
                  ),
                ],
              ),
            ),
          );
      },
    );
  }
}
