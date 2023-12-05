import 'package:e_electromaps/business_logic/cubit/app_cubit/app_cubit.dart';
import 'package:e_electromaps/business_logic/cubit/app_states/app_states.dart';
import 'package:e_electromaps/core/remote/dio_helper.dart';
import 'package:e_electromaps/presentation/screens/home_layout/home_layout.dart';
import 'package:e_electromaps/presentation/screens/splash_screen/splash_screen.dart';
import 'package:e_electromaps/styles/colors/color_manager.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'firebase_options.dart';
import 'presentation/screens/register_options_screen/register_options_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.dioInit();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: BlocConsumer<AppCubit,AppStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return  MaterialApp(
              theme: ThemeData(
                fontFamily: 'Nunito',
                appBarTheme: const AppBarTheme(
                  elevation: 0.0,
                  color: ColorManager.white,
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: ColorManager.primaryColor,
                    statusBarIconBrightness: Brightness.light,
                  )
                )
              ),
              debugShowCheckedModeBanner: false,
              home: const SplashScreen(),

            );
          }
      ),


    );
  }
}


