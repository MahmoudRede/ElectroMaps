import 'package:e_electromaps/styles/colors/color_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FavoriteWidget extends StatelessWidget {
  const FavoriteWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  ListView.separated(
        itemBuilder: (context,index){
          return Container(
            padding: const EdgeInsets.all(15),
            margin: const EdgeInsets.symmetric(
              horizontal: 15
            ),
            width: double.infinity,
            height: MediaQuery.of(context).size.height*0.2,
            decoration: BoxDecoration(
              color: ColorManager.grey.withOpacity(.05),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                 children: [
                   Image(
                     color: ColorManager.primaryColor,
                     image: const AssetImage('assets/images/splash_logo.png'),
                     height: MediaQuery.of(context).size.height*0.05,
                     width: MediaQuery.of(context).size.height*0.05,),

                   SizedBox(width: MediaQuery.of(context).size.height*0.015,),

                   Text('OP-03231412',style: TextStyle(
                     fontSize: MediaQuery.of(context).size.height*0.025,
                     color: ColorManager.black,
                     fontWeight: FontWeight.w500
                   ),)
                 ],
               )  ,

                SizedBox(height: MediaQuery.of(context).size.height*0.02,),

                Row(
                  children: [
                    Expanded(
                      child: Text('Via Roma, 07020 Aggius SS, Italy ,07020 Sardegna Aggius',style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height*0.017,
                          color: ColorManager.textColor,
                          fontWeight: FontWeight.w500
                      ),),
                    ),

                    SizedBox(width: MediaQuery.of(context).size.height*0.015,),

                    Icon(
                      Icons.car_crash,
                      color: ColorManager.black,
                      size: MediaQuery.of(context).size.height*0.025,
                    ),

                    SizedBox(width: MediaQuery.of(context).size.height*0.005,),

                    Text('2300.6 km',style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height*0.015,
                        color: ColorManager.black,
                        fontWeight: FontWeight.w500
                    ),)
                  ],
                )  ,

              ],
            ),
          );
        },
        separatorBuilder: (context,index){
          return SizedBox(height: MediaQuery.of(context).size.height*0.03,);
        },
        itemCount: 2
    );
  }
}
