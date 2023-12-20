import 'package:e_electromaps/business_logic/cubit/app_cubit/app_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../business_logic/cubit/app_states/app_states.dart';
import '../../../styles/colors/color_manager.dart';

class AccountDetailsScreen extends StatelessWidget {
  const AccountDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var phoneNumberController = TextEditingController();
    var userNameController = TextEditingController();
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: const Text('Account Details'),
            ),
            body: BlocConsumer<AppCubit, AppStates>(
              listener: (context, state) {},
              builder: (context, state) {
                var cubit = AppCubit.get(context);
                return Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Stack(
                          alignment: AlignmentDirectional.bottomEnd,
                          children: [
                            CircleAvatar(
                              backgroundColor:
                                  ColorManager.black.withOpacity(.1),
                              radius: MediaQuery.sizeOf(context).height * .07,
                              child: CircleAvatar(
                                  radius:
                                      MediaQuery.sizeOf(context).height * .06,
                                  backgroundImage:
                                      NetworkImage("${cubit.userModel!.pic}")),
                            ),
                            Container(
                                height: MediaQuery.sizeOf(context).height * .04,
                                width: MediaQuery.sizeOf(context).width * .085,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: ColorManager.white,
                                ),
                                child: IconButton(
                                    onPressed: () {
                                      // cubit.uploadUserImage().then((value) {
                                      //   Navigator.pop(context);
                                      // });
                                    },
                                    icon: const Icon(
                                      Icons.camera_alt_outlined,
                                      color: ColorManager.primaryColor,
                                    )))
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * .02,
                      ),
                      //Personal data
                      Text(
                        "Personal data",
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(
                                fontWeight: FontWeight.bold,
                                color: ColorManager.textColor),
                      ),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * .03,
                      ),
                      //User Name
                      Text(
                        "User Name",
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(
                                fontWeight: FontWeight.bold,
                                color: ColorManager.black),
                      ),
                      TextFormField(
                        controller: userNameController,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                         hintText: cubit.userModel!.userName,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * .02,
                      ),
                      //Phone Number
                      Text(
                        "Phone Number",
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(
                                fontWeight: FontWeight.bold,
                                color: ColorManager.black),
                      ),
                      TextFormField(
                        controller: phoneNumberController,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          hintText: cubit.userModel!.phoneNumber,
                        ),
                      ),
                    ],
                  ),
                );
              },
            )));
  }
}
