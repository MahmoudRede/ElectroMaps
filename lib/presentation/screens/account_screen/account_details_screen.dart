import 'package:country_code_picker/country_code_picker.dart';
import 'package:e_electromaps/business_logic/cubit/app_cubit/app_cubit.dart';
import 'package:e_electromaps/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../business_logic/cubit/app_states/app_states.dart';
import '../../../business_logic/localization_cubit/app_localization.dart';
import '../../../styles/colors/color_manager.dart';
import '../../widgets/delete_account_dialog.dart';

class AccountDetailsScreen extends StatelessWidget {
  const AccountDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title:   Text(AppLocalizations.of(context)!.translate("account_details").toString()),
            ),
            body: BlocConsumer<AppCubit, AppStates>(
              listener: (context, state) {},
              builder: (context, state) {
                var cubit = AppCubit.get(context);
                return Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SingleChildScrollView(
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
                                        MediaQuery.sizeOf(context).width * .15,
                                    backgroundImage:  NetworkImage(
                                        "${cubit.userModel!.pic}")),
                              ),
                              Container(
                                  height:
                                      MediaQuery.sizeOf(context).height * .04,
                                  width:
                                      MediaQuery.sizeOf(context).width * .085,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: ColorManager.white,
                                  ),
                                  child: IconButton(
                                      onPressed: () {
                                        cubit.getProfileImage().then((value) {
                                          cubit.uploadUserImage();
                                        });
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
                          AppLocalizations.of(context)!.translate("personal_data").toString(),
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
                          AppLocalizations.of(context)!.translate("user_name").toString(),
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: ColorManager.black),
                        ),
                        TextFormField(
                          enabled: true,
                          keyboardType: TextInputType.name,
                          initialValue: cubit.userModel!.userName,
                          onChanged: (value) {
                            cubit.userModel!.userName = value;
                          },
                          decoration: InputDecoration(
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(color: ColorManager.textColor)),
                        ),
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * .02,
                        ),
                        //Phone Number
                        Text(
                          AppLocalizations.of(context)!.translate("phone_number").toString(),
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: ColorManager.black),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: CountryCodePicker(
                                  showDropDownButton: true,
                                  textOverflow: TextOverflow.visible,
                                  textStyle: Theme.of(context).textTheme.headlineSmall,
                                  onChanged: (CountryCode countryCode) {
                                    cubit.userModel!.countryCode=countryCode.dialCode;
                                    debugPrint(
                                        'New Country selected: ${countryCode.dialCode}');

                                  },
                                  initialSelection: cubit.userModel?.countryCode,
                                  dialogSize: Size(
                                      MediaQuery.sizeOf(context).width * 0.8,
                                      MediaQuery.sizeOf(context).height * 0.6),
                                  dialogTextStyle: Theme.of(context).textTheme.headlineSmall,
                                  flagDecoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                  ),

                                ),
                              ),
                            ),
                            Expanded(
                              child: TextFormField(
                                enabled: true,
                                initialValue: cubit.userModel!.phoneNumber,
                                onChanged: (value) {
                                  cubit.userModel!.phoneNumber = value;
                                },
                                keyboardType: TextInputType.phone,
                                decoration: InputDecoration(
                                    hintStyle: Theme.of(context)
                                        .textTheme
                                        .headlineSmall!
                                        .copyWith(color: ColorManager.textColor)),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * .28,
                        ),

                        state is UpdateUserDetailsLoadingState ?const Center(child: CircularProgressIndicator()):customButton(
                            context: context,
                            title: AppLocalizations.of(context)!.translate("save").toString(),
                            onTap: () {
                              cubit.editUserDetails(context).then((value) {
                                if(state is UpdateUserDetailsSuccessState){
                                  Navigator.pop(context);
                                }
                              });
                            },
                            width: MediaQuery.sizeOf(context).width,
                            color: ColorManager.secondaryColor,
                            textColor: ColorManager.white,
                            borderColor: ColorManager.white, color2: ColorManager.primaryColor),
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * .02,
                        ),
                        customButton(
                            context: context,
                            title: AppLocalizations.of(context)!.translate("delete_account").toString(),
                            onTap: () {
                              confirmDeleteDialog(context);
                            },
                            width: MediaQuery.sizeOf(context).width,
                            color: ColorManager.white,
                            textColor: ColorManager.red,
                            borderColor: ColorManager.red, color2: ColorManager.white)
                      ],
                    ),
                  ),
                );
              },
            )));
  }
}
