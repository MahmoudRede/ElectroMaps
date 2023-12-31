import 'package:e_electromaps/presentation/screens/add_station_screens/add_station_5.dart';
import 'package:e_electromaps/presentation/widgets/connector_info_dialog.dart';
import 'package:e_electromaps/presentation/widgets/custom_button.dart';
import 'package:e_electromaps/presentation/widgets/leave_dialog.dart';
import 'package:e_electromaps/styles/colors/color_manager.dart';
import 'package:flutter/material.dart';

import '../../../business_logic/localization_cubit/app_localization.dart';

class AddStationScreenFour extends StatelessWidget {
  const AddStationScreenFour({super.key});

  @override
  Widget build(BuildContext context) {
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
      floatingActionButton: Align(
        heightFactor: MediaQuery.sizeOf(context).height * 0.005,
        widthFactor: MediaQuery.sizeOf(context).width * 0.003,
        child: FloatingActionButton(
          onPressed: () {
            connectorInfoDialog(context);
          },
          shape: const CircleBorder(),
          backgroundColor: ColorManager.primaryColor,
          child: Image.asset(
            "assets/images/filled_plug.png",
            color: ColorManager.white,
            width: MediaQuery.of(context).size.width * 0.07,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Container(
              //   height: MediaQuery.sizeOf(context).height * .05,
              //   width: MediaQuery.sizeOf(context).width * .5,
              //   decoration: BoxDecoration(
              //       color: ColorManager.grey.withOpacity(0.07),
              //       borderRadius: const BorderRadius.all(Radius.circular(25))),
              //   child: Center(
              //     child: Text(
              //         '${AppLocalizations.of(context)!.translate("connectors").toString()} (${AppLocalizations.of(context)!.translate("step").toString()} 4/6)',
              //         style:
              //             Theme.of(context).textTheme.headlineSmall!.copyWith(
              //                   fontSize: 14,
              //                   color: ColorManager.textColor,
              //                 )),
              //   ),
              // ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * .12,
              ),
              Column(
                children: [
                  Container(
                    width: MediaQuery.sizeOf(context).width * .7,
                    decoration: BoxDecoration(
                      color: ColorManager.grey.withOpacity(0.07),
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(
                      'assets/images/hand_charger.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * .04,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.info,
                        color: ColorManager.black.withOpacity(.7),
                      ),
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width * .02,
                      ),
                      Text(
                        AppLocalizations.of(context)!
                            .translate("add_one_plug_at_least")
                            .toString(),
                        style:
                            Theme.of(context).textTheme.headlineSmall!.copyWith(
                                  color: ColorManager.grey,
                                  fontSize: 18,
                                ),
                      ),
                    ],
                  ),
                ],
              ),
              const Spacer(),
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
                        borderColor: ColorManager.grey.withOpacity(.2),
                        color2: ColorManager.white),
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AddStationFive(),
                              ));
                        },
                        width: MediaQuery.sizeOf(context).width * .3,
                        color: ColorManager.primaryColor,
                        textColor: ColorManager.white,
                        borderColor: ColorManager.white,
                        color2: ColorManager.primaryColor),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }
}
