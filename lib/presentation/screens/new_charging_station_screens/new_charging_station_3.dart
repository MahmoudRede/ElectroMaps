import 'package:e_electromaps/presentation/widgets/default_text_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../styles/colors/color_manager.dart';
import '../../widgets/custom_button.dart';

class NewChargingStationScreen3 extends StatelessWidget {
  const NewChargingStationScreen3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var addressController = TextEditingController();
    var numberController = TextEditingController();
    var whereController = TextEditingController();
    GlobalKey<FormState> formKey=GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(icon:const  Icon(Icons.close,color: Colors.white,),onPressed: (){Navigator.pop(context);},),
        backgroundColor: ColorManager.primaryColor,
        title:  Text('New Charging Station',style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: Colors.white),),
      ),
      body: Form(
        key:formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MediaQuery.sizeOf(context).height*0.045,
                margin: EdgeInsets.all(MediaQuery.sizeOf(context).width*0.05),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: ColorManager.grey.withOpacity(0.02),
                ),
                child: Center(child: Text('Charging Station Information(Step 3of6)',style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: ColorManager.textColor),)),
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.001,),
              Text('This is the location:',style: Theme.of(context).textTheme.headlineMedium,),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.001,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  width: double.infinity,
                  height:MediaQuery.sizeOf(context).height * 0.25 ,
                  color: ColorManager.primaryColor,
                  child:const Center(child: Text('MapHere')),
                ),
              ),
              SizedBox(height:MediaQuery.sizeOf(context).height * 0.03 ,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(child: DefaultTextFormField(controller: addressController, textInputType: TextInputType.text, labelText: 'Address *')),
                    SizedBox(width: MediaQuery.sizeOf(context).width * 0.03,),
                    Expanded(child: DefaultTextFormField(controller: numberController, textInputType: TextInputType.text, labelText: 'Number *'))
                  ],
                ),

              ),
              SizedBox(height:MediaQuery.sizeOf(context).height * 0.02 ,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  controller: whereController,style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  fontSize: 15.0,
                  color: ColorManager.black,
                ),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    labelText: 'How to get there',
                    labelStyle:Theme.of(context).textTheme.headlineSmall!.copyWith(
                      fontSize: 16.0,
                      color: ColorManager.black,
                    ),),)
              ),

              SizedBox(height: MediaQuery.sizeOf(context).height * 0.25,),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20,right: 20,bottom: 30),
                  child: Row(
                    children: [
                      Expanded(child: customButton(borderColor:Colors.black,context: context, title: 'Previous', onTap: (){Navigator.pop(context);}, width: MediaQuery.sizeOf(context).width *0.35, color: Colors.white, textColor: ColorManager.textColor)),
                      SizedBox(width: MediaQuery.sizeOf(context).width * 0.05,),
                      Expanded(
                        child: customButton(borderColor: ColorManager.primaryColor,context: context, title: 'Next',
                            onTap: (){if (formKey.currentState!.validate()) {}}, width: MediaQuery.sizeOf(context).width *0.35, color: ColorManager.primaryColor, textColor: ColorManager.white),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}