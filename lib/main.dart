import 'package:dio/dio.dart';
import 'package:e_electromaps/core/remote/dio_helper.dart';
import 'package:e_electromaps/presentation/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.dioInit();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}


