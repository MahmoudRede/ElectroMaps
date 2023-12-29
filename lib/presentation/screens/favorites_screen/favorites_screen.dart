import 'package:e_electromaps/business_logic/cubit/app_cubit/app_cubit.dart';
import 'package:e_electromaps/business_logic/localization_cubit/app_localization.dart';
import 'package:e_electromaps/presentation/widgets/favorite_widget.dart';
import 'package:e_electromaps/styles/colors/color_manager.dart';
import 'package:flutter/material.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  void initState() {
    AppCubit.get(context).getFavouriteIds();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.sizeOf(context).height * .03,
          vertical: MediaQuery.sizeOf(context).height * .05,
        ),
        child: Text(
          AppLocalizations.of(context)!
              .translate("favorite_charging_points")
              .toString(),
          style: TextStyle(
            color: ColorManager.textColor,
            fontWeight: FontWeight.w500,
            fontSize: MediaQuery.sizeOf(context).height * 0.03,
          ),
        ),
      ),
      SizedBox(
        height: MediaQuery.sizeOf(context).height * .01,
      ),
      AppCubit.get(context).favoritesStations.isEmpty
          ? const Expanded(child: FavoriteWidget())
          : Column(
              children: [
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * .025,
                ),
                Text(
                  'You have not added favorites yet',
                  style: TextStyle(
                    color: ColorManager.textColor,
                    fontWeight: FontWeight.w500,
                    fontSize: MediaQuery.sizeOf(context).height * 0.025,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * .05,
                ),
                CircleAvatar(
                  radius: MediaQuery.sizeOf(context).height * .18,
                  backgroundColor: ColorManager.black.withOpacity(.1),
                  child: Image(
                    height: MediaQuery.sizeOf(context).height * .3,
                    width: MediaQuery.sizeOf(context).height * .2,
                    image:
                        const AssetImage('assets/images/charging-station.png'),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * .05,
                ),
                Text(
                  'Click on the heart icon on those charging stations\n that you want to mark as favorites. Access them\n quickly and directly through this section',
                  style: TextStyle(
                    color: ColorManager.grey,
                    fontSize: MediaQuery.sizeOf(context).height * 0.02,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            )
    ]));
  }
}
