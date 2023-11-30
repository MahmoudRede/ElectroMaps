import 'package:e_electromaps/core/remote/dio_helper.dart';
import 'package:e_electromaps/presentation/screens/home_screen/home_screen.dart';
import 'package:e_electromaps/presentation/screens/register_screen/register_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

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
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RegisterOptionsScreen(),
    );
  }
}


