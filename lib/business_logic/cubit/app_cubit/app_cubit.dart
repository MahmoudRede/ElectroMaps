import 'package:e_electromaps/business_logic/cubit/app_states/app_states.dart';
import 'package:e_electromaps/presentation/screens/account_screen/account_screen.dart';
import 'package:e_electromaps/presentation/screens/favorites_screen/favorites_screen.dart';
import 'package:e_electromaps/presentation/screens/my_charges_screen/my_charges_screen.dart';
import 'package:e_electromaps/presentation/screens/stations_screen/stations_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppStates>{

  AppCubit() : super(InitialState());

  static AppCubit get(context) => BlocProvider.of<AppCubit>(context);

  int currentIndex=0;

  void changeBottomNavBar(int index){
    currentIndex = index;
    emit(ChangeBottomNavBarState());
  }


  List<Widget> screensLayout=[
    const StationsScreen(),
    const FavoritesScreen(),
    const MyChargesScreen(),
    const AccountScreen(),
  ];

  List<String> titlesLayout=[
    'Stations Screen',
    'Favorite charging points',
    'My charges',
    'AccountScreen',
  ];

  List<String> accountTitles=[
    'Account details',
    'About us',
    'Help & Support',
    'Terms of use',
  ];

  List<IconData> accountTitlesIcon=[
    Icons.account_circle,
    Icons.info,
    Icons.help,
    Icons.privacy_tip,
  ];



}