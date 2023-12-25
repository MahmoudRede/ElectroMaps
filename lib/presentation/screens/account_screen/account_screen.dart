import 'package:e_electromaps/business_logic/cubit/app_cubit/app_cubit.dart';
import 'package:e_electromaps/business_logic/cubit/app_states/app_states.dart';
import 'package:e_electromaps/presentation/screens/account_screen/account_details_screen.dart';
import 'package:e_electromaps/presentation/screens/login_screen/login_screen.dart';
import 'package:e_electromaps/presentation/widgets/account_content_row.dart';
import 'package:e_electromaps/presentation/widgets/language_bottom_sheet.dart';
import 'package:e_electromaps/styles/colors/color_manager.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../business_logic/localization_cubit/app_localization.dart';
class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocConsumer<AppCubit, AppStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = AppCubit.get(context);
            return Column(
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
                        backgroundColor: ColorManager.grey.withOpacity(.1),
                        radius: MediaQuery.sizeOf(context).height * .065,
                        child: CircleAvatar(
                          radius: MediaQuery.sizeOf(context).height * .063,
                          backgroundImage: NetworkImage(
                            '${cubit.userModel!.pic}',
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.sizeOf(context).height * .02,
                      ),

                      Expanded(
                        child: Text(
                          'Hi, ${AppCubit.get(context).userModel!.userName}!',
                          style: TextStyle(
                            color: ColorManager.textColor,
                            fontWeight: FontWeight.w500,
                            fontSize: MediaQuery.sizeOf(context).height * 0.025,
                          ),

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
                        // account details
                        AccountContentRow(
                          isLogout: false,
                          content: AppLocalizations.of(context)!
                              .translate("account_details")
                              .toString(),
                          prefixIcon: Icons.account_circle,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const AccountDetailsScreen(),
                                ));
                          },
                        ),
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * .03,
                        ),
                        // About us
                        AccountContentRow(
                          isLogout: false,
                          content: AppLocalizations.of(context)!
                              .translate("about_us")
                              .toString(),
                          prefixIcon: Icons.info,
                          onTap: () {},
                        ),
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * .03,
                        ),
                        // Help & Support
                        AccountContentRow(
                          isLogout: false,
                          content: AppLocalizations.of(context)!
                              .translate("helps_support")
                              .toString(),
                          prefixIcon: Icons.help,
                          onTap: () {
                            launch('tel:+966 57 006 7776');
                          },
                        ),
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * .03,
                        ),
                        // Terms of use
                        AccountContentRow(
                          isLogout: false,
                          content: AppLocalizations.of(context)!
                              .translate("terms_of_use")
                              .toString(),
                          prefixIcon: Icons.privacy_tip,
                          onTap: () {
                            AppCubit.get(context).toLocation(
                                locationLink:
                                    'https://www.freeprivacypolicy.com/live/c0ee349f-627f-4943-b3b5-0eb7d99213b2');
                          },
                        ),
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * .03,
                        ),
                        // Language
                        AccountContentRow(
                          isLogout: false,
                          content: AppLocalizations.of(context)!
                              .translate("language")
                              .toString(),
                          prefixIcon: Icons.language_rounded,
                          onTap: () {
                            languageBottomSheet(context);
                          },
                        ),
                        // SizedBox(
                        //   height: MediaQuery.sizeOf(context).height * .03,
                        // ),
                        // AccountContentRow(
                        //   isLogout: false,
                        //
                        //   content: 'Tell Your Friends',
                        //   prefixIcon: Icons.share,
                        //   onTap: () {
                        //   },
                        // ),

                        // Logout
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * .03,
                        ),
                        AccountContentRow(
                          isLogout: true,
                          content: AppLocalizations.of(context)!
                              .translate("logout")
                              .toString(),
                          prefixIcon: Icons.logout_outlined,
                          onTap: () {
                            FirebaseAuth.instance.signOut();
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginScreen()),
                                    (Route<dynamic> route) => false).then((value) {
                                      cubit.currentIndex=0;
                            });
                          },
                        ),
                      ]),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
