import 'package:e_electromaps/styles/colors/color_manager.dart';
import 'package:flutter/material.dart';

class MyChargesScreen extends StatelessWidget {
  const MyChargesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Padding(
                padding:  EdgeInsets.symmetric(
                  horizontal: MediaQuery.sizeOf(context).height*.03,
                  vertical: MediaQuery.sizeOf(context).height*.05,
                ),
                child: Text('My charges',style: TextStyle(
                  color: ColorManager.textColor,
                  fontWeight: FontWeight.w500,
                  fontSize: MediaQuery.sizeOf(context).height * 0.03,
                ),),
              ),

              SizedBox(height: MediaQuery.sizeOf(context).height*.07,),

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    height: MediaQuery.sizeOf(context).height*.3,
                    width: MediaQuery.sizeOf(context).height*.3,
                    image: AssetImage('assets/images/charging.jpg'),
                  ),

                  SizedBox(height: MediaQuery.sizeOf(context).height*.05 ,),

                  Text('You haven\'t charged yet',style: TextStyle(
                    color: ColorManager.textColor,
                    fontWeight: FontWeight.w500,
                    fontSize: MediaQuery.sizeOf(context).height * 0.025,
                  ),),


                  SizedBox(height: MediaQuery.sizeOf(context).height*.05 ,),

                  Text('Once you charge, you \'ll be able to track it in this\n section, and see the old ones as well.',style: TextStyle(
                    color: ColorManager.grey,
                    fontSize: MediaQuery.sizeOf(context).height * 0.02,),
                    textAlign: TextAlign.center,
                  ),
                ],
              )

            ]
        )
    );
  }
}
