import 'package:e_electromaps/business_logic/cubit/app_cubit/app_cubit.dart';
import 'package:e_electromaps/styles/colors/color_manager.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
     children: [

       SizedBox(height: MediaQuery.sizeOf(context).height*.05,),

       Padding(
         padding: EdgeInsets.symmetric(
           horizontal:MediaQuery.sizeOf(context).height*.03,
         ),
         child: Row(
           children: [
             CircleAvatar(
               backgroundColor: ColorManager.black.withOpacity(.1),
               radius: MediaQuery.sizeOf(context).height*.065,
               child: CircleAvatar(
                 radius: MediaQuery.sizeOf(context).height*.055,
                 backgroundImage: const AssetImage('assets/images/man.png'),
               ),
             ),
             SizedBox(width: MediaQuery.sizeOf(context).height*.02,),
             Text('Hi,Mahmoud !',style: TextStyle(
               color: ColorManager.textColor,
               fontWeight: FontWeight.w500,
               fontSize: MediaQuery.sizeOf(context).height * 0.025,
             ),)
           ],
         ),
       ),

       SizedBox(height: MediaQuery.sizeOf(context).height*.04,),

       Container(
         margin: EdgeInsets.symmetric(
           horizontal: MediaQuery.sizeOf(context).height*.025,
         ),
         child: Material(
           elevation: 20,
           borderRadius: BorderRadius.circular(15),
           child: Container(
             padding: EdgeInsets.symmetric(
               horizontal: MediaQuery.sizeOf(context).height*.02,
               vertical: MediaQuery.sizeOf(context).height*.04,
             ),
             decoration: BoxDecoration(
               color: ColorManager.white,
               borderRadius: BorderRadius.circular(15),
             ),
             child: ListView.separated(
                 shrinkWrap: true,
                 itemBuilder: (context,index){
                   return  Row(
                     children: [
                       Icon(
                         AppCubit.get(context).accountTitlesIcon[index],
                         color: ColorManager.textColor,
                         size: MediaQuery.sizeOf(context).height*.03,
                       ),
                       SizedBox(width: MediaQuery.sizeOf(context).height*.01,),

                       Text(AppCubit.get(context).accountTitles[index],style: TextStyle(
                         color: ColorManager.textColor,
                         fontWeight: FontWeight.w500,
                         fontSize: MediaQuery.sizeOf(context).height*.023,
                       )),
                       const Spacer(),
                       Icon(
                         Icons.arrow_forward_ios_outlined,
                         color: ColorManager.textColor,
                         size: MediaQuery.sizeOf(context).height*.023,
                       ),
                     ]
                   );
                 },
                 separatorBuilder: (context, index) {
                   return SizedBox(height: MediaQuery.sizeOf(context).height*.04,);
                 },
                 itemCount: AppCubit.get(context).accountTitles.length
             ),
           ),
         ),
       ),


     ],
    );
  }
}
