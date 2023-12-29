import 'package:e_electromaps/presentation/screens/add_station_screens/add_station_4.dart';
import 'package:e_electromaps/presentation/widgets/custom_button.dart';
import 'package:e_electromaps/presentation/widgets/station_details_bottom_sheet.dart';
import 'package:e_electromaps/styles/colors/color_manager.dart';
import 'package:flutter/material.dart';

Future<dynamic> markerBottomSheet(BuildContext context, {required int index}) {
  return showModalBottomSheet(
      backgroundColor: ColorManager.white,
      context: context,
      builder: (context) {
        return Container(
            padding: const EdgeInsets.all(15),
            height: MediaQuery.of(context).size.height * .25,
            width: MediaQuery.of(context).size.width,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      height:  MediaQuery.sizeOf(context).height * 0.007,
                      width: MediaQuery.sizeOf(context).width*.2,
                      decoration: BoxDecoration(
                        color: ColorManager.primaryColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.03,
                  ),

                  customButton(
                      context: context,
                      title: "Station Details",
                      onTap: () {
                        Navigator.pop(context);
                        stationDetailsBottomSheet(context, index: index);
                      },
                      width: MediaQuery.sizeOf(context).width,
                      color: ColorManager.primaryColor,
                      color2: ColorManager.primaryColor,
                      textColor: ColorManager.white,
                      borderColor: ColorManager.white),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.03,
                  ),
                  customButton(
                      context: context,
                      title: "Edit Station information",
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const AddStationScreenFour(),));

                      },
                      width: MediaQuery.sizeOf(context).width,
                      color: ColorManager.primaryColor,
                      color2: ColorManager.primaryColor,
                      textColor: ColorManager.white,
                      borderColor: ColorManager.white),
                ],
            ),
        );
      },
      );
}
