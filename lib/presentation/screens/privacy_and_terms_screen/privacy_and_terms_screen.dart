import 'package:e_electromaps/styles/colors/color_manager.dart';
import 'package:flutter/material.dart';

class PrivacyAndTermsScreen extends StatelessWidget {
  const PrivacyAndTermsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
           SizedBox(
            height:MediaQuery.sizeOf(context).height * 0.13 ,
          ),
          Text(
            'Terms of service',
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: ColorManager.black),
          ),
           SizedBox(
            height: MediaQuery.sizeOf(context).height*0.05,
          ),
          Image.asset(
            'assets/images/privacy_policy.jpg',
            height: MediaQuery.sizeOf(context).height*0.28,
            width:  MediaQuery.sizeOf(context).width * 0.6,
          ),
           SizedBox(
            height: MediaQuery.sizeOf(context).height*0.02,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Please review our ',style: Theme.of(context).textTheme.labelLarge!.copyWith(fontSize: 16),),
              InkWell(onTap: (){},child: Text('Terms and Conditions',style: Theme.of(context).textTheme.labelLarge!.copyWith(color: ColorManager.primaryColor,fontSize: 16),)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('and  ',style:Theme.of(context).textTheme.labelLarge!.copyWith(fontSize: 16) ,),
              InkWell(onTap: (){},child: Text('Privacy Policy',style: Theme.of(context).textTheme.labelLarge!.copyWith(color: ColorManager.primaryColor,fontSize: 16),)),
              Text('  if you wish to know ',style: Theme.of(context).textTheme.labelLarge!.copyWith(fontSize: 16),)
            ],
          ),
          Text('more about the usage details of ElectroMaps',style: Theme.of(context).textTheme.labelLarge!.copyWith(fontSize: 16),),

          SizedBox(height: MediaQuery.sizeOf(context).height * 0.15,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: GestureDetector(
              onTap: () {},
              child: Container(
                height: MediaQuery.sizeOf(context).height * 0.05,

                width:  MediaQuery.sizeOf(context).width * 0.52,
                decoration: BoxDecoration(
                    color: ColorManager.primaryColor,
                    borderRadius: BorderRadius.circular(18)),
                child:  Center(
                  child: Text(
                    'I have read and accept',
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: ColorManager.white,fontSize: 16),
                  ),
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
