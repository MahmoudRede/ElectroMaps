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

//Getting Search Suggestions
class GettingSearchSuggestionsLoading extends AppStates{}
class GettingSearchSuggestionsSuccess extends AppStates{}
class GettingSearchSuggestionsFailed extends AppStates{
  final String errorMessage;

  GettingSearchSuggestionsFailed({required this.errorMessage});
}

// getting place details

class GettingPlaceDetailsLoading extends AppStates{}
class GettingPlaceDetailsSuccess extends AppStates{}
class GettingPlaceDetailsFailed extends AppStates{
  final String errorMessage;

  GettingPlaceDetailsFailed({required this.errorMessage});
}

class PlaceLocationLoaded extends AppStates{}