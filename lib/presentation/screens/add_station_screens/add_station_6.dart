import 'package:flutter/material.dart';

import '../../../styles/colors/color_manager.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/leave_dialog.dart';

class AddStationSix extends StatelessWidget {
  const AddStationSix({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'New Charger Station',
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .copyWith(color: ColorManager.white),
          ),
          leading: CloseButton(
            onPressed: () {
              closeDialog(context);
            },
            color: ColorManager.white,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: SizedBox(
            height: MediaQuery.sizeOf(context).height,
            width: MediaQuery.sizeOf(context).width,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment:  MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: MediaQuery.sizeOf(context).height * .05,
                    width: MediaQuery.sizeOf(context).width * .56,
                    decoration: BoxDecoration(
                        color: ColorManager.grey.withOpacity(0.07),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(25))),
                    child: Center(
                        child: Text(
                      'Contact Information (Step 6/6)',
                      style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                            fontSize: 14,
                            color: ColorManager.textColor,
                          ),
                    )),
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * .04,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Owner-Related-Information",
                      style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          fontSize: 14,
                          color: ColorManager.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * .03,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Proprietary',
                          hintStyle:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                            fontSize: 18,
                            color: ColorManager.textColor,
                          ),
                        )),
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * .03,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Email',
                          hintStyle:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                            fontSize: 18,
                            color: ColorManager.textColor,
                          ),
                        )),
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * .03,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Phone number',
                          hintStyle:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                            fontSize: 18,
                            color: ColorManager.textColor,
                          ),
                        )),
                  ),
                  SizedBox(height:  MediaQuery.sizeOf(context).height * .39,),
                  Row(
                    children: [
                      Expanded(
                        child: customButton(
                            context: context,
                            title: 'Previous',
                            onTap: () {
                              Navigator.pop(context);
                            },
                            width: MediaQuery
                                .sizeOf(context)
                                .width * .3,
                            color: ColorManager.white,
                            textColor: ColorManager.black,
                            borderColor: ColorManager.grey.withOpacity(.2)),
                      ),
                      SizedBox(
                        width: MediaQuery
                            .sizeOf(context)
                            .width * .05,
                      ),
                      Expanded(
                        child: customButton(
                            context: context,
                            title: 'Finish',
                            onTap: () {},
                            width: MediaQuery
                                .sizeOf(context)
                                .width * .3,
                            color: ColorManager.primaryColor,
                            textColor: ColorManager.white,
                            borderColor: ColorManager.primaryColor),
                      ),
                    ],
                  )

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
