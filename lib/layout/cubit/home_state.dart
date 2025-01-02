part of 'home_cubit.dart';

@immutable
sealed class HomeStates {}

final class HomeInitial extends HomeStates {}

final class HomeChangeNavBarState extends HomeStates {}

/* -------------------------------------------------------------------------- */
final class ShopLoadingHomeDataState extends HomeStates {}

final class ShopSuccessHomeDataState extends HomeStates {}

final class ShopErrorHomeDataState extends HomeStates {}

/* -------------------------------------------------------------------------- */
/*                               Category states                              */
/* -------------------------------------------------------------------------- */
final class CategoriesLoadingDataState extends HomeStates {}

final class CategoriesSuccessDataState extends HomeStates {}

final class CategoriesErrorDataState extends HomeStates {}
