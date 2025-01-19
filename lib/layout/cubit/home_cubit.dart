import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoping_application/model/categories_model.dart';
import 'package:shoping_application/model/change_favorite_model.dart';
import 'package:shoping_application/model/favorite_model.dart';
import 'package:shoping_application/model/home_model.dart';
import 'package:shoping_application/model/login_model.dart';
import 'package:shoping_application/module/cart/cart_screen.dart';
import 'package:shoping_application/module/home/home_screen.dart';
import 'package:shoping_application/module/orders/orders_screen.dart';
import 'package:shoping_application/module/profile/profile_screen.dart';
import 'package:shoping_application/module/wallet/wallet_screen.dart';
import 'package:shoping_application/shared/components/constants.dart';
import 'package:shoping_application/shared/components/toast.dart';
import 'package:shoping_application/shared/network/end_points.dart';
import 'package:shoping_application/shared/network/remote/dio/dio_helper.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitial());
  static HomeCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  String currentValue = '';
  bool isSelected = false;
  int counter = 1;

  int? selectIndex;

  //assign selectIndex;
  void toggleSelection(int index) {
    selectIndex = selectIndex == index ? null : index;
    emit(ChangeToggleSelectionState());
  }

  void incrementCounter() {
    counter++;
    emit(IncrementCounterState());
  }

  void decrementCounter() {
    counter--;
    emit(DecrementCounterState());
  }

  void changeNavBar(int index) {
    currentIndex = index;
    emit(HomeChangeNavBarState());
  }

  void changeCheckBox() {
    isSelected = !isSelected;
    emit(ChangeCheckBoxState());
  }

/* -------------------------------------------------------------------------- */
  void changeDropDown(String value) {
    currentValue = value;
    emit(ChangeDropDownState());
  }

  /* -------------------------------------------------------------------------- */
  List<Widget> screens = [
    HomeScreen(),
    CartScreen(),
    OrdersScreen(),
    WalletScreen(),
    ProfileScreen(),
  ];
/* -------------------------------------------------------------------------- */
/*                           get data for home screen                          */
/* -------------------------------------------------------------------------- */
//* run tow function Parallel, not series
  // Future<void> getTwoFunctions() async {
  //   Future.wait([
  //     getHomeData(),
  //     getCategories(),
  //   ]);
  // }
  Map<int, bool> favorites = {};
  HomeModel? homeModel;

  Future<void> getHomeData() async {
    emit(ShopLoadingHomeDataState());
    DioHelper.getData(
      path: HOME,
      token: token,
    ).then((value) {
      homeModel = HomeModel.fromJson(value.data);

      homeModel?.data?.products?.forEach((element) {
        favorites[element.id as int] = element.inFavorites as bool;
      });
      if (homeModel != null) {
        emit(ShopSuccessHomeDataState());
      }
    }).catchError((error) {
      print('Error when get home data=====> $error');
      emit(ShopErrorHomeDataState());
    });
  }

/* -------------------------------------------------------------------------- */
/*                             get Categories data                            */
/* -------------------------------------------------------------------------- */
  CategoriesModel? categoryModel;
  void getCategories({bool isLoading = true}) async {
    //  if (isLoading) {
    emit(CategoriesLoadingState());
    //  }
    DioHelper.getData(
      path: CATEGORIES,
      token: token,
    ).then((value) {
      categoryModel = CategoriesModel.fromJson(value.data);
      if (categoryModel != null) {
        categoryModel?.data?.data.map((element) {
          log(element.name.toString());
        });
        emit(CategoriesSuccessState());
        debugPrint('length of category  ${categoryModel?.data?.data.length}');
      } else {
        debugPrint('Error: The returned data from the API is null');
      }
    }).catchError((error) {
      debugPrint('category catchError Ephraim ${error.toString()}');
      emit(CategoriesErrorState());
    });
  }

/* -------------------------------------------------------------------------- */
/*                             post favorite model                            */
/* -------------------------------------------------------------------------- */
  ChangeFavoriteModel? changeFavoriteModel;

  void changeFavoriteData(int productId, BuildContext context) {
    //* change at the moment
    favorites[productId] = !(favorites[productId]!);
    emit(ChangeFavoriteState());
    DioHelper.postData(
      path: FAVORITE,
      token: token,
      data: {
        'product_id': productId,
      },
    ).then((value) {
      changeFavoriteModel = ChangeFavoriteModel.fromJson(value.data);
      if (!(changeFavoriteModel?.status ?? false)) {
        favorites[productId] = !favorites[productId]!;
        showMessage(
          message: changeFavoriteModel?.message ?? 'null',
          state: ToastStates.error,
          // ignore: use_build_context_synchronously
          context: context,
        );
      } else if (favorites[productId]!) {
        showMessage(
          message: 'Added successfully',
          state: ToastStates.success,
          // ignore: use_build_context_synchronously
          context: context,
        );
      } else if (!(favorites[productId]!)) {
        showMessage(
          message: 'Deleted successfully',
          state: ToastStates.warning,
          // ignore: use_build_context_synchronously
          context: context,
        );
      }
      getFavoriteData();
      emit(FavoriteSuccessState());
    }).catchError((error) {
      favorites[productId] = !favorites[productId]!;
      emit(FavoriteErrorState());
    });
  }

  /* -------------------------------------------------------------------------- */
  /*                                get favorite                                */
  /* -------------------------------------------------------------------------- */
  FavoriteModel? favoriteModel;
  void getFavoriteData() {
    emit(GetFavoriteLoadingState());
    DioHelper.getData(
      path: FAVORITE,
      token: token,
    ).then((value) {
      favoriteModel = FavoriteModel.fromJson(value.data);
      if (favoriteModel != null) {
        emit(GetFavoriteSuccessState());
      }
    }).catchError((error) {
      emit(GetFavoriteErrorState());
    });
  }

  /* -------------------------------------------------------------------------- */
  /*                                get profile                                */
  /* -------------------------------------------------------------------------- */
  LoginModel? profile;
  void getProfile() {
    emit(UserDataLoadingState());
    DioHelper.getData(
      path: PROFILE,
      token: token,
    ).then((value) {
      profile = LoginModel.fromJson(value.data);
      if (profile != null) {
        emit(UserDataSuccessState());
      }
    }).catchError((error) {
      emit(UserDataErrorState());
    });
  }

  /* -------------------------------------------------------------------------- */
  /*                              update user data                              */
  /* -------------------------------------------------------------------------- */
  void updateProfile({
    required String name,
    required String email,
    required String phone,
  }) {
    emit(UpdateUserLoadingState());
    DioHelper.putData(
      path: UPDATE_PROFILE,
      token: token,
      data: {
        'name': name,
        'phone': phone,
        'email': email,
      },
    ).then((value) {
      profile = LoginModel.fromJson(value.data);
      emit(UpdateUserSuccessState());
    }).catchError((error) {
      emit(UserDataErrorState());
    });
  }

  /* -------------------------------------------------------------------------- */
  /*                              get address information                              */
  /* -------------------------------------------------------------------------- */

  /* ----------------------------------- end ---------------------------------- */
}
