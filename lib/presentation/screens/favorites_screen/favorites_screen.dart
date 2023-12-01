import 'package:e_electromaps/styles/colors/color_manager.dart';
import 'package:flutter/material.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

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
            child: Text('Favorite charging points',style: TextStyle(
              color: ColorManager.textColor,
              fontWeight: FontWeight.w500,
              fontSize: MediaQuery.sizeOf(context).height * 0.03,
            ),),
          ),

          SizedBox(height: MediaQuery.sizeOf(context).height*.035,),

          Column(
            children: [
              Text('You have not added favorites yet',style: TextStyle(
                color: ColorManager.textColor,
                fontWeight: FontWeight.w500,
                fontSize: MediaQuery.sizeOf(context).height * 0.025,
              ),),

              SizedBox(height: MediaQuery.sizeOf(context).height*.05 ,),

              CircleAvatar(
                radius: MediaQuery.sizeOf(context).height*.18,
                backgroundColor: ColorManager.black.withOpacity(.1),
                child: Image(
                  height: MediaQuery.sizeOf(context).height*.3,
                  width: MediaQuery.sizeOf(context).height*.2,
                  image: AssetImage('assets/images/charging-station.png'),
                ),
              ),

              SizedBox(height: MediaQuery.sizeOf(context).height*.05 ,),

              Text('Click on the heart icon on those charging stations\n that you want to mark as favorites. Access them\n quickly and directly through this section',style: TextStyle(
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
