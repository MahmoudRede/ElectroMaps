import 'package:e_electromaps/business_logic/cubit/app_cubit/app_cubit.dart';
import 'package:e_electromaps/business_logic/cubit/app_states/app_states.dart';
import 'package:e_electromaps/presentation/screens/add_station_screens/add_station_4.dart';
import 'package:e_electromaps/presentation/widgets/default_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../styles/colors/color_manager.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/leave_dialog.dart';

class NewChargingStationScreen3 extends StatelessWidget {
  const NewChargingStationScreen3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var addressController = TextEditingController();
    var numberController = TextEditingController();
    var whereController = TextEditingController();
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return BlocConsumer<AppCubit, AppStates>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    addressController.text =BlocProvider.of<AppCubit>(context).mainAddress;
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
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
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
                  'Charging Station Information(Step 3/6)',
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(color: ColorManager.textColor),
                )),
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.001,
              ),
              Text(
                'This is the location:',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              // SizedBox(
              //   height: MediaQuery.sizeOf(context).height * 0.001,
              // ),

              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 20),
              //   child: Container(
              //     width: double.infinity,
              //     height: MediaQuery.sizeOf(context).height * 0.25,
              //     color: ColorManager.primaryColor,
              //     child: const Center(child: Text('MapHere')),
              //   ),
              // ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.03,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                        child: DefaultTextFormField(
                            controller: addressController,
                            value:BlocProvider.of<AppCubit>(context).mainAddress ,
                            textInputType: TextInputType.text,
                            labelText: 'Address *')),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.03,
                    ),
                    Expanded(
                        child: DefaultTextFormField(
                            controller: numberController,
                            textInputType: TextInputType.text,
                            labelText: 'Number *'))
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.02,
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    controller: whereController,
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          fontSize: 15.0,
                          color: ColorManager.black,
                        ),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      labelText: 'How to get there',
                      labelStyle:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                fontSize: 16.0,
                                color: ColorManager.black,
                              ),
                    ),
                  )),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.48,
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 20, right: 20, bottom: 30),
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
                                    const AddStationScreenFour(),
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
  },
);
  }
}
