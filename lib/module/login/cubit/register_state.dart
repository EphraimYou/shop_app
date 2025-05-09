part of 'register_cubit.dart';

@immutable

//! immutable => all variable must be final
sealed class RegisterStates {}

final class RegisterInitial extends RegisterStates {}

final class ChangeObscureTextState extends RegisterStates {}

final class ChangeRememberMyState extends RegisterStates {}

/* -------------------------------------------------------------------------- */
final class ShopLoginLoadingState extends RegisterStates {}

final class ShopLoginSuccessState extends RegisterStates {
  final LoginModel loginModel;
  // we send login model as parameter because listen in login Screen
  ShopLoginSuccessState(this.loginModel);
}

final class ShopLoginErrorState extends RegisterStates {
  final String error;

  ShopLoginErrorState({required this.error});
}
/* -------------------------------------------------------------------------- */

final class RegisterLoadingState extends RegisterStates {}

final class RegisterSuccessState extends RegisterStates {
  final LoginModel registerModel;

  RegisterSuccessState({required this.registerModel});
}

final class RegisterErrorState extends RegisterStates {}
