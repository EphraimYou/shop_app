part of 'home_cubit.dart';

@immutable
sealed class HomeStates {}

final class HomeInitial extends HomeStates {}

final class HomeChangeNavBarState extends HomeStates {}

final class IncrementCounterState extends HomeStates {}

final class DecrementCounterState extends HomeStates {}

final class ChangeDropDownState extends HomeStates {}

final class ChangeCheckBoxState extends HomeStates {}

final class ChangeToggleSelectionState extends HomeStates {}

/* -------------------------------------------------------------------------- */
final class ShopLoadingHomeDataState extends HomeStates {}

final class ShopSuccessHomeDataState extends HomeStates {}

final class ShopErrorHomeDataState extends HomeStates {}

/* -------------------------------------------------------------------------- */
/*                                  user data                                 */
/* -------------------------------------------------------------------------- */
final class UserDataLoadingState extends HomeStates {}

final class UserDataSuccessState extends HomeStates {}

final class UserDataErrorState extends HomeStates {}

/* -------------------------------------------------------------------------- */
/*                               Category states                              */
/* -------------------------------------------------------------------------- */
final class CategoriesLoadingState extends HomeStates {}

final class CategoriesSuccessState extends HomeStates {}

final class CategoriesErrorState extends HomeStates {}

/* -------------------------------------------------------------------------- */
/*                              CHANGE favorite data                               */
/* -------------------------------------------------------------------------- */
final class ChangeFavoriteState extends HomeStates {}

final class FavoriteSuccessState extends HomeStates {}

final class FavoriteErrorState extends HomeStates {}

/* -------------------------------------------------------------------------- */
/*                              GET favorite data                             */
/* -------------------------------------------------------------------------- */
final class GetFavoriteLoadingState extends HomeStates {}

final class GetFavoriteSuccessState extends HomeStates {}

final class GetFavoriteErrorState extends HomeStates {}

/* -------------------------------------------------------------------------- */
/*                              UPDATE favorite data                             */
/* -------------------------------------------------------------------------- */
final class UpdateUserLoadingState extends HomeStates {}

final class UpdateUserSuccessState extends HomeStates {}

final class UpdateUserErrorState extends HomeStates {}
