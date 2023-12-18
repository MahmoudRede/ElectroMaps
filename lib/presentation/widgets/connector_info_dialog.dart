import 'package:e_electromaps/presentation/widgets/custom_button.dart';
import 'package:e_electromaps/styles/colors/color_manager.dart';
import 'package:flutter/material.dart';

Future<dynamic> connectorInfoDialog(BuildContext context) {
  TextEditingController connectorTypeController = TextEditingController();
  TextEditingController connectorFormatController = TextEditingController();
  TextEditingController typeOfCurrentController = TextEditingController();
  TextEditingController powerController = TextEditingController();
  TextEditingController voltageController = TextEditingController();
  return showAdaptiveDialog(
    context: context,
    builder: (context) {
      return SingleChildScrollView(
        child: AlertDialog(
          insetPadding: EdgeInsets.symmetric(
              vertical: MediaQuery.sizeOf(context).height * .15,
              horizontal: MediaQuery.sizeOf(context).width * .04),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          backgroundColor: ColorManager.white,
          titlePadding: EdgeInsets.zero,
          scrollable: true,
          title: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(15),
                      topLeft: Radius.circular(15)),
                  color: ColorManager.grey.withOpacity(.02)),
              child: Center(
                  child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "Connector information",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ))),
          content: SizedBox(
            width: MediaQuery.sizeOf(context).width * .8,
            height: MediaQuery.sizeOf(context).height * .45,
            child: Column(
              children: [
                DropdownButtonFormField(
                  hint: Text("Connector type*",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(fontSize: 18)),
                  menuMaxHeight: MediaQuery.sizeOf(context).height * .6,
                  validator: (value) {
                    if (value == null) {
                      return 'Required';
                    }
                    return null;
                  },
                  items: [
                    DropdownMenuItem(
                      value: "1",
                      child: Text('CCS2',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(fontSize: 18)),
                    ),
                    DropdownMenuItem(
                      value: "2",
                      child: Text('Type 2',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(fontSize: 18)),
                    ),
                    DropdownMenuItem(
                      value: "3",
                      child: Text('Schuko',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(fontSize: 18)),
                    ),
                    DropdownMenuItem(
                      value: "4",
                      child: Text('CHADeMo',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(fontSize: 18)),
                    ),
                    DropdownMenuItem(
                      value: "5",
                      child: Text('NEMA 5-15',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(fontSize: 18)),
                    ),
                    DropdownMenuItem(
                      value: "6",
                      child: Text('Type E',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(fontSize: 18)),
                    ),
                    DropdownMenuItem(
                      value: "7",
                      child: Text('Type G',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(fontSize: 18)),
                    ),
                    DropdownMenuItem(
                      value: "8",
                      child: Text('Type H',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(fontSize: 18)),
                    ),
                    DropdownMenuItem(
                      value: "9",
                      child: Text('Type I',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(fontSize: 18)),
                    ),
                    DropdownMenuItem(
                      value: "10",
                      child: Text('Type J',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(fontSize: 18)),
                    ),
                    DropdownMenuItem(
                      value: "11",
                      child: Text('Type L',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(fontSize: 18)),
                    ),
                    DropdownMenuItem(
                      value: "12",
                      child: Text('CEE 2P+E',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(fontSize: 18)),
                    ),
                    DropdownMenuItem(
                      value: "13",
                      child: Text('CEE 3P+N+E',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(fontSize: 18)),
                    ),
                    DropdownMenuItem(
                      value: "14",
                      child: Text('Type 1',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(fontSize: 18)),
                    ),
                    DropdownMenuItem(
                      value: "1",
                      child: Text('CCS1',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(fontSize: 18)),
                    ),
                    DropdownMenuItem(
                      value: "15",
                      child: Text('Type 3C',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(fontSize: 18)),
                    ),
                    DropdownMenuItem(
                      value: "16",
                      child: Text('Type 3A',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(fontSize: 18)),
                    ),
                    DropdownMenuItem(
                      value: "17",
                      child: Text('Tesla Roadster',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(fontSize: 18)),
                    ),
                    DropdownMenuItem(
                      value: "18",
                      child: Text('Tesla SUC',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(fontSize: 18)),
                    ),
                    DropdownMenuItem(
                      value: "19",
                      child: Text('Small Paddle Inductive',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(fontSize: 18)),
                    ),
                    DropdownMenuItem(
                      value: "20",
                      child: Text('Large Paddle Inductive',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(fontSize: 18)),
                    ),
                    DropdownMenuItem(
                      value: "21",
                      child: Text('AVCON',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(fontSize: 18)),
                    ),
                    DropdownMenuItem(
                      value: "22",
                      child: Text('GB/T DC',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(fontSize: 18)),
                    ),
                    DropdownMenuItem(
                      value: "23",
                      child: Text('GB/T AC',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(fontSize: 18)),
                    ),
                    DropdownMenuItem(
                      value: "24",
                      child: Text('Tesla DC',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(fontSize: 18)),
                    ),
                  ],
                  onChanged: (value) {},
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * .03,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: powerController,
                        decoration: InputDecoration(
                          label: Text("Power (KW)*",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(fontSize: 18)),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width * .05,
                    ),
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          label: Text("Intensity (A)",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(fontSize: 18)),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * .03,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: voltageController,
                        decoration: InputDecoration(
                          label: Text("Voltage (V)*",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(fontSize: 18)),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width * .04,
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.sizeOf(context).height * .02,
                          ),
                          DropdownButtonFormField(
                            validator: (value) {
                              if (value == null) {
                                return "Required";
                              }
                              return null;
                            },
                            hint: Text("Format",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(fontSize: 18)),
                            items: [
                              DropdownMenuItem(
                                value: "1",
                                child: Text('Connector',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall!
                                        .copyWith(fontSize: 18)),
                              ),
                              DropdownMenuItem(
                                value: "2",
                                child: Text('Cable',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall!
                                        .copyWith(fontSize: 18)),
                              ),
                            ],
                            onChanged: (value) {},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * .03,
                ),
                Expanded(
                  child: DropdownButtonFormField(
                    validator: (value) {
                      if (value == null) {
                        return "Required";
                      }
                      return null;
                    },
                    hint: Text("Type of current",
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(fontSize: 18)),
                    items: [
                      DropdownMenuItem(
                        value: "1",
                        child: Text('Monophase (AC)',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(fontSize: 18)),
                      ),
                      DropdownMenuItem(
                        value: "2",
                        child: Text('Triphasic (AC)',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(fontSize: 18)),
                      ),
                      DropdownMenuItem(
                        value: "3",
                        child: Text('Direct Current (DC)',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(fontSize: 18)),
                      ),
                    ],
                    onChanged: (value) {},
                  ),
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * .06,
                ),
              ],
            ),
          ),
          actions: [
            customButton(
              context: context,
              title: "Add Connector",
              onTap: () {},
              width: MediaQuery.sizeOf(context).width * .8,
              color: ColorManager.primaryColor,
              textColor: ColorManager.white,
              borderColor: ColorManager.primaryColor,
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * .04,
            ),
            Align(
              alignment: Alignment.center,
              child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Cancel",
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(color: ColorManager.black, fontSize: 18),
                  )),
            )
          ],
        ),
      );
    },
  );
}
