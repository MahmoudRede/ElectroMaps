import 'package:e_electromaps/business_logic/cubit/app_cubit/app_cubit.dart';
import 'package:e_electromaps/business_logic/cubit/app_states/app_states.dart';
import 'package:e_electromaps/business_logic/localization_cubit/app_localization.dart';
import 'package:e_electromaps/styles/colors/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../new_charging_station_screens/new_charging_station_1.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);

        return Scaffold(
          extendBody:  true,
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
            shape: const StadiumBorder(
              side: BorderSide(color: ColorManager.primaryColor, width: 2),
            ),
            backgroundColor: ColorManager.primaryColor,
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NewChargingStationScreen1(),
                  ));
            },
            child: Row(mainAxisSize: MainAxisSize.min, children: [
              Icon(Icons.add_rounded,
                  color: ColorManager.white,
                  size: MediaQuery.sizeOf(context).width * 0.05),
              Icon(Icons.ev_station,
                  color: ColorManager.white,
                  size: MediaQuery.sizeOf(context).width * 0.072),
            ]),
          ),

          ///body
          body: SafeArea(child: cubit.screensLayout[cubit.currentIndex]),
          /// bottom navigation bar
          bottomNavigationBar: BottomAppBar(
              shape: const CircularNotchedRectangle(),
              notchMargin: 5,
              child: SingleChildScrollView(
                physics: NeverScrollableScrollPhysics(),
                child: BottomNavigationBar(

                  currentIndex: cubit.currentIndex,
                  onTap: (index) {
                    cubit.changeBottomNavBar(index);
                  },

                  /// items
                  items:   [
                    BottomNavigationBarItem(
                      icon: const Icon(
                        Icons.ev_station,
                      ),
                      label: AppLocalizations.of(context)!.translate("stations").toString(),
                    ),
                    BottomNavigationBarItem(
                        icon: const Icon(Icons.favorite),
                        label:  AppLocalizations.of(context)!.translate("favourite").toString()),
                    BottomNavigationBarItem(
                        icon:const Icon(Icons.battery_charging_full),
                        label:  AppLocalizations.of(context)!.translate("my_charges").toString()),
                    BottomNavigationBarItem(
                        icon: const Icon(Icons.account_circle_rounded),
                        label:  AppLocalizations.of(context)!.translate("account").toString()),
                  ],
                ),
              )),
        );
      },
    );
  }
}
