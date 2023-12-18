import 'package:e_electromaps/business_logic/cubit/app_cubit/app_cubit.dart';
import 'package:e_electromaps/business_logic/cubit/app_states/app_states.dart';
import 'package:e_electromaps/presentation/screens/new_charging_station_screens/new_charging_station_2.dart';
import 'package:e_electromaps/presentation/widgets/Dropdown_Button_formField.dart';
import 'package:e_electromaps/presentation/widgets/custom_button.dart';
import 'package:e_electromaps/presentation/widgets/default_text_form_field.dart';
import 'package:e_electromaps/styles/colors/color_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/leave_dialog.dart';

class NewChargingStationScreen1 extends StatelessWidget {
  const NewChargingStationScreen1({Key? key}) : super(key: key);

  @override
  Widget  build(BuildContext context) {
    GlobalKey<FormState> formKey=GlobalKey<FormState>();
    var nameController = TextEditingController();

    var value='-1';

    return    BlocConsumer<AppCubit, AppStates>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
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
            children: <Widget>[
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
              Image.asset('assets/images/add_new_charging_station_image1.jpg',width: double.infinity,height: MediaQuery.sizeOf(context).height*0.2,),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.001,),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: MediaQuery.sizeOf(context).height*0.02),
                child: DefaultTextFormField(controller: nameController, textInputType: TextInputType.name, labelText: 'Charging Station Name *'),
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.01 ,),
              customDropDownButtonFormField(context, value, BlocProvider.of<AppCubit>(context).typeList,''),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.01 ,),
              customDropDownButtonFormField(context, value, BlocProvider.of<AppCubit>(context).statusList , ''),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.01 ,),
              customDropDownButtonFormField(context, value, BlocProvider.of<AppCubit>(context).energySourceList,''),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.08,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    customButton(borderColor: ColorManager.primaryColor,context: context, title: 'Next', onTap: (){
                      if(formKey.currentState!.validate()){
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
