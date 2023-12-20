import 'package:e_electromaps/business_logic/cubit/app_cubit/app_cubit.dart';
import 'package:e_electromaps/core/local/cash_helper.dart';
import 'package:flutter/material.dart';

import '../../../styles/colors/color_manager.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/leave_dialog.dart';

class AddStationSix extends StatelessWidget {
  var proprietaryController = TextEditingController();
  var emailController = TextEditingController();
  var phoneNumberController = TextEditingController();

  AddStationSix({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'New Charger Station',
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
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: SizedBox(
            height: MediaQuery.sizeOf(context).height,
            width: MediaQuery.sizeOf(context).width,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment:  MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: MediaQuery.sizeOf(context).height * .05,
                    width: MediaQuery.sizeOf(context).width * .56,
                    decoration: BoxDecoration(
                        color: ColorManager.grey.withOpacity(0.07),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(25))),
                    child: Center(
                        child: Text(
                      'Contact Information (Step 6/6)',
                      style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                            fontSize: 14,
                            color: ColorManager.textColor,
                          ),
                    )),
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * .04,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Owner-Related-Information",
                      style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          fontSize: 14,
                          color: ColorManager.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * .03,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: TextFormField(
                      controller: proprietaryController,
                        decoration: InputDecoration(
                          hintText: 'Proprietary',
                          hintStyle:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                            fontSize: 18,
                            color: ColorManager.textColor,
                          ),
                        )),
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * .03,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: TextFormField(
                      controller: emailController,
                        decoration: InputDecoration(
                          hintText: 'Email',
                          hintStyle:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                            fontSize: 18,
                            color: ColorManager.textColor,
                          ),
                        )),
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * .03,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: TextFormField(
                      controller: phoneNumberController,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          hintText: 'Phone number',
                          hintStyle:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                            fontSize: 18,
                            color: ColorManager.textColor,
                          ),
                        )),
                  ),
                  SizedBox(height:  MediaQuery.sizeOf(context).height * .29,),
                  Row(
                    children: [
                      Expanded(
                        child: customButton(
                            context: context,
                            title: 'Previous',
                            onTap: () {
                              Navigator.pop(context);
                            },
                            width: MediaQuery
                                .sizeOf(context)
                                .width * .3,
                            color: ColorManager.white,
                            textColor: ColorManager.black,
                            borderColor: ColorManager.grey.withOpacity(.2)),
                      ),
                      SizedBox(
                        width: MediaQuery
                            .sizeOf(context)
                            .width * .05,
                      ),
                      Expanded(
                        child: customButton(
                            context: context,
                            title: 'Finish',
                            onTap: () {
                              CashHelper.saveData(key: 'proprietary',value:proprietaryController.text);
                              CashHelper.saveData(key: 'email',value:emailController.text);
                              CashHelper.saveData(key: 'phoneNumber',value:phoneNumberController.text);

                              AppCubit.get(context).addStationToFire(
                                  chargingSession: CashHelper.getData(key: 'chargingSession'),
                                  email: CashHelper.getData(key: 'email'),
                                  format: CashHelper.getData(key: 'format'),
                                  howWork: CashHelper.getData(key: 'howWork'),
                                  intensity: CashHelper.getData(key: 'intensity'),
                                  limitTime: CashHelper.getData(key: 'limitTime'),
                                  parkingPrice: CashHelper.getData(key: 'parkingPrice'),
                                  phoneNumber:CashHelper.getData(key: 'phoneNumber'),
                                  proprietary: CashHelper.getData(key: 'proprietary'),
                                  schedule: CashHelper.getData(key: 'schedule'),
                                  typeCurrent: CashHelper.getData(key: 'typeCurrent'),
                                  voltage: CashHelper.getData(key: 'voltage'),
                                  where: CashHelper.getData(key: 'where'),
                                  stationName: CashHelper.getData(key: 'stationName'),
                                  stationType: CashHelper.getData(key: 'stationType'),
                                  stationStatus: CashHelper.getData(key: 'stationStatus'),
                                  energySource: CashHelper.getData(key: 'energySource'),
                                  langitude: '2',
                                  latitude: '5',
                                  location: 'Egypt',
                                  address: CashHelper.getData(key: 'address'),
                                  number: CashHelper.getData(key: 'number'),
                                  connectorType: CashHelper.getData(key: 'connectorType'),
                                  power: CashHelper.getData(key: 'power'),
                                  bookingOptions: CashHelper.getData(key: 'bookingOptions'),

                              );

                            },
                            width: MediaQuery
                                .sizeOf(context)
                                .width * .3,
                            color: ColorManager.primaryColor,
                            textColor: ColorManager.white,
                            borderColor: ColorManager.primaryColor),
                      ),
                    ],
                  )

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
