import 'package:e_electromaps/business_logic/cubit/app_cubit/app_cubit.dart';
import 'package:e_electromaps/business_logic/localization_cubit/app_localization.dart';
import 'package:e_electromaps/core/local/cash_helper.dart';
import 'package:e_electromaps/presentation/widgets/custom_button.dart';
import 'package:e_electromaps/presentation/widgets/custom_toast.dart';
import 'package:e_electromaps/styles/colors/color_manager.dart';
import 'package:flutter/material.dart';

Future<dynamic> connectorInfoDialog(BuildContext context) {
  TextEditingController powerController = TextEditingController();
  TextEditingController intensityController = TextEditingController();
  TextEditingController voltageController = TextEditingController();
  var connectorTypeValue =
      "${AppLocalizations.of(context)!.translate("connector_type").toString()} *";
  var formatValue =
      AppLocalizations.of(context)!.translate("format").toString();
  var typeCurrentValue =
      "${AppLocalizations.of(context)!.translate("type_of_current").toString()}";
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
                    AppLocalizations.of(context)!
                        .translate("connector_info")
                        .toString(),
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
                      labelStyle:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                fontSize: 13,
                                color: ColorManager.black,
                              ),
                      hintStyle:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                color: ColorManager.black,
                                fontSize: 13,
                                fontFamily: 'Nunito',
                              ),
                      errorStyle:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                fontSize: 13.0,
                                color: ColorManager.red,
                              ),
                    ),
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          fontSize: 16,
                          color: ColorManager.black,
                        ),
                    value: connectorTypeValue,
                    validator: (value) {
                      if (value ==
                          "${AppLocalizations.of(context)!.translate("connector_type").toString()} *") {
                        return AppLocalizations.of(context)!
                            .translate("required")
                            .toString();
                      }
                      return null;
                    },
                    hint: Text(
                      "${AppLocalizations.of(context)!.translate("connector_type").toString()} *",
                    ),
                    items: [
                      DropdownMenuItem(
                        value: "${AppLocalizations.of(context)!.translate("connector_type").toString()} *",
                        child: Text("${AppLocalizations.of(context)!.translate("connector_type").toString()} *",
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
                      connectorTypeValue = value!;
                      print( connectorTypeValue);
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
                              return AppLocalizations.of(context)!
                                  .translate("required")
                                  .toString();
                            }
                          },
                          controller: powerController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            label: Text("${AppLocalizations.of(context)!
                                .translate("power")
                                .toString()} (KW)*",
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
                            label: Text("${AppLocalizations.of(context)!
                                .translate("intensity")
                                .toString()} (A)",
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
                              return AppLocalizations.of(context)!
                                  .translate("required")
                                  .toString();
                            }
                          },
                          decoration: InputDecoration(
                            label: Text("${AppLocalizations.of(context)!
                                .translate("voltage")
                                .toString()} (V)*",
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
                                labelStyle: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(
                                      fontSize: 13,
                                      color: ColorManager.black,
                                    ),
                                hintStyle: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(
                                      color: ColorManager.black,
                                      fontSize: 13,
                                      fontFamily: 'Nunito',
                                    ),
                                errorStyle: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(
                                      fontSize: 13.0,
                                      color: ColorManager.red,
                                    ),
                              ),
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(
                                    fontSize: 16,
                                    color: ColorManager.black,
                                  ),
                              value: formatValue,
                              validator: (value) {
                                if (value ==
                                    AppLocalizations.of(context)!
                                        .translate("format")
                                        .toString()) {
                                  return AppLocalizations.of(context)!
                                      .translate("required")
                                      .toString();
                                }
                                return null;
                              },
                              hint:   Text(
                                AppLocalizations.of(context)!
                                    .translate("format")
                                    .toString(),
                              ),
                              items: [
                                DropdownMenuItem(
                                  value: AppLocalizations.of(context)!
                                      .translate("format")
                                      .toString(),
                                  child: Text(AppLocalizations.of(context)!
                                      .translate("format")
                                      .toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall!
                                          .copyWith(fontSize: 18)),
                                ),
                                DropdownMenuItem(
                                  value: AppLocalizations.of(context)!.translate("connector").toString(),
                                  child: Text(AppLocalizations.of(context)!.translate("connector").toString()),
                                ),
                                DropdownMenuItem(
                                  value: AppLocalizations.of(context)!.translate("cable").toString(),
                                  child: Text(AppLocalizations.of(context)!.translate("cable").toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall!
                                          .copyWith(fontSize: 18)),
                                ),
                              ],
                              onChanged: (value) {
                                formatValue = value!;
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
                        labelStyle:
                            Theme.of(context).textTheme.headlineSmall!.copyWith(
                                  fontSize: 13,
                                  color: ColorManager.black,
                                ),
                        hintStyle:
                            Theme.of(context).textTheme.headlineSmall!.copyWith(
                                  color: ColorManager.black,
                                  fontSize: 13,
                                  fontFamily: 'Nunito',
                                ),
                        errorStyle:
                            Theme.of(context).textTheme.headlineSmall!.copyWith(
                                  fontSize: 13.0,
                                  color: ColorManager.red,
                                ),
                      ),
                      style:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                fontSize: 16,
                                color: ColorManager.black,
                              ),
                      value: typeCurrentValue,
                      validator: (value) {
                        if (value == AppLocalizations.of(context)!.translate("type_of_current").toString()) {
                          return AppLocalizations.of(context)!
                              .translate("required")
                              .toString();
                        }
                        return null;
                      },
                      hint: Text(
                        AppLocalizations.of(context)!.translate("type_of_current").toString(),
                      ),
                      items: [
                        DropdownMenuItem(
                          value: AppLocalizations.of(context)!.translate("type_of_current").toString(),
                          child: Text(AppLocalizations.of(context)!.translate("type_of_current").toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(fontSize: 18)),
                        ),
                        DropdownMenuItem(
                          value: "${AppLocalizations.of(context)!.translate("monophase").toString()} (AC)",
                          child: Text("${AppLocalizations.of(context)!.translate("monophase").toString()} (AC)",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(fontSize: 18)),
                        ),
                        DropdownMenuItem(
                          value: "${AppLocalizations.of(context)!.translate("triphasic").toString()} (AC)",
                          child: Text("${AppLocalizations.of(context)!.translate("triphasic").toString()} (AC)",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(fontSize: 18)),
                        ),
                        DropdownMenuItem(
                          value: "${AppLocalizations.of(context)!.translate("monophase").toString()} (DC)",
                          child: Text("${AppLocalizations.of(context)!.translate("monophase").toString()} (DC)",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(fontSize: 18)),
                        ),
                      ],
                      onChanged: (value) {
                         typeCurrentValue = value!;
                        print( typeCurrentValue);
                      },
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              customButton(
                context: context,
                title: AppLocalizations.of(context)!.translate("add_connector").toString(),
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    CashHelper.saveData(
                        key: 'connectorType',
                        value:  connectorTypeValue);
                    CashHelper.saveData(
                        key: 'power', value: powerController.text);
                    CashHelper.saveData(
                        key: 'intensity', value: intensityController.text);
                    CashHelper.saveData(
                        key: 'voltage', value: voltageController.text);
                    CashHelper.saveData(
                        key: 'format',
                        value:  formatValue);
                    CashHelper.saveData(
                        key: 'typeCurrent',
                        value:  typeCurrentValue);
                  customToast(title: AppLocalizations.of(context)!.translate("plugin_added").toString(), color: ColorManager.primaryColor);
                  }
                  Navigator.pop(context);
                },
                width: MediaQuery.sizeOf(context).width * .8,
                color: ColorManager.secondaryColor,
                textColor: ColorManager.white,
                borderColor: ColorManager.white, color2: ColorManager.primaryColor,
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
                      AppLocalizations.of(context)!.translate("cancel").toString(),
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
