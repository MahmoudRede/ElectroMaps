import 'package:e_electromaps/business_logic/cubit/app_cubit/app_cubit.dart';
import 'package:e_electromaps/business_logic/cubit/app_states/app_states.dart';
import 'package:e_electromaps/core/local/cash_helper.dart';
import 'package:e_electromaps/presentation/screens/new_charging_station_screens/new_charging_station_2.dart';
import 'package:e_electromaps/presentation/widgets/Dropdown_Button_formField.dart';
import 'package:e_electromaps/presentation/widgets/custom_button.dart';
import 'package:e_electromaps/presentation/widgets/default_text_form_field.dart';
import 'package:e_electromaps/styles/colors/color_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/leave_dialog.dart';

class NewChargingStationScreen1 extends StatefulWidget {
  const NewChargingStationScreen1({Key? key}) : super(key: key);

  @override
  State<NewChargingStationScreen1> createState() => _NewChargingStationScreen1State();
}

class _NewChargingStationScreen1State extends State<NewChargingStationScreen1> {
  @override
  Widget  build(BuildContext context) {
    GlobalKey<FormState> formKey=GlobalKey<FormState>();
    var nameController = TextEditingController();



    return    BlocConsumer<AppCubit, AppStates>(
  listener: (context, state) {
  },
  builder: (context, state) {
    var cubit=AppCubit.get(context);
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
        title:  Text('New Charging Station',style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: Colors.white),),
      ),
      body:  SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [

              Container(
                height: MediaQuery.sizeOf(context).height*0.045,
                margin: EdgeInsets.all(MediaQuery.sizeOf(context).width*0.05),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: ColorManager.grey.withOpacity(0.02),
                ),
                child: Center(child: Text('Charging Station Information(Step 1/6)',style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: ColorManager.textColor),)),
              ),

              SizedBox(height: MediaQuery.sizeOf(context).height*0.005,),

              Text('Add New Charging Station',style: Theme.of(context).textTheme.headlineMedium,),

              Image.asset(
                'assets/images/add_new_charging_station_image1.jpg',
                width: double.infinity,
                height: MediaQuery.sizeOf(context).height*0.2,
              ),


              SizedBox(height: MediaQuery.sizeOf(context).height * 0.001,),

              Padding(
                padding:EdgeInsets.symmetric(horizontal: MediaQuery.sizeOf(context).height*0.02),
                child: DefaultTextFormField(
                    controller: nameController,
                    textInputType: TextInputType.name, labelText: 'Charging Station Name *'),
              ),

              SizedBox(height: MediaQuery.sizeOf(context).height * 0.01 ,),

              /// Station Charging Type
              Padding(
                padding: EdgeInsets.symmetric(horizontal: MediaQuery.sizeOf(context).height*0.012),
                child: DropdownButtonFormField(
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
                  value: cubit.stationTypeValue,
                  validator: (value) {
                    if (value == 'Station Charging Type *') {
                      return "Required";
                    }
                    return null;
                  },
                  hint: const Text(
                    'Station Charging Type *',
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  items: cubit.typeList,
                  onChanged: (value) {

                    cubit.stationTypeValue=value!;

                  },
                ),
              ),

              SizedBox(height: MediaQuery.sizeOf(context).height * 0.01 ,),

              /// Station Charging Status
              Padding(
                padding: EdgeInsets.symmetric(horizontal: MediaQuery.sizeOf(context).height*0.012),
                child: DropdownButtonFormField(
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
                  value: cubit.stationStatusValue,
                  validator: (value) {
                    if (value == 'Station Charging Status *') {
                      return "Required";
                    }
                    return null;
                  },
                  hint: const Text(
                    'Station Charging Status *',
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  items: cubit.statusList,
                  onChanged: (value) {

                    cubit.stationStatusValue=value!;

                  },
                ),
              ),


              SizedBox(height: MediaQuery.sizeOf(context).height * 0.01 ,),

              /// Energy Source
              Padding(
                padding: EdgeInsets.symmetric(horizontal: MediaQuery.sizeOf(context).height*0.012),
                child: DropdownButtonFormField(
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
                  value: cubit.energySourceValue,
                  validator: (value) {
                    if (value == 'Energy Source *') {
                      return "Required";
                    }
                    return null;
                  },
                  hint: const Text(
                    'Energy Source *',
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  items: cubit.energySourceList,
                  onChanged: (value) {

                    cubit.energySourceValue=value!;

                  },
                ),
              ),


              SizedBox(height: MediaQuery.sizeOf(context).height * 0.08,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    customButton(borderColor: ColorManager.primaryColor,context: context, title: 'Next',
                        onTap: (){
                      print(cubit.stationTypeValue);
                      print(cubit.stationStatusValue);
                      print(cubit.energySourceValue);
                      if(formKey.currentState!.validate()){
                        print(cubit.stationTypeValue);
                        print(cubit.stationStatusValue);
                        print(cubit.energySourceValue);
                        CashHelper.saveData(key: 'stationName', value: nameController.text);
                        CashHelper.saveData(key: 'stationType', value: cubit.stationTypeValue);
                        CashHelper.saveData(key: 'stationStatus', value: cubit.stationStatusValue);
                        CashHelper.saveData(key: 'energySource', value: cubit.energySourceValue);
                        print(CashHelper.getData(key: 'stationName'));
                        print(CashHelper.getData(key: 'stationType'));
                        print(CashHelper.getData(key: 'stationStatus'));
                        print(CashHelper.getData(key: 'energySource'));
                        Navigator.push(context, MaterialPageRoute(builder: (context) =>const  NewChargingStationScreen2(), ));
                      }
                    }, width: MediaQuery.sizeOf(context).width * 0.3, color: ColorManager.primaryColor, textColor:Colors.white ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  },
);
  }
}
