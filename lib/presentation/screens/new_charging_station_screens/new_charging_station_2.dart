import 'package:e_electromaps/presentation/screens/new_charging_station_screens/new_charging_station_3.dart';
import 'package:e_electromaps/presentation/widgets/custom_button.dart';
import 'package:e_electromaps/presentation/widgets/default_text_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../styles/colors/color_manager.dart';
import '../../widgets/leave_dialog.dart';

class NewChargingStationScreen2 extends StatelessWidget {
  const NewChargingStationScreen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var placeController = TextEditingController();
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: CloseButton(
          onPressed: () {
            closeDialog(context);
          },
          color: ColorManager.white,
        ),

        backgroundColor: ColorManager.primaryColor,
        title: Text(
          'New Charging Station',
          style: Theme.of(context)
              .textTheme
              .headlineMedium!
              .copyWith(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Container(
                height: MediaQuery.sizeOf(context).height * 0.045,
                margin: EdgeInsets.all(MediaQuery.sizeOf(context).width * 0.05),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: ColorManager.grey.withOpacity(0.02),
                ),
                child: Center(
                    child: Text(
                  'Charging Station Information(Step 2/6)',
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(color: ColorManager.textColor),
                )),
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.001,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: DefaultTextFormField(
                    controller: placeController,
                    textInputType: TextInputType.text,
                    labelText: 'Where is the charging Station?'),
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.02,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.sizeOf(context).height * 0.6,
                  color: ColorManager.primaryColor,
                  child: const Center(child: Text('MapHere')),
                ),
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.03,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
                child: Row(
                  children: [
                    Expanded(
                        child: customButton(
                            borderColor: ColorManager.grey,
                            context: context,
                            title: 'Previous',
                            onTap: () {
                              Navigator.pop(context);
                            },
                            width: MediaQuery.sizeOf(context).width * 0.35,
                            color: Colors.white,
                            textColor: ColorManager.textColor)),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.05,
                    ),
                    Expanded(
                      child: customButton(
                          borderColor: ColorManager.primaryColor,
                          context: context,
                          title: 'Next',
                          onTap: () {
                            if (formKey.currentState!.validate()) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const NewChargingStationScreen3(),
                                  ));
                            }
                          },
                          width: MediaQuery.sizeOf(context).width * 0.35,
                          color: ColorManager.primaryColor,
                          textColor: ColorManager.white),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
