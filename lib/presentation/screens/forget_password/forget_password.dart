import 'package:e_electromaps/styles/colors/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../business_logic/cubit/app_cubit/app_cubit.dart';
import '../../../business_logic/localization_cubit/app_localization.dart';
import '../../widgets/default_text_form_field.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  static var emailController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        titleSpacing: 0.0,
        title: Text(AppLocalizations.of(context)!.translate("reset_password").toString(), style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: ColorManager.white) ,
        ),
      ),
      body: Container(
        child: Column(
          children: [
            const SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 12.0),
              child: DefaultTextFormField(
                  hintText:
                  AppLocalizations.of(context)!
                      .translate('email')
                      .toString(),
                  controller: emailController,
                  textInputType:
                  TextInputType.emailAddress,
                  prefixIcon: Icons.email,
                  hintColor: ColorManager.primaryColor,
                labelText:  AppLocalizations.of(context)!
                    .translate('email')
                    .toString(),),
            ),

            Container(
              margin: const EdgeInsets.only(
                  top: 60,
                  left: 15,
                  right: 15
              ),
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius:
                  BorderRadius.circular(40)),
              child: MaterialButton(
                  height: 50,
                  color: ColorManager.primaryColor,
                  textColor: Colors.white,

                  onPressed: (){
                    AppCubit.get(context).resetPassword(email: emailController.text,);
                  },
                  child: Text(AppLocalizations.of(context)!.translate("reset_password").toString(),
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: ColorManager.white
                    ),
                  )
              ),
            )
          ],
        ),
      ),
    );
  }
}
