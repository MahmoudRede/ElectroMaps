import 'dart:async';

import 'package:e_electromaps/styles/colors/color_manager.dart';
import 'package:flutter/material.dart';
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
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14,
  );

  @override
  Widget build(BuildContext context) {
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
        child: GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: _kGooglePlex,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
          markers:  {

            Marker(
              icon: BitmapDescriptor.defaultMarker,
              draggable: true,
              markerId: MarkerId('1'),
              position: LatLng(37.42796133580664, -122.085749655962),
            ),
            Marker(
              icon: BitmapDescriptor.defaultMarker,
              draggable: true,
              markerId: MarkerId('2'),
              position: LatLng(37.4, -122.02),
            )
          },
        ),
      ),
    );
  }
}
