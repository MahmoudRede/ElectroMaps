import 'package:e_electromaps/presentation/screens/add_station_screens/add_station_6.dart';
import 'package:flutter/material.dart';

import '../../../styles/colors/color_manager.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/leave_dialog.dart';

class AddStationFive extends StatelessWidget {
  const AddStationFive({super.key});

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
                  DropdownButtonFormField(
                    validator: (value) {
                      if (value == null) {
                        return "Required";
                      }
                      return null;
                    },
                    hint: Text(
                      "Booking options*",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(
                              fontSize: 18, color: ColorManager.textColor),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    items: [
                      DropdownMenuItem(
                        value: "1",
                        child: Text('Cannot be booked',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                    fontSize: 18,
                                    color: ColorManager.textColor)),
                      ),
                      DropdownMenuItem(
                        value: "2",
                        child: Text('By email',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                    fontSize: 18,
                                    color: ColorManager.textColor)),
                      ),
                      DropdownMenuItem(
                        value: "3",
                        child: Text('Mobile App',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                    fontSize: 18,
                                    color: ColorManager.textColor)),
                      ),
                      DropdownMenuItem(
                        value: "4",
                        child: Text('By phone',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                    fontSize: 18,
                                    color: ColorManager.textColor)),
                      ),
                      DropdownMenuItem(
                        value: "5",
                        child: Text('Must contact before',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                    fontSize: 18,
                                    color: ColorManager.textColor)),
                      ),
                      DropdownMenuItem(
                        value: "6",
                        child: Text('Contact before going (tel or email)',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                    fontSize: 18,
                                    color: ColorManager.textColor)),
                      ),
                      DropdownMenuItem(
                        value: "7",
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
                      print(value);

                    },
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * .04,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: TextFormField(
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
                    height: MediaQuery.sizeOf(context).height * .12,
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
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const AddStationSix(),
                                  ));
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
    ));
  }
}
