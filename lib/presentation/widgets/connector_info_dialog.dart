import 'package:e_electromaps/business_logic/cubit/app_cubit/app_cubit.dart';
import 'package:e_electromaps/core/local/cash_helper.dart';
import 'package:e_electromaps/presentation/widgets/custom_button.dart';
import 'package:e_electromaps/styles/colors/color_manager.dart';
import 'package:flutter/material.dart';

Future<dynamic> connectorInfoDialog(BuildContext context) {
  TextEditingController powerController = TextEditingController();
  TextEditingController intensityController = TextEditingController();
  TextEditingController voltageController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  return showAdaptiveDialog(
    context: context,
    builder: (context) {
      return SingleChildScrollView(
        child: Form(
          key: formKey,
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
              height: MediaQuery.sizeOf(context).height * .5,
              child: Column(
                children: [

                  DropdownButtonFormField(
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
                    value: AppCubit.get(context).connectorTypeValue,
                    validator: (value) {
                      if (value == "Connector type *") {
                        return "Required";
                      }
                      return null;
                    },
                    hint: const Text(
                      "Connector type *",
                    ),
                    items: [
                      DropdownMenuItem(
                        value: "Connector type *",
                        child: Text('Connector type *',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(fontSize: 18)),
                      ),
                      DropdownMenuItem(
                        value: "CCS2",
                        child: Text('CCS2',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(fontSize: 18)),
                      ),
                      DropdownMenuItem(
                        value: "Type 2",
                        child: Text('Type 2',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(fontSize: 18)),
                      ),
                      DropdownMenuItem(
                        value: "Schuko",
                        child: Text('Schuko',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(fontSize: 18)),
                      ),
                      DropdownMenuItem(
                        value: "CHADeMo",
                        child: Text('CHADeMo',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(fontSize: 18)),
                      ),
                      DropdownMenuItem(
                        value: "NEMA 5-15",
                        child: Text('NEMA 5-15',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(fontSize: 18)),
                      ),
                      DropdownMenuItem(
                        value: "Type E",
                        child: Text('Type E',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(fontSize: 18)),
                      ),
                      DropdownMenuItem(
                        value: "Type G",
                        child: Text('Type G',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(fontSize: 18)),
                      ),
                      DropdownMenuItem(
                        value: "Type H",
                        child: Text('Type H',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(fontSize: 18)),
                      ),
                      DropdownMenuItem(
                        value: "Type I",
                        child: Text('Type I',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(fontSize: 18)),
                      ),
                      DropdownMenuItem(
                        value: "Type J",
                        child: Text('Type J',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(fontSize: 18)),
                      ),
                      DropdownMenuItem(
                        value: "Type L",
                        child: Text('Type L',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(fontSize: 18)),
                      ),
                      DropdownMenuItem(
                        value: "CEE 2P+E",
                        child: Text('CEE 2P+E',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(fontSize: 18)),
                      ),
                      DropdownMenuItem(
                        value: "CEE 3P+N+E",
                        child: Text('CEE 3P+N+E',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(fontSize: 18)),
                      ),
                      DropdownMenuItem(
                        value: "Type 1",
                        child: Text('Type 1',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(fontSize: 18)),
                      ),
                      DropdownMenuItem(
                        value: "CCS1",
                        child: Text('CCS1',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(fontSize: 18)),
                      ),
                      DropdownMenuItem(
                        value: "Type 3C",
                        child: Text('Type 3C',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(fontSize: 18)),
                      ),
                      DropdownMenuItem(
                        value: "Type 3A",
                        child: Text('Type 3A',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(fontSize: 18)),
                      ),
                      DropdownMenuItem(
                        value: "Tesla Roadster",
                        child: Text('Tesla Roadster',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(fontSize: 18)),
                      ),
                      DropdownMenuItem(
                        value: "Tesla SUC",
                        child: Text('Tesla SUC',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(fontSize: 18)),
                      ),
                      DropdownMenuItem(
                        value: "Small Paddle Inductive",
                        child: Text('Small Paddle Inductive',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(fontSize: 18)),
                      ),
                      DropdownMenuItem(
                        value: "Large Paddle Inductive",
                        child: Text('Large Paddle Inductive',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(fontSize: 18)),
                      ),
                      DropdownMenuItem(
                        value: "AVCON",
                        child: Text('AVCON',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(fontSize: 18)),
                      ),
                      DropdownMenuItem(
                        value: "GB/T DC",
                        child: Text('GB/T DC',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(fontSize: 18)),
                      ),
                      DropdownMenuItem(
                        value: "GB/T AC",
                        child: Text('GB/T AC',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(fontSize: 18)),
                      ),
                      DropdownMenuItem(
                        value: "Tesla DC",
                        child: Text('Tesla DC',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(fontSize: 18)),
                      ),
                    ],
                    onChanged: (value) {

                      AppCubit.get(context).connectorTypeValue=value!;
                      print(AppCubit.get(context).connectorTypeValue);

                    },
                  ),


                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * .02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Required";
                            }
                          },
                          controller: powerController,
                          keyboardType: TextInputType.number,
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
                          controller: intensityController,
                          keyboardType: TextInputType.number,
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
                    height: MediaQuery.sizeOf(context).height * .02,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: voltageController,
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Required";
                            }
                          },
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
                              value: AppCubit.get(context).formatValue,
                              validator: (value) {
                                if (value == "Format") {
                                  return "Required";
                                }
                                return null;
                              },
                              hint: const Text(
                                "Format",
                              ),
                              items: [
                                DropdownMenuItem(
                                  value: "Format",
                                  child: Text('Format',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall!
                                          .copyWith(fontSize: 18)),
                                ),
                                DropdownMenuItem(
                                  value: "Connector",
                                  child: Text('Connector',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall!
                                          .copyWith(fontSize: 18)),
                                ),
                                DropdownMenuItem(
                                  value: "Cable",
                                  child: Text('Cable',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall!
                                          .copyWith(fontSize: 18)),
                                ),
                              ],
                              onChanged: (value) {

                                AppCubit.get(context).formatValue=value!;
                                print(AppCubit.get(context).formatValue);

                              },
                            ),

                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * .02,
                  ),



                  Expanded(
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
                      value: AppCubit.get(context).typeCurrentValue,
                      validator: (value) {
                        if (value == "Type of current") {
                          return "Required";
                        }
                        return null;
                      },
                      hint: const Text(
                        "Type of current",
                      ),
                      items: [
                        DropdownMenuItem(
                          value: "Type of current",
                          child: Text('Type of current',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(fontSize: 18)),
                        ),
                        DropdownMenuItem(
                          value: "Monophase (AC)",
                          child: Text('Monophase (AC)',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(fontSize: 18)),
                        ),
                        DropdownMenuItem(
                          value: "Triphasic (AC)",
                          child: Text('Triphasic (AC)',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(fontSize: 18)),
                        ),
                        DropdownMenuItem(
                          value: "Direct Current (DC)",
                          child: Text('Direct Current (DC)',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(fontSize: 18)),
                        ),
                      ],
                      onChanged: (value) {

                        AppCubit.get(context).typeCurrentValue=value!;
                        print(AppCubit.get(context).typeCurrentValue);

                      },
                    ),
                  ),

                ],
              ),
            ),
            actions: [
              customButton(
                context: context,
                title: "Add Connector",
                onTap: () {
                  if(formKey.currentState!.validate()){
                    CashHelper.saveData(key: 'connectorType',value:AppCubit.get(context).connectorTypeValue);
                    CashHelper.saveData(key: 'power',value:powerController.text);
                    CashHelper.saveData(key: 'intensity',value:intensityController.text);
                    CashHelper.saveData(key: 'voltage',value:voltageController.text);
                    CashHelper.saveData(key: 'format',value:AppCubit.get(context).formatValue);
                    CashHelper.saveData(key: 'typeCurrent',value:AppCubit.get(context).typeCurrentValue);
                  }


                },
                width: MediaQuery.sizeOf(context).width * .8,
                color: ColorManager.primaryColor,
                textColor: ColorManager.white,
                borderColor: ColorManager.primaryColor,
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * .02,
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
        ),
      );
    },
  );
}
