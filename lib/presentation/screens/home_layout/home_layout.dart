import 'package:e_electromaps/business_logic/cubit/app_cubit/app_cubit.dart';
import 'package:e_electromaps/business_logic/cubit/app_states/app_states.dart';
import 'package:e_electromaps/styles/colors/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<AppCubit,AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit=AppCubit.get(context);

          return Scaffold(

              ///body
              body: SafeArea(
                  child: cubit.screensLayout[cubit.currentIndex]
              ),

              /// bottom navigation bar
              bottomNavigationBar: BottomNavigationBar(

                currentIndex: cubit.currentIndex,
                onTap: (index) {
                  cubit.changeBottomNavBar(index);
                },
                type: BottomNavigationBarType.fixed,

                selectedLabelStyle: TextStyle(
                  color: ColorManager.primaryColor,
                  fontSize: MediaQuery.sizeOf(context).height * 0.02,
                ),
                selectedItemColor: ColorManager.primaryColor,

                unselectedItemColor: ColorManager.black.withOpacity(.3),
                unselectedLabelStyle: TextStyle(
                  color: ColorManager.black,
                  fontSize: MediaQuery.sizeOf(context).height * 0.016,
                ),

                /// items
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.ev_station,),
                    label: 'Stations',
                  ),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.favorite),
                      label: 'Favorites'
                  ),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.battery_charging_full),
                      label: 'My Charges'
                  ),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.account_circle_rounded),
                      label: 'Account'
                  ),
                ],
              ),

          );
        },
    );
  }
}
