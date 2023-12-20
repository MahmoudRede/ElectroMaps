import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_electromaps/business_logic/cubit/app_states/app_states.dart';
import 'package:e_electromaps/data/model/station_model/station_model.dart';
import 'package:e_electromaps/presentation/screens/account_screen/account_screen.dart';
import 'package:e_electromaps/presentation/screens/favorites_screen/favorites_screen.dart';
import 'package:e_electromaps/presentation/screens/my_charges_screen/my_charges_screen.dart';
import 'package:e_electromaps/presentation/screens/stations_screen/stations_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../constants/firebase_errors.dart';
import '../../../core/local/cash_helper.dart';
import '../../../data/model/user_model/user_model.dart';
import '../../../presentation/widgets/custom_toast.dart';
import '../../../styles/colors/color_manager.dart';

class AppCubit extends Cubit<AppStates>{

  AppCubit() : super(InitialState());

  static AppCubit get(context) => BlocProvider.of<AppCubit>(context);

  int currentIndex=0;

  void changeBottomNavBar(int index){
    currentIndex = index;
    emit(ChangeBottomNavBarState());
  }


  List<Widget> screensLayout=[
    const StationsScreen(),
    const FavoritesScreen(),
    const MyChargesScreen(),
    const AccountScreen(),
  ];

  List<String> titlesLayout=[
    'Stations Screen',
    'Favorite charging points',
    'My charges',
    'AccountScreen',
  ];

  List<String> accountTitles=[
    'Account details',
    'About us',
    'Help & Support',
    'Terms of use',
  ];


  List<IconData> accountTitlesIcon=[
    Icons.account_circle,
    Icons.info,
    Icons.help,
    Icons.privacy_tip,
  ];

  void createAccountWithFirebaseAuth({required String email,
    required String password,
    required String name,
    required String phone,
    required BuildContext context}) async {
    try {
      emit(SignUpLoadingState());
      final credential =
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      UserModel user = UserModel(
        uId: credential.user?.uid ?? "",
        userName: name,
        email: email,
        phoneNumber: phone,
      );
      await addUserToFireStore(user).then((value) {
        getUser(id: (credential.user?.uid)!);
        CashHelper.saveData(key: 'isUid', value: credential.user?.uid);
        customToast(
          title: 'Account Created Successfully',
          color: ColorManager.primaryColor,
        );
        emit(SignUpSuccessState());
        debugPrint("--------------Account Created");
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == FirebaseErrors.weakPassword) {} else
      if (CashHelper.getData(key: 'isUid') != null) {
        customToast(
          title:
              'This account already exists',
          color: ColorManager.red,
        );
        emit(SignUpErrorState(e.toString()));
        debugPrint("--------------Failed To Create Account");
      }
    }
  }

  Future<void> loginWithFirebaseAuth(
      {required String email, required String password}) async {
    try {
      emit(LoginLoadingState());
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      await getUser(id: (credential.user?.uid)!);
      UserModel? user = await readUserFromFireStore(credential.user?.uid ?? "");
      if (user != null){
        CashHelper.saveData(key: 'isUid', value: credential.user?.uid);
        await getUser(id: (credential.user?.uid)!);
        emit(LoginSuccessState());
        debugPrint(CashHelper.getData(key: 'isUid'));
        debugPrint("-----------Login Successfully");
      }
      else {
        return customToast(
            title: '''Invalid email or password''',
            color: Colors.red.shade700);
      }
    } on FirebaseAuthException catch (e) {
      emit(LoginErrorState(e.toString()));
      debugPrint("-----------Login Failed");

      customToast(title: 'Invalid email or password', color: ColorManager.red);
    } catch (e) {
      customToast(title: 'Something went wrong $e', color: ColorManager.red);
    }
  }

  Future<void> saveUser({
    required String name,
    required String email,
    required String phoneNumber,
    required String id,
  }) async {
    emit(SaveUserLoadingState());

    UserModel userModel = UserModel(
      userName: name,
      phoneNumber: phoneNumber,
      email: email,
      uId: id,
    );

    FirebaseFirestore.instance
        .collection('Users')
        .doc(userModel.uId)
        .set(userModel.toJson())
        .then((value) {
      debugPrint('Save User Success');
      emit(SaveUserSuccessState());
    }).catchError((error) {
      debugPrint('Error in userRegister is ${error.toString()}');
      emit(SaveUserErrorState(error.toString()));
    });
  }

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

// User Reference

  CollectionReference<UserModel> getUsersCollection() {
    return FirebaseFirestore.instance
        .collection(UserModel.collectionName)
        .withConverter(
      fromFirestore: (snapshot, options) =>
          UserModel.fromJson(snapshot.data()!),
      toFirestore: (value, options) => value.toJson(),
    );
  }

  Future<void> addUserToFireStore(UserModel userModel) {
    return getUsersCollection().doc(userModel.uId).set(userModel);
  }

  Future<UserModel?> readUserFromFireStore(String id) async {
    DocumentSnapshot<UserModel> user = await getUsersCollection().doc(id).get();
    var myUser = user.data();
    return myUser;
  }

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
      customToast(title: "تم حذف حسابك بنجاح", color: Colors.red.shade700);

      debugPrint('Account Deleted Successfully');

      emit(DeleteUserSuccessState());
    }).catchError((error) {
      debugPrint('Error in DeleteUser is ${error.toString()}');
      emit(DeleteUserErrorState());
    });
  }



  ///// New Charging Staions DropDown Lists /////


  var typeList = const  [
    DropdownMenuItem(value:"Station Charging Type *" ,child: Text('Station Charging Type *')),
    DropdownMenuItem(value:"Public road" ,child: Text('Public road')),
    DropdownMenuItem(value:"Parking" ,child: Text('Parking')),
    DropdownMenuItem(value:"Airport" ,child: Text('Airport')),
    DropdownMenuItem(value:"Camping" ,child: Text('Camping')),
    DropdownMenuItem(value:"Hotel" ,child: Text('Hotel')),
    DropdownMenuItem(value:"Private" ,child: Text('Private')),
    DropdownMenuItem(value:"Restaurant" ,child: Text('Restaurant')),
    DropdownMenuItem(value:"Shop" ,child: Text('Shop')),
    DropdownMenuItem(value:"Workshop" ,child: Text('Workshop')),
    DropdownMenuItem(value:"Service station" ,child: Text('Service station')),
    DropdownMenuItem(value:"Car dealer" ,child: Text('Car dealer')),
    DropdownMenuItem(value:"Mall" ,child: Text('Mall')),
    DropdownMenuItem(value:"Private user" ,child: Text('Private user')),
    DropdownMenuItem(value:"Taxi" ,child: Text('Taxi')),
  ];

  var statusList = const  [
    DropdownMenuItem(value:"Station Charging Status *" ,child: Text('Station Charging Status *')),
    DropdownMenuItem(value:"Working" ,child: Text('Working')),
    DropdownMenuItem(value:"Some stations don\'t work" ,child: Text('Some stations don\'t work')),
    DropdownMenuItem(value:"Not working" ,child: Text('Not working')),
    DropdownMenuItem(value:"Unknown" ,child: Text('Unknown')),
  ];

  var energySourceList = const  [
    DropdownMenuItem(value:"Energy Source *" ,child: Text('Energy Source *')),
    DropdownMenuItem(value:"Renewable" ,child: Text('Renewable')),
    DropdownMenuItem(value:"Not renewable" ,child: Text('Not renewable')),
    DropdownMenuItem(value:"Unknown" ,child: Text('Unknown')),
  ];


  var stationTypeValue='Station Charging Type *';
  var stationStatusValue='Station Charging Status *';
  var energySourceValue='Energy Source *';

  var connectorTypeValue='Connector type *';
  var formatValue='Format';
  var typeCurrentValue='Type of current';

  var bookingOptionsValue ='Booking options *';


  Future<void> addStationToFire(
      {
        required String stationName,
        required String stationType,
        required String stationStatus,
        required String energySource,
        required String langitude,
        required String latitude,
        required String location,
        required String address,
        required String number,
        String ?where,
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
      }
      )async{

    emit(AddStationLoadingState());
    StationModel stationModel=StationModel(
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
        phoneNumber: phoneNumber
    );

    FirebaseFirestore.instance
        .collection('Stations')
        .add(stationModel.toJson())
        .then((value) {

      debugPrint('Station Added Successfully');
      emit(AddStationSuccessState());

  }).catchError((error){
      debugPrint('Error in addStationToFire is ${error.toString()}');
      emit(AddStationErrorState());
    });

}


  List<StationModel> stationList=[];
  Future<void> getStationFromFire()async{

    emit(GetStationLoadingState());

    FirebaseFirestore.instance
        .collection('Stations')
        .get()
        .then((value) {

          for (var element in value.docs) {
            stationList.add(StationModel.fromJson(element.data()));
          }

          debugPrint('Length of stationList ${stationList.length}');

          debugPrint('Station Get Successfully');
          emit(GetStationSuccessState());

    }).catchError((error){
      debugPrint('Error in getStationToFire is ${error.toString()}');
      emit(GetStationErrorState());
    });

  }


}