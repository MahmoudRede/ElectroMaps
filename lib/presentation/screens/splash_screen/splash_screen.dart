
import 'package:e_electromaps/business_logic/cubit/app_cubit/app_cubit.dart';
import 'package:e_electromaps/business_logic/cubit/app_states/app_states.dart';
import 'package:e_electromaps/constants/constatnts.dart';
import 'package:e_electromaps/presentation/screens/home_layout/home_layout.dart';
import 'package:e_electromaps/presentation/screens/onboarding_screens/onboarding.dart';
import 'package:e_electromaps/styles/colors/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    //
    Future.delayed(const Duration(seconds: 3),()async{

      if(uId==null||uId==''){


        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
        const OnBoardingView()
        ), (Route<dynamic> route) => false);

      }
      else{

        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
        const HomeLayout()
        ), (Route<dynamic> route) => false);

      }


    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context,state){

      },
      builder: (context,state){
        return Scaffold(
          body: SafeArea(
            child: Container(
              decoration:  const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        // ColorManager.lightColor2,
                        ColorManager.primaryColor,
                        ColorManager.primaryColor,
                        // ColorManager.lightColor2,
                      ]
                  )
              ),
              height: double.infinity,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [

                  Lottie.asset(
                    'assets/images/splash.json',
                    height: 200,
                    width: 200
                  ),
                  SizedBox(height: MediaQuery.sizeOf(context).height*0.02,),
                  Text(
                    '+ MUGEEP +',style: TextStyle(
                    color: ColorManager.white,
                    fontSize: MediaQuery.sizeOf(context).height*0.032,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'PermanentMarker'
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
