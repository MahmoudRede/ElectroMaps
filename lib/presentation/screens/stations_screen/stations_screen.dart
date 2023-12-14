import 'package:e_electromaps/presentation/screens/add_station_screens/add_station_4.dart';
import 'package:e_electromaps/styles/colors/color_manager.dart';
import 'package:flutter/material.dart';

class StationsScreen extends StatelessWidget {
  const StationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
      ),
    );
  }
}
