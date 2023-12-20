abstract class AppStates{}

class InitialState extends AppStates{}

class ChangeBottomNavBarState extends AppStates{}
// Sign Up States

class SignUpLoadingState extends AppStates {}

class SignUpSuccessState extends AppStates {}

class SignUpErrorState extends AppStates {
  SignUpErrorState(String error);
}

//Login States

class LoginLoadingState extends AppStates {}

class LoginSuccessState extends AppStates {}

class LoginErrorState extends AppStates {
  LoginErrorState(String error);
}


//Forget Password States

class ForgetPasswordLoadingState extends AppStates {}
class ForgetPasswordSuccessState extends AppStates {}
class ForgetPasswordErrorState extends AppStates {}

//Save user
class SaveUserLoadingState extends AppStates{}
class SaveUserSuccessState extends AppStates{}
class SaveUserErrorState extends AppStates{
  SaveUserErrorState(String error);
}

//Get User
class GetUserLoadingState extends AppStates{}
class GetUserSuccessState extends AppStates{}
class GetUserErrorState extends AppStates{}

//Delete User

class DeleteUserLoadingState extends AppStates{}
class DeleteUserSuccessState extends AppStates{}
class DeleteUserErrorState extends AppStates{}

class SaveValueState extends AppStates{}

class AddStationLoadingState extends AppStates{}
class AddStationSuccessState extends AppStates{}
class AddStationErrorState extends AppStates{}

class GetStationLoadingState extends AppStates{}
class GetStationSuccessState extends AppStates{}
class GetStationErrorState extends AppStates{}
//Pick Profile Image
class PickProfileImageSuccessState extends AppStates {}
class PickProfileImageErrorState extends AppStates {}

//Upload Profile Image
class UploadProfileImageLoadingState extends AppStates {}
class UploadProfileImageSuccessState extends AppStates {}
class UploadProfileImageErrorState extends AppStates {}
