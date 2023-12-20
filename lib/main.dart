import 'package:e_electromaps/business_logic/cubit/app_cubit/app_cubit.dart';
import 'package:e_electromaps/business_logic/cubit/app_states/app_states.dart';
import 'package:e_electromaps/core/remote/dio_helper.dart';
import 'package:e_electromaps/presentation/screens/account_screen/account_screen.dart';
import 'package:e_electromaps/presentation/screens/home_layout/home_layout.dart';
import 'package:e_electromaps/presentation/screens/register_screen/register_screen.dart';
import 'package:e_electromaps/presentation/screens/splash_screen/splash_screen.dart';
import 'package:e_electromaps/styles/theme_manager/theme_manager.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'constants/constatnts.dart';
import 'core/local/cash_helper.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CashHelper.init();
  DioHelper.dioInit();
  uId = CashHelper.getData(key: 'isUid');
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) =>
              AppCubit()..getUser(id: uId == null ? uId = '' : uId!),
        ),
      ],
      child: BlocConsumer<AppCubit, AppStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return MaterialApp(
              theme: getApplicationTheme(context),
              debugShowCheckedModeBanner: false,
              home: const HomeLayout(),
            );
          }),
    );
  }
}
