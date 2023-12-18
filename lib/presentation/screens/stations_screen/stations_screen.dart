import 'dart:async';

import 'package:e_electromaps/presentation/screens/add_station_screens/add_station_4.dart';
import 'package:e_electromaps/styles/colors/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class StationsScreen extends StatefulWidget {
  const StationsScreen({super.key});

  @override
  State<StationsScreen> createState() => _StationsScreenState();
}

class _StationsScreenState extends State<StationsScreen> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14,
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          systemOverlayStyle:  const SystemUiOverlayStyle(
            statusBarColor: ColorManager.primaryColor,
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.dark,
          ),
          toolbarHeight: 0.0,
        ),
        floatingActionButton: FloatingActionButton(
          shape: const CircleBorder(),
          backgroundColor: ColorManager.primaryColor,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddStationScreenFour(),
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
          child: GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          ),
        ),
      ),
    );
  }
}
