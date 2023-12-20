import 'package:e_electromaps/business_logic/cubit/app_cubit/app_cubit.dart';
import 'package:e_electromaps/presentation/screens/account_screen/account_details_screen.dart';
import 'package:e_electromaps/presentation/widgets/account_content_row.dart';
import 'package:e_electromaps/styles/colors/color_manager.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height * .05,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.sizeOf(context).height * .03,
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: ColorManager.black.withOpacity(.1),
                    radius: MediaQuery.sizeOf(context).height * .065,
                    child: CircleAvatar(
                      radius: MediaQuery.sizeOf(context).height * .055,
                      backgroundImage:
                          const AssetImage('assets/images/man.png'),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).height * .02,
                  ),
                  Text(
                    'Hi, ${AppCubit.get(context).userModel!.userName}!',
                    style: TextStyle(
                      color: ColorManager.textColor,
                      fontWeight: FontWeight.w500,
                      fontSize: MediaQuery.sizeOf(context).height * 0.025,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * .04,
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: MediaQuery.sizeOf(context).height * .025,
              ),
              child: Material(
                elevation: 20,
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.sizeOf(context).height * .02,
                    vertical: MediaQuery.sizeOf(context).height * .04,
                  ),
                  decoration: BoxDecoration(
                    color: ColorManager.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(children: [
                    AccountContentRow(
                      content: 'Account details',
                      prefixIcon: Icons.account_circle,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AccountDetailsScreen(),
                            ));
                      },
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * .03,
                    ),
                    AccountContentRow(
                      content: 'About Us',
                      prefixIcon: Icons.info,
                      onTap: () {},
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * .03,
                    ),
                    AccountContentRow(
                      content: 'Help & Support',
                      prefixIcon: Icons.help,
                      onTap: () {},
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * .03,
                    ),
                    AccountContentRow(
                      content: 'Terms of use',
                      prefixIcon: Icons.privacy_tip,
                      onTap: () {},
                    ),
                  ]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
