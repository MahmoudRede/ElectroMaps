
import 'dart:async';
import 'dart:developer';

import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:e_electromaps/business_logic/cubit/app_states/app_states.dart';

import 'package:e_electromaps/core/remote/dio_helper.dart';
import 'package:e_electromaps/data/model/search_suggestion_model/search_suggesions_model.dart';

import 'package:e_electromaps/data/model/station_model/station_model.dart';

import 'package:e_electromaps/presentation/screens/account_screen/account_screen.dart';
import 'package:e_electromaps/presentation/screens/favorites_screen/favorites_screen.dart';
import 'package:e_electromaps/presentation/screens/my_charges_screen/my_charges_screen.dart';
import 'package:e_electromaps/presentation/screens/stations_screen/stations_screen.dart';
import 'package:e_electromaps/presentation/widgets/custom_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sqflite/sqflite.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:image_picker/image_picker.dart';


import '../../../constants/firebase_errors.dart';
import '../../../core/local/cash_helper.dart';
import '../../../data/model/place_details_model/place_details_model.dart';
import '../../../data/model/user_model/user_model.dart';
import '../../../presentation/widgets/custom_toast.dart';
import '../../../styles/colors/color_manager.dart';
import '../../localization_cubit/app_localization.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(InitialState(
  ));

  static AppCubit get(context) => BlocProvider.of<AppCubit>(context);

  int currentIndex = 0;

  void changeBottomNavBar(int index) {
    currentIndex = index;
    emit(ChangeBottomNavBarState());
  }

  List<Widget> screensLayout = [
    const StationsScreen(),
    const FavoritesScreen(),
    const MyChargesScreen(),
    const AccountScreen(),
  ];

  List<String> titlesLayout = [
    'Stations Screen',
    'Favorite charging points',
    'My charges',
    'AccountScreen',
  ];
  ////sign up////
  void createAccountWithFirebaseAuth(
      {required String password,
      required String name,
      required String phone,
      required String countryCode,
      required BuildContext context}) async {
    try {
      emit(SignUpLoadingState());
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: '$phone@gmail.com',
        password: password,
      );

      await saveUser(
        name: name,
        phoneNumber: phone,
        id: (credential.user?.uid)!, countryCode: CashHelper.getData(key: 'countryCode'),
      ).then((value) {
        getUser(id: (credential.user?.uid)!);
        CashHelper.saveData(key: 'isUid', value: credential.user?.uid);
        customToast(
          title: AppLocalizations.of(context)!.translate("account_created_successfully").toString(),
          color: Colors.green.shade700,
        );
        emit(SignUpSuccessState());
        debugPrint("--------------Account Created");
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == FirebaseErrors.weakPassword) {
      } else if (CashHelper.getData(key: 'isUid') != null) {
        customToast(
          title: AppLocalizations.of(context)!.translate("account_already_exists").toString(),
          color: ColorManager.red,
        );
        emit(SignUpErrorState(e.toString()));
        debugPrint("--------------Failed To Create Account");
      }
    }
  }
  //// login ////
  Future<void> loginWithFirebaseAuth(
      {required BuildContext context,
      required String phone,
      required String countryCode,
        required String password}) async {
    try {
      emit(LoginLoadingState());
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: '$phone@gmail.com',
        password: password,
      );
      await getUser(id: (credential.user?.uid)!);
      UserModel? user = await readUserFromFireStore(credential.user?.uid ?? "");
      if (user != null) {
        CashHelper.saveData(key: 'isUid', value: credential.user?.uid);
        await getUser(id: (credential.user?.uid)!);
        emit(LoginSuccessState());
        debugPrint(CashHelper.getData(key: 'isUid'));
        debugPrint("-----------Login Successfully");
        return customToast(
            title: AppLocalizations.of(context)!.translate("login_successfully").toString(), color: Colors.green.shade700);
      } else {
        return customToast(
            title: AppLocalizations.of(context)!.translate("invalid_email_or_password").toString(), color: Colors.red.shade700);
      }
    } on FirebaseAuthException catch (e) {
      emit(LoginErrorState(e.toString()));
      debugPrint("-----------Login Failed");

      customToast(title: 'Invalid email or password', color: ColorManager.red);
    } catch (e) {
      customToast(title: 'Something went wrong $e', color: ColorManager.red);
    }
  }


  //// Edit User Details////
  Future<void> editUserDetails(BuildContext context) {
    emit(UpdateUserDetailsLoadingState());
    CollectionReference editRef = getUsersCollection();
    return editRef.doc(CashHelper.getData(key: "isUid")).update({
      "userName": userModel!.userName,
      "phoneNumber": userModel!.phoneNumber,
      "countryCode": userModel!.countryCode,
    }).then((value){
      customToast(title: AppLocalizations.of(context)!.translate("data_updated_successfully").toString(), color: Colors.green.shade700);
      emit(UpdateUserDetailsSuccessState());
    });

  }


  //// Save User ////
  Future<void> saveUser({
    required String name,
    required String phoneNumber,
    required String id,
    required countryCode
  }) async {
    emit(SaveUserLoadingState());

    UserModel userModel = UserModel(
      userName: name,
      phoneNumber: phoneNumber,
      uId: id,
      pic:
          'https://img.freepik.com/free-vector/businessman-character-avatar-isolated_24877-60111.jpg?w=740&t=st=1703015640~exp=1703016240~hmac=d32203ed9a0132b11db5f3890f4293174475e278eb0239a283c39443ae15a38b',
      countryCode: "+966",
    );

    FirebaseFirestore.instance
        .collection('Users')
        .doc(userModel.uId)
        .set(userModel.toJson())
        .then((value) {
      debugPrint('Save User Success');
      emit(SaveUserSuccessState());
    }).catchError((error) {
      debugPrint('Error in user Register is ${error.toString()}');
      emit(SaveUserErrorState(error.toString()));
    });
  }

  //// get user ////
  UserModel? userModel;

  Future<void> getUser({required String id}) async {
    emit(GetUserLoadingState());
    FirebaseFirestore.instance.collection('Users').doc(id).get().then((value) {
      userModel = UserModel.fromJson(value.data()!);
      debugPrint(userModel!.userName);
      debugPrint('here');
      emit(GetUserSuccessState());
    }).catchError((error) {
      debugPrint(error.toString());
      emit(GetUserErrorState());
    });
  }

    //// User Reference////

  CollectionReference<UserModel> getUsersCollection() {
    return FirebaseFirestore.instance
        .collection(UserModel.collectionName)
        .withConverter(
          fromFirestore: (snapshot, options) =>
              UserModel.fromJson(snapshot.data()!),
          toFirestore: (value, options) => value.toJson(),
        );
  }

    //// read user ////

  Future<UserModel?> readUserFromFireStore(String id) async {
    DocumentSnapshot<UserModel> user = await getUsersCollection().doc(id).get();
    var myUser = user.data();
    return myUser;
  }


  //// delete user////
  Future<void> deleteUser({
    required String id,
    required context,
  }) async {
    emit(DeleteUserLoadingState());

    FirebaseFirestore.instance
        .collection('Users')
        .doc(id)
        .delete()
        .then((value) {
      CashHelper.removeData(key: "isUid");
      customToast(title: AppLocalizations.of(context)!.translate("account_deleted_successfully").toString(), color: Colors.red.shade700);

      debugPrint('Account Deleted Successfully');

      emit(DeleteUserSuccessState());
    }).catchError((error) {
      debugPrint('Error in DeleteUser is ${error.toString()}');
      emit(DeleteUserErrorState());
    });
  }


  //// forget password////

  Future<void> resetPassword({required String email}) async {
    emit(ForgetPasswordLoadingState());

    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      await auth.sendPasswordResetEmail(email: email);
      customToast(title: 'check your email', color: ColorManager.primaryColor);
      emit(ForgetPasswordSuccessState());

    } catch (e) {
      // An error occurred, handle the error
      log('Error in ResetPassword is ${e.toString()}');
      emit(ForgetPasswordErrorState());
    }
  }

  // void forgetPassword({required String email,required context}){
  //   emit(ForgetPasswordLoadingState());
  //   FirebaseAuth.instance.sendPasswordResetEmail(
  //       email: email
  //   ).then((value) {
  //     print('Check Your email');
  //     customToast(title: 'check your email', color: ColorManager.primaryColor);
  //     emit(ForgetPasswordSuccessState());
  //   }).catchError((error){
  //     print('Error in ResetPassword is ${error.toString()}');
  //     emit(ForgetPasswordErrorState());
  //   });
  // }

  //  Future<void> sendPasswordResetEmail(String email) async {
  //     return _firebaseAuth.sendPasswordResetEmail(email: email);
  //   }

  ///// New Charging Staions DropDown Lists /////
  var typeList = const  [
    DropdownMenuItem(value: "Station Charging Type *", child: Text('Station Charging Type *')),
    DropdownMenuItem(value: "Public road", child: Text('Public road')),
    DropdownMenuItem(value: "Parking", child: Text('Parking')),
    DropdownMenuItem(value: "Airport", child: Text('Airport')),
    DropdownMenuItem(value: "Camping", child: Text('Camping')),
    DropdownMenuItem(value: "Hotel", child: Text('Hotel')),
    DropdownMenuItem(value: "Private", child: Text('Private')),
    DropdownMenuItem(value: "Restaurant", child: Text('Restaurant')),
    DropdownMenuItem(value: "Shop", child: Text('Shop')),
    DropdownMenuItem(value: "Workshop", child: Text('Workshop')),
    DropdownMenuItem(value: "Service station", child: Text('Service station')),
    DropdownMenuItem(value: "Car dealer", child: Text('Car dealer')),
    DropdownMenuItem(value: "Mall", child: Text('Mall')),
    DropdownMenuItem(value: "Private user", child: Text('Private user')),
    DropdownMenuItem(value: "Taxi", child: Text('Taxi')),
  ];

  var statusList = const [
    DropdownMenuItem(
        value: "Station Charging Status *",
        child: Text('Station Charging Status *')),
    DropdownMenuItem(value: "Working", child: Text('Working')),
    DropdownMenuItem(
        value: "Some stations don\'t work",
        child: Text('Some stations don\'t work')),
    DropdownMenuItem(value: "Not working", child: Text('Not working')),
    DropdownMenuItem(value: "Unknown", child: Text('Unknown')),
  ];

  var energySourceList = const [
    DropdownMenuItem(value: "Energy Source *", child: Text('Energy Source *')),
    DropdownMenuItem(value: "Renewable", child: Text('Renewable')),
    DropdownMenuItem(value: "Not renewable", child: Text('Not renewable')),
    DropdownMenuItem(value: "Unknown", child: Text('Unknown')),
  ];
//Getting Search Suggestions Function


Future<List<dynamic>> fetchSearchSuggestions(String place , String sessionToken) async {
  emit(GettingSearchSuggestionsLoading());

    try {
      Response response = await DioHelper.getData(url: 'https://maps.googleapis.com/maps/api/place/autocomplete/json',
          query:{
            'input':place,
            'type':'geocode',
            'components':'country:eg',
            'key':'AIzaSyBuLAOh8T3Q1vkckbsqwiAlJVY4S6_dteY',
            'sessiontoken':sessionToken,
          } );


        emit(GettingSearchSuggestionsSuccess());
        // log(response.data.toString());
        return response.data['predictions'];
    }catch (e) {
      log(e.toString());
      emit(GettingSearchSuggestionsFailed(errorMessage: e.toString()));
      return [];
    }







}
  List<SearchSuggestionModel> suggestions= [] ;

  getSearchSuggestions(String place , String sessionToken) async{

  List<SearchSuggestionModel> places=[];
  await  fetchSearchSuggestions(place, sessionToken).then((values) {
      values.forEach((value) => places.add(SearchSuggestionModel.fromJson(value)));
      emit(GettingSearchSuggestionsSuccess());
      suggestions = places;
      log(places.toString());
  }).catchError((error){
    log(error);

  });

}

// get place details function

 Future<dynamic> getPlaceDetails({required String placeId , required String sessionToken}) async {
    emit(GettingSearchSuggestionsLoading());
    try {
      Response response = await DioHelper.getData(url: 'https://maps.googleapis.com/maps/api/place/details/json',
                     query: {
                        'place_id':placeId,
                       'fields':'geometry',
                       'key':'AIzaSyBuLAOh8T3Q1vkckbsqwiAlJVY4S6_dteY',
                       'sessiontoken':sessionToken,
                     });

      emit(GettingPlaceDetailsSuccess());
      // log(response.data.toString());
      return response.data;
    }catch (e) {
      emit(GettingPlaceDetailsFailed(errorMessage: e.toString()));
      return {};
    }

 }


 //get place location
  late double lat;
  late double lng;
  Future<PlaceDetailsModel> getPlaceLocation({required String placeId , required String sessionToken}) async{
    final placeDetails = await getPlaceDetails(placeId: placeId, sessionToken: sessionToken);
    emit(PlaceLocationLoaded());
   lat = PlaceDetailsModel.fromJson(placeDetails).result.geometry.location.lat;
   lng = PlaceDetailsModel.fromJson(placeDetails).result.geometry.location.lng;
    return PlaceDetailsModel.fromJson(placeDetails);
  }




  late CameraPosition goToSearchedForPlace;
  void buildCameraNewPosition( double lat,double lng){
    goToSearchedForPlace = CameraPosition(bearing: 0.0 ,tilt: 0.0,target: LatLng(
      lat,
      lng,
    ),
        zoom: 13);
  }

  Future<void> goToMySearchedForLocation(double lat,double lng ,Completer<GoogleMapController> mapController) async{
    buildCameraNewPosition(lat, lng);
    final GoogleMapController controller = await mapController.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(goToSearchedForPlace));
  }
 late String mainAddress;
 late LatLng locationPosition;
 Position? currentPositionAddStation ;
 late LocationPermission currentPermission ;

  getCurrentPosition() async{

    bool serviceEnabled;
    LocationPermission permission;
   serviceEnabled = await Geolocator.isLocationServiceEnabled();

   permission = await Geolocator.checkPermission();
   currentPermission = permission;


   if(serviceEnabled == false){

   }

   if(permission == LocationPermission.denied || permission == LocationPermission.deniedForever ||  permission == LocationPermission.unableToDetermine ){
     permission = await Geolocator.requestPermission();
     if(permission == LocationPermission.denied){

     }

     if(permission == LocationPermission.whileInUse || permission == LocationPermission.always){
       log('permission whileinuse');
       Position position = await Geolocator.getCurrentPosition();
       log('=====================');
       log(position.latitude.toString());
       log(position.longitude.toString());
       log('=====================');
     }


   }


 }

 Future<Position> getCurrentPositionAddStation()async{
    Position position = await Geolocator.getCurrentPosition();
    log('function worked');
    log(position.latitude.toString());
    log(position.longitude.toString());

    return position;
 }


  Future<void> requestLocationPermission(BuildContext context) async {
    PermissionStatus permissionStatus = await Permission.location.status;

    if (permissionStatus.isDenied) {
      // Permission is denied, request it
      permissionStatus = await Permission.location.request();

      if (permissionStatus.isDenied) {
        // If permission is still denied, show a dialog or message to the user
        showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: Text('Location Permission'),
            content: Text('Location permission is required to proceed.'),
            actions: <Widget>[
              customButton(context: context, title: 'Give permission', onTap: () {
                Navigator.pop(context);
                openAppSettings();
              },
               width: MediaQuery.sizeOf(context).width*0.4, color: ColorManager.primaryColor, color2: ColorManager.primaryColor, textColor: Colors.white, borderColor: Colors.white),
            ],
          ),
        );
      }
    }
  }



  Future<void> requestPhotoPermission(BuildContext context) async {
    PermissionStatus permissionStatus = await Permission.photos.status;

    if (permissionStatus.isDenied || permissionStatus.isRestricted || permissionStatus.isLimited || permissionStatus.isPermanentlyDenied ) {
      // Permission is denied, request it
      permissionStatus = await Permission.photos.request();

      if (permissionStatus.isDenied) {
        // If permission is still denied, show a dialog or message to the user
        showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: Text('Photos Permission'),
            content: Text('Access photos permission is required to proceed.'),
            actions: <Widget>[
              customButton(context: context, title: 'Give permission', onTap: () {
                Navigator.pop(context);
                openAppSettings();
              },
                  width: MediaQuery.sizeOf(context).width*0.4, color: ColorManager.primaryColor, color2: ColorManager.primaryColor, textColor: Colors.white, borderColor: Colors.white),
            ],
          ),
        );
      }
    }
  }

  Future<void> pickImageWithPermission(context) async{
    PermissionStatus permissionStatus = await Permission.storage.request();

    if(permissionStatus.isGranted){
      getProfileImage().then((value) {
        uploadUserImage();
      });
    }else{
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Text('Photos Permission'),
          content: Text('Access photos permission is required to proceed.'),
          actions: <Widget>[
            customButton(context: context, title: 'Give permission', onTap: () {
              Navigator.pop(context);
              openAppSettings();
            },
                width: MediaQuery.sizeOf(context).width*0.4, color: ColorManager.primaryColor, color2: ColorManager.primaryColor, textColor: Colors.white, borderColor: Colors.white),
          ],
        ),
      );
    }



  }

  var stationTypeValue = 'Station Charging Type *';
  var stationStatusValue = 'Station Charging Status *';
  var energySourceValue = 'Energy Source *';

  var connectorTypeValue = 'Connector type *';
  var formatValue = 'Format';
  var typeCurrentValue = 'Type of current';

  var bookingOptionsValue = 'Booking options *';


  int? stationIndex;

  Future<void> addStationToFire({
    String? stationId,
    required String stationName,
    required String stationType,
    required String stationStatus,
    required String energySource,
    required double langitude,
    required double latitude,
    required String location,
    required String address,
    required String number,
    String? where,
    required String connectorType,
    required String power,
    String? intensity,
    String? voltage,
    String? format,
    String? typeCurrent,
    String? howWork,
    required String bookingOptions,
    String? schedule,
    String? limitTime,
    String? chargingSession,
    String? parkingPrice,
    String? proprietary,
    String? email,
    String? phoneNumber,
  }) async {
    emit(AddStationLoadingState());
    StationModel stationModel = StationModel(
        stationName: stationName,
        stationType: stationType,
        stationStatus: stationStatus,
        energySource: energySource,
        langitude: langitude,
        latitude: latitude,
        location: location,
        address: address,
        number: number,
        where: where,
        connectorType: connectorType,
        power: power,
        intensity: intensity,
        voltage: voltage,
        format: format,
        typeCurrent: typeCurrent,
        howWork: howWork,
        bookingOptions: bookingOptions,
        schedule: schedule,
        limitTime: limitTime,
        chargingSession: chargingSession,
        parkingPrice: parkingPrice,
        proprietary: proprietary,
        email: email,
        phoneNumber: phoneNumber,
        stationId: stationId);
var stationRef = getStationsCollection();
var docRef = stationRef.doc();
stationModel.stationId = docRef.id;
    docRef.set(stationModel)
        .then((value) {
      debugPrint('Station Added Successfully');
      CashHelper.saveData(key: 'stationId', value: stationModel.stationId);
      emit(AddStationSuccessState());
    }).catchError((error) {
      debugPrint('Error in addStationToFire is ${error.toString()}');
      emit(AddStationErrorState());
    });
  }

  CollectionReference<StationModel> getStationsCollection() {
    return FirebaseFirestore.instance
        .collection(StationModel.collectionName)
        .withConverter(
      fromFirestore: (snapshot, options) =>
          StationModel.fromJson(snapshot.data()!),
      toFirestore: (value, options) => value.toJson(),
    );
  }
StationModel? stationModel;

  Future<void> updateStationDetails(BuildContext context,
      {
        required String stationId,
        required String chargingSession,
        required String email,
        required String format,
        required String howWork,
        required String intensity,
        required String limitTime,
        required String parkingPrice,
        required String phoneNumber,
        required String proprietary,
        required String schedule,
        required String typeCurrent,
        required String voltage,
        required String connectorType,
        required String power,
        required String bookingOptions
      }){
    emit(UpdateStationDetailsLoadingState());
    return FirebaseFirestore.instance.collection("Stations").doc(stationId).update({
     "chargingSession": chargingSession,
     "email": email,
     "format":  format,
     "howWork": howWork,
     "intensity":  intensity,
     "limitTime": limitTime ,
     "parkingPrice":parkingPrice ,
     "phoneNumber":phoneNumber ,
     "proprietary":proprietary ,
     "schedule": schedule ,
     "typeCurrent": typeCurrent ,
     "voltage": voltage ,
     "connectorType": connectorType ,
     "power": power ,
     "bookingOptions": bookingOptions,
    }).then((value){
      emit(UpdateStationDetailsSuccessState());
    });

  }


  // upload user image
  File? profileImage;

  ImageProvider profile = const NetworkImage(
      'https://img.freepik.com/free-vector/businessman-character-avatar-isolated_24877-60111.jpg?w=740&t=st=1703015640~exp=1703016240~hmac=d32203ed9a0132b11db5f3890f4293174475e278eb0239a283c39443ae15a38b');

  var picker = ImagePicker();

  Future<void> getProfileImage() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      profileImage = File(pickedFile.path);
      profile = FileImage(profileImage!);
      debugPrint('Path is ${pickedFile.path}');
      emit(PickProfileImageSuccessState());
    } else {
      debugPrint('No Image selected.');
      emit(PickProfileImageErrorState());
    }
  }

  String? profilePath;

  Future uploadUserImage() {
    emit(UploadProfileImageLoadingState());
    return  firebase_storage.FirebaseStorage.instance
        .ref()
        .child('usersImage/${Uri.file(profileImage!.path).pathSegments.last}')
        .putFile(profileImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        debugPrint('Upload Success');
        profilePath = value;
        FirebaseFirestore.instance
            .collection('Users')
            .doc(CashHelper.getData(key: 'isUid'))
            .update({'pic': '$profilePath'}).then((value) {
          debugPrint('Image Updates');
        });
        getUser(id: CashHelper.getData(key: 'isUid'));
        emit(UploadProfileImageSuccessState());
      }).catchError((error) {
        debugPrint('Error in Upload profileImage ${error.toString()}');
        emit(UploadProfileImageErrorState());
      });
    }).catchError((error) {
      debugPrint('Error in Upload profileImage ${error.toString()}');
      emit(UploadProfileImageErrorState());
    });
  }

  List<StationModel> stationList = [];

  Future<void> getStationFromFire()  async {
    emit(GetStationLoadingState());
     FirebaseFirestore.instance.collection('Stations').get().then((value) {
      for (var element in value.docs) {
        stationList.add(StationModel.fromJson(element.data()));
      }
      debugPrint('Length of stationList ${stationList.length}');
      debugPrint('Station Get Successfully');
      emit(GetStationSuccessState());
    }).catchError((error) {
      debugPrint('Error in getStationToFire is ${error.toString()}');
      emit(GetStationErrorState());
    });
  }
  Future <void> toLocation({required String locationLink})async
  {
    String url= locationLink;
    await launch(url , forceSafariVC: false);
    emit(LocationLinkLanuchState());
  }

  Database? database;
  List<Map> allFavorite = [];

  void createDatabase() async {
    return await openDatabase('favorite.db', version: 1,
        onCreate: (database, version) {
          database
              .execute(
              'CREATE TABLE favorite (id INTEGER PRIMARY KEY , name TEXT , address TEXT, lat TEXT, long TEXT)')
              .then((value) {
            log('Table Created');
            emit(CreateTableState());
          });
        }, onOpen: (database) {
          getDatabase(database).then((value) {
            allFavorite = value;
          }).catchError((error) {
            log('error i ${error.toString()}');
          });
          log('Database Opened');
        }).then((value) {
      database = value;
      log('Database Created');
      emit(CreateDatabaseSuccessState());
    }).catchError((error) {
      log('error is ${error.toString()}');
      emit(CreateDatabaseErrorState());
    });
  }

  Future insertDatabase({
    required String name,
    required String address,
    required String lat,
    required String long,
    required context,
  }) async {
    return database?.transaction((txn) {
      return txn
          .rawInsert(
          'INSERT INTO favorite (name,address,lat,long) VALUES ( "$name" , "$address" , "$lat" , "$long")')
          .then((value) async{
        log("${value} Insert Success");
        emit(InsertDatabaseSuccessState());
         await getDatabase(database).then((value) {
          allFavorite = value;
        });
        emit(InsertDatabaseSuccessState());
        log("***************** stations inserted successfully");
      }).catchError((error) {
        log('Error is ${error.toString()}');
      });
    });
  }

  Future<List<Map>> getDatabase(database) async {
    allFavorite = [];
    return database?.rawQuery('SELECT * FROM favorite').then((value) {
      value.forEach((element) {
        allFavorite.add(element);
      });

      log(allFavorite.toString());
      emit(GetDatabaseSuccessState());
      log("got stations successfully");
    }).catchError((error) {
      log('GetError is ${error.toString()}');
    });
  }

  Future deleteDatabase({required String id, required context}) async {
    return await database
        ?.rawDelete('DELETE FROM favorite WHERE id = ?', [id]).then((value) {
      debugPrint('Item Deleted');
      getDatabase(database).then((value) {
        allFavorite = value;
      }).catchError((error) {
        log('Error is ${error.toString()}');
      });
      emit(DeleteDatabaseSuccessState());
    });
  }

  Future deleteDatabaseWithName({required String name, required context}) async {
    return await database
        ?.rawDelete('DELETE FROM favorite WHERE name = ?', [name]).then((value) {
      debugPrint('Item Deleted');
      getDatabase(database).then((value) {
        allFavorite = value;
      }).catchError((error) {
        log('Error is ${error.toString()}');
      });
      emit(DeleteDatabaseSuccessState());
    });
  }

  void updateDatabase({
    required String number,
    required String id,
  }) async {
    database?.rawUpdate(
        'UPDATE favorite SET rate = ? WHERE id = ?',
        [number, id]).then((value) {
      log('Update Done');
      getDatabase(database);
      emit(UpdateNoteDatabaseState());
    }).catchError((error) {
      log('error is ${error.toString()}');
    });
  }







  //check if station in database or  not

  Future<bool> isStationInDatabase(String stationName) async{
    List<Map<String,dynamic>>  result = await database!.rawQuery('SELECT * FROM favorite WHERE name = ?', [stationName]);
    log('station check result ${result.toString()}');
    if(result.isNotEmpty){
      return true;
    }else{
      return false;
    }



}

  Color favBtnColor=Colors.grey;

  Future<void>  checkIfStationInDatabase(String stationName)async{
  bool isFound = await isStationInDatabase(stationName);
  if(isFound){
    favBtnColor=Colors.red;
  }else{
    favBtnColor=Colors.grey;
  }
  log('favBtnColor is ${favBtnColor.toString()}');
  }

  pressFavoriteBtn(String name, String address, String lat, String long, BuildContext context){
    if(favBtnColor==Colors.grey){

      insertDatabase(name: name, address:address, lat: lat, long: long, context: context);
    }else{

      deleteDatabaseWithName(name: name, context: context);
    }
  }

  changeFavBtnColor(){
    if(favBtnColor==Colors.grey){
      favBtnColor=Colors.red;
      emit(ColorChanged());
    }else if(favBtnColor==Colors.red){
      favBtnColor=Colors.grey;
      emit(ColorChanged());
    }
  }


}
