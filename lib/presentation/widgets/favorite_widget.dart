import 'package:e_electromaps/business_logic/cubit/app_states/app_states.dart';
import 'package:e_electromaps/business_logic/localization_cubit/app_localization.dart';
import 'package:e_electromaps/styles/colors/color_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../business_logic/cubit/app_cubit/app_cubit.dart';

class FavoriteWidget extends StatelessWidget {
  const FavoriteWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return ListView.separated(
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.all(15),
                margin: const EdgeInsets.symmetric(horizontal: 15),
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.2,
                decoration: BoxDecoration(
                  color: ColorManager.grey.withOpacity(.05),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Image(
                          color: ColorManager.primaryColor,
                          image:
                              const AssetImage('assets/images/splash_logo.png'),
                          height: MediaQuery.of(context).size.height * 0.05,
                          width: MediaQuery.of(context).size.height * 0.05,
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                cubit.allFavorite[index]
                                    ['name'],
                                style:
                                    Theme.of(context).textTheme.headlineMedium,
                              ),
                              IconButton(
                                  onPressed: () {
                                    cubit.deleteDatabase(
                                        id: cubit
                                            .allFavorite[index]['id']
                                            .toString(),
                                        context: context);
                                  },
                                  icon: const Icon(
                                    Icons.delete,
                                    color: ColorManager.red,
                                  )),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    GestureDetector(
                      onTap: () {
                        launchUrl(Uri.parse(
                            "https://www.google.com/maps/search/?api=1&query=${cubit.allFavorite[index]['lat'].toString()}+"
                            "${cubit.allFavorite[index]['long'].toString()}"));
                      },
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                                cubit.allFavorite[index]
                                    ['address'],
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(
                                        color:
                                            ColorManager.grey.withOpacity(.6))),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.height * 0.015,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.directions,
                                color: ColorManager.black,
                                size:
                                    MediaQuery.of(context).size.height * 0.025,
                              ),
                              SizedBox(
                                width:
                                    MediaQuery.of(context).size.height * 0.005,
                              ),
                              Text(
                                  AppLocalizations.of(context)!
                                      .translate("get_direction")
                                      .toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              );
            },
            itemCount: cubit.allFavorite.length);
      },
    );
  }
}
