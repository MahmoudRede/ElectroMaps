import 'package:e_electromaps/business_logic/cubit/app_cubit/app_cubit.dart';
import 'package:e_electromaps/core/local/cash_helper.dart';
import 'package:e_electromaps/presentation/screens/add_station_screens/add_station_6.dart';
import 'package:flutter/material.dart';

import '../../../styles/colors/color_manager.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/leave_dialog.dart';

class AddStationFive extends StatelessWidget {
  var howWorkController = TextEditingController();
  var scheduleController = TextEditingController();
  var limitTimeController = TextEditingController();
  var chargingSessionController = TextEditingController();
  var parkingPriceController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  AddStationFive({super.key});

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
                child: Form(
                  key: formKey,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: MediaQuery.sizeOf(context).height * .05,
                          width: MediaQuery.sizeOf(context).width * .54,
                          decoration: BoxDecoration(
                              color: ColorManager.grey.withOpacity(0.07),
                              borderRadius:
                              const BorderRadius.all(Radius.circular(25))),
                          child: Center(
                              child: Text(
                                'More Information (Step 5/6)',
                                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                                  fontSize: 14,
                                  color: ColorManager.textColor,
                                ),
                              )),
                        ),
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * .05,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: TextFormField(
                              controller: howWorkController,
                              decoration: InputDecoration(
                                hintText: 'How it works',
                                hintStyle:
                                Theme.of(context).textTheme.headlineSmall!.copyWith(
                                  fontSize: 18,
                                  color: ColorManager.textColor,
                                ),
                              )),
                        ),
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * .04,
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0
                          ),
                          child: DropdownButtonFormField(
                            decoration: InputDecoration(
                              labelStyle:Theme.of(context).textTheme.headlineSmall!.copyWith(
                                fontSize: 13,
                                color: ColorManager.black,
                              ),
                              hintStyle:Theme.of(context).textTheme.headlineSmall!.copyWith(
                                color: ColorManager.black,
                                fontSize: 13,
                                fontFamily: 'Nunito',

                              ),

                              errorStyle: Theme.of(context).textTheme.headlineSmall!.copyWith(
                                fontSize: 13.0,
                                color: ColorManager.red,
                              ),),
                            style:Theme.of(context).textTheme.headlineSmall!.copyWith(
                              fontSize: 16,
                              color: ColorManager.black,
                            ),
                            value: AppCubit.get(context).bookingOptionsValue,
                            validator: (value) {
                              if (value == "Booking options *") {
                                return "Required";
                              }
                              return null;
                            },
                            hint: const Text(
                              "Booking options *",
                            ),
                            items: [
                              DropdownMenuItem(
                                value: "Booking options *",
                                child: Text('Booking options *',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall!
                                        .copyWith(
                                        fontSize: 18,
                                        color: ColorManager.textColor)),
                              ),
                              DropdownMenuItem(
                                value: "Cannot be booked",
                                child: Text('Cannot be booked',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall!
                                        .copyWith(
                                        fontSize: 18,
                                        color: ColorManager.textColor)),
                              ),
                              DropdownMenuItem(
                                value: "By email",
                                child: Text('By email',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall!
                                        .copyWith(
                                        fontSize: 18,
                                        color: ColorManager.textColor)),
                              ),
                              DropdownMenuItem(
                                value: "Mobile App",
                                child: Text('Mobile App',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall!
                                        .copyWith(
                                        fontSize: 18,
                                        color: ColorManager.textColor)),
                              ),
                              DropdownMenuItem(
                                value: "By phone",
                                child: Text('By phone',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall!
                                        .copyWith(
                                        fontSize: 18,
                                        color: ColorManager.textColor)),
                              ),
                              DropdownMenuItem(
                                value: "Must contact before",
                                child: Text('Must contact before',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall!
                                        .copyWith(
                                        fontSize: 18,
                                        color: ColorManager.textColor)),
                              ),
                              DropdownMenuItem(
                                value: "Contact before going (tel or email)",
                                child: Text('Contact before going (tel or email)',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall!
                                        .copyWith(
                                        fontSize: 18,
                                        color: ColorManager.textColor)),
                              ),
                              DropdownMenuItem(
                                value: "Unknown",
                                child: Text('Unknown',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall!
                                        .copyWith(
                                        fontSize: 18,
                                        color: ColorManager.textColor)),
                              ),
                            ],
                            onChanged: (value) {

                              AppCubit.get(context).bookingOptionsValue=value!;
                              print(AppCubit.get(context).bookingOptionsValue);

                            },
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * .04,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: TextFormField(
                              controller: scheduleController,
                              decoration: InputDecoration(
                                hintText: 'Schedule',
                                hintStyle:
                                Theme.of(context).textTheme.headlineSmall!.copyWith(
                                  fontSize: 18,
                                  color: ColorManager.textColor,
                                ),
                              )),
                        ),
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * .04,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: TextFormField(
                              controller: limitTimeController,
                              decoration: InputDecoration(
                                hintText: 'Limit time',
                                hintStyle:
                                Theme.of(context).textTheme.headlineSmall!.copyWith(
                                  fontSize: 18,
                                  color: ColorManager.textColor,
                                ),
                              )),
                        ),
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * .04,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: TextFormField(
                              controller: chargingSessionController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: 'Charging session price',
                                hintStyle:
                                Theme.of(context).textTheme.headlineSmall!.copyWith(
                                  fontSize: 18,
                                  color: ColorManager.textColor,
                                ),
                              )),
                        ),
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * .04,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: TextFormField(
                              controller: parkingPriceController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: 'Parking price',
                                hintStyle:
                                Theme.of(context).textTheme.headlineSmall!.copyWith(
                                  fontSize: 18,
                                  color: ColorManager.textColor,
                                ),
                              )),
                        ),
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * .07,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: customButton(
                                  context: context,
                                  title: 'Previous',
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  width: MediaQuery.sizeOf(context).width * .3,
                                  color: ColorManager.white,
                                  textColor: ColorManager.black,
                                  borderColor: ColorManager.grey.withOpacity(.2)),
                            ),
                            SizedBox(
                              width: MediaQuery.sizeOf(context).width * .05,
                            ),
                            Expanded(
                              child: customButton(
                                  context: context,
                                  title: 'Next',
                                  onTap: () {
                                    if(formKey.currentState!.validate()){
                                      CashHelper.saveData(key: 'schedule',value:scheduleController.text);
                                      CashHelper.saveData(key: 'howWork',value:howWorkController.text);
                                      CashHelper.saveData(key: 'limitTime',value:limitTimeController.text);
                                      CashHelper.saveData(key: 'chargingSession',value:chargingSessionController.text);
                                      CashHelper.saveData(key: 'parkingPrice',value:parkingPriceController.text);
                                      CashHelper.saveData(key: 'bookingOptions',value:AppCubit.get(context).bookingOptionsValue);
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                AddStationSix(),
                                          ));
                                    }

                                  },
                                  width: MediaQuery.sizeOf(context).width * .3,
                                  color: ColorManager.primaryColor,
                                  textColor: ColorManager.white,
                                  borderColor: ColorManager.primaryColor),
                            ),
                          ],
                        )
                      ]),
                ),
              ),
            ),
          ),
        ));
  }
}