import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_electromaps/business_logic/cubit/app_states/app_states.dart';
import 'package:e_electromaps/presentation/screens/account_screen/account_screen.dart';
import 'package:e_electromaps/presentation/screens/favorites_screen/favorites_screen.dart';
import 'package:e_electromaps/presentation/screens/my_charges_screen/my_charges_screen.dart';
import 'package:e_electromaps/presentation/screens/stations_screen/stations_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    DropdownMenuItem(value:"-1" ,child: Text('Station Charging Type *')),
    DropdownMenuItem(value:"1" ,child: Text('Public road')),
    DropdownMenuItem(value:"2" ,child: Text('Parking')),
    DropdownMenuItem(value:"3" ,child: Text('Airport')),
    DropdownMenuItem(value:"4" ,child: Text('Camping')),
    DropdownMenuItem(value:"5" ,child: Text('Hotel')),
    DropdownMenuItem(value:"6" ,child: Text('Private')),
    DropdownMenuItem(value:"7" ,child: Text('Restaurant')),
    DropdownMenuItem(value:"8" ,child: Text('Shop')),
    DropdownMenuItem(value:"9" ,child: Text('Workshop')),
    DropdownMenuItem(value:"10" ,child: Text('Service station')),
    DropdownMenuItem(value:"11" ,child: Text('Car dealer')),
    DropdownMenuItem(value:"12" ,child: Text('Mall')),
    DropdownMenuItem(value:"13" ,child: Text('Private user')),
    DropdownMenuItem(value:"14" ,child: Text('Taxi')),
  ];

  var statusList = const  [
    DropdownMenuItem(value:"-1" ,child: Text('Station Charging Status *')),
    DropdownMenuItem(value:"1" ,child: Text('Working')),
    DropdownMenuItem(value:"2" ,child: Text('Some stations don\'t work')),
    DropdownMenuItem(value:"3" ,child: Text('Not working')),
    DropdownMenuItem(value:"4" ,child: Text('Unknown')),
  ];

  var energySourceList = const  [
    DropdownMenuItem(value:"-1" ,child: Text('Energy Source *')),
    DropdownMenuItem(value:"1" ,child: Text('Renewable')),
    DropdownMenuItem(value:"2" ,child: Text('Not renewable')),
    DropdownMenuItem(value:"4" ,child: Text('Unknown')),
  ];





}