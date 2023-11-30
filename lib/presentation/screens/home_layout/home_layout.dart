import 'package:e_electromaps/styles/colors/color_manager.dart';
import 'package:flutter/material.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        selectedLabelStyle: TextStyle(
          color: ColorManager.primaryColor,
          fontSize: MediaQuery.sizeOf(context).height * 0.02,
        ),
        selectedItemColor: ColorManager.primaryColor,
        unselectedItemColor: ColorManager.black,
        unselectedLabelStyle: TextStyle(
          color: ColorManager.black,
          fontSize: MediaQuery.sizeOf(context).height * 0.02,
        ),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home,color: ColorManager.primaryColor,),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home'
          ),
        ],
      )
    );
  }
}
