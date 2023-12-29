import 'dart:async';
import 'dart:developer';
import 'package:e_electromaps/business_logic/cubit/app_cubit/app_cubit.dart';
import 'package:e_electromaps/business_logic/cubit/app_states/app_states.dart';
import 'package:e_electromaps/presentation/widgets/marker_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../styles/colors/color_manager.dart';

class StationsScreen extends StatefulWidget {
  const StationsScreen({super.key});

  @override
  State<StationsScreen> createState() => _StationsScreenState();
}

class _StationsScreenState extends State<StationsScreen> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  late GoogleMapController googleMapController;

 static const CameraPosition   _kGooglePlex = CameraPosition(
    target: LatLng(30.033333522243, 31.233334225536),
    zoom: 12,
  );

  @override
  void initState() {
    AppCubit.get(context).getStationFromFire();
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);


        cubit.getCurrentPosition();
        List<Marker> markers = List.generate(
          cubit.stationList.length,
          (index) => Marker(
            onTap: () {
              cubit.stationIndex=index;
              markerBottomSheet(context, index: cubit.stationIndex!);
            },
            markerId: MarkerId(index.toString()),
            position: LatLng(
              cubit.stationList[index].langitude!,
              cubit.stationList[index].latitude!,
            ),
          ),
        );

        return Scaffold(
          extendBody: true,
          floatingActionButton: FloatingActionButton(
            heroTag: 'btn2',
            backgroundColor: ColorManager.white.withOpacity(.8),
            shape: const CircleBorder(),
            onPressed: () async {
              await cubit.requestLocationPermission(context);
             cubit.currentPositionAddStation = await  cubit.getCurrentPositionAddStation();
             log('button worked');
             log(cubit.currentPositionAddStation!.latitude.toString());
             log(cubit.currentPositionAddStation!.longitude.toString());
             googleMapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(cubit.currentPositionAddStation!.latitude,cubit.currentPositionAddStation!.longitude),zoom: 12)));
             setState(() {

             });




            },
            child: Icon(
              Icons.my_location,
              size: MediaQuery.sizeOf(context).width * 0.07,
              color: ColorManager.textColor,
            ),
          ),
          body: SizedBox(
            height: MediaQuery.sizeOf(context).height,
            child: Stack(
              children: [
                GoogleMap(
                  mapType: MapType.normal,
                  compassEnabled: true,
                  myLocationEnabled: true,
                  myLocationButtonEnabled: false,
                  zoomControlsEnabled: false,
                  initialCameraPosition:_kGooglePlex ,
                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);
                    googleMapController = controller;
                  },
                  markers: markers.toSet(),
                  zoomGesturesEnabled: true,
                  scrollGesturesEnabled: true,
                  rotateGesturesEnabled: true,
                  mapToolbarEnabled: false,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
