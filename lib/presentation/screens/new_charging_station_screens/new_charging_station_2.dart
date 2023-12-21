import 'dart:async';
import 'dart:developer';

import 'package:e_electromaps/business_logic/cubit/app_cubit/app_cubit.dart';
import 'package:e_electromaps/business_logic/cubit/app_states/app_states.dart';
import 'package:e_electromaps/data/model/search_suggestion_model/search_suggesions_model.dart';
import 'package:e_electromaps/presentation/screens/new_charging_station_screens/new_charging_station_3.dart';
import 'package:e_electromaps/presentation/widgets/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:uuid/uuid.dart';
import '../../../styles/colors/color_manager.dart';
import '../../widgets/leave_dialog.dart';

class NewChargingStationScreen2 extends StatefulWidget {
  const NewChargingStationScreen2({Key? key}) : super(key: key);

  @override
  State<NewChargingStationScreen2> createState() => _NewChargingStationScreen2State();
}

class _NewChargingStationScreen2State extends State<NewChargingStationScreen2> {
  static const  CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14,
  );

  final Completer<GoogleMapController> _controller =
  Completer<GoogleMapController>();
  var uuid = Uuid();


  // variables for setlocation


  // late SearchSuggestionModel placeSuggestion;
  // late PlaceDetailsModel selectedPlace;
  // late Marker searchedPlaceMarker;











  @override
  Widget build(BuildContext context) {


    var placeController = TextEditingController();
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final Completer<GoogleMapController> _controller =
    Completer<GoogleMapController>();




    return BlocConsumer<AppCubit, AppStates>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    // final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: CloseButton(
          onPressed: () {
            closeDialog(context);
          },
          color: ColorManager.white,
        ),

        backgroundColor: ColorManager.primaryColor,
        title: Text(
          'New Charging Station',
          style: Theme.of(context)
              .textTheme
              .headlineMedium!
              .copyWith(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Container(
                height: MediaQuery.sizeOf(context).height * 0.045,
                margin: EdgeInsets.all(MediaQuery.sizeOf(context).width * 0.05),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: ColorManager.grey.withOpacity(0.02),
                ),
                child: Center(
                    child: Text(
                  'Charging Station Information(Step 2/6)',
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(color: ColorManager.textColor),
                )),
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.001,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child:TypeAheadField<SearchSuggestionModel>(

                  controller: placeController,
                  suggestionsCallback: (search) {
                    BlocProvider.of<AppCubit>(context).getSearchSuggestions(
                        search, uuid.v4());
                    return BlocProvider.of<AppCubit>(context).suggestions;
                  },
                  builder: (context, placeController, focusNode) {
                    return TextFormField(

                        controller: placeController,
                        focusNode: focusNode,
                        decoration:  InputDecoration(
                            labelText: 'Where is the charging station?',
                          errorStyle: Theme.of(context).textTheme.headlineSmall!.copyWith(
                            fontSize: 13.0,
                            color: ColorManager.red,
                        ),

                    ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Required field';
                        }
                        return null;
                      },
                    );
                  },
                  itemBuilder: (context, suggestion) {
                    return ListTile(
                      title: Text(suggestion.description),

                    );
                  },

                  onSelected: (suggestion) async{
                    placeController.text = suggestion.description;
                   var place= await BlocProvider.of<AppCubit>(context).getPlaceLocation(placeId: suggestion.placeId, sessionToken: uuid.v4());
                   await  BlocProvider.of<AppCubit>(context).goToMySearchedForLocation(place.result.geometry.location.lat, place.result.geometry.location.lng, _controller);
                    FocusScope.of(context).unfocus();

                  },

                ),

              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.02,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  width: double.infinity,
                  height: MediaQuery.sizeOf(context).height * 0.6,

                  child:Stack(
                    children: [
                      GoogleMap(

                        gestureRecognizers: {
                          Factory<OneSequenceGestureRecognizer>(() => EagerGestureRecognizer())
                        },
                          mapType: MapType.normal,
                        onCameraMove: (position) async{
                           BlocProvider.of<AppCubit>(context).locationPosition =position.target;
                           log(BlocProvider.of<AppCubit>(context).locationPosition.latitude.toString());
                        },
                          initialCameraPosition: _kGooglePlex,
                          onMapCreated: (GoogleMapController controller) {
                            _controller.complete(controller);
                          },


                ),
                      const Align(
                          alignment: Alignment.center,
                          child: Icon(Icons.location_on)),
                    ],
                  ),
              ),),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.03,
              ),
              Padding(
                padding:  EdgeInsets.only(left: 20, right: 20, bottom:  MediaQuery.sizeOf(context).height * 0.03),
                child: Row(
                  children: [
                    Expanded(
                        child: customButton(
                            borderColor: ColorManager.grey,
                            context: context,
                            title: 'Previous',
                            onTap: () {
                              Navigator.pop(context);
                            },
                            width: MediaQuery.sizeOf(context).width * 0.35,
                            color: Colors.white,
                            textColor: ColorManager.textColor)),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.05,
                    ),
                    Expanded(
                      child: customButton(
                          borderColor: ColorManager.primaryColor,
                          context: context,
                          title: 'Next',
                          onTap: () {
                            if (formKey.currentState!.validate() ) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const NewChargingStationScreen3(),
                                  ));

                             BlocProvider.of<AppCubit>(context).mainAddress =placeController.text;
                            }
                          },
                          width: MediaQuery.sizeOf(context).width * 0.35,
                          color: ColorManager.primaryColor,
                          textColor: ColorManager.white),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  },
);
  }
}


