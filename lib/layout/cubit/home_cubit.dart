import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoping_application/model/categories_model.dart';
import 'package:shoping_application/model/home_model.dart';
import 'package:shoping_application/module/cart/cart_screen.dart';
import 'package:shoping_application/module/home/home_scereen.dart';
import 'package:shoping_application/module/orders/orders_screen.dart';
import 'package:shoping_application/module/plofile/profile_screen.dart';
import 'package:shoping_application/module/wallet/wallet_screnn.dart';
import 'package:shoping_application/shared/components/constants.dart';
import 'package:shoping_application/shared/network/end_points.dart';
import 'package:shoping_application/shared/network/remote/dio/dio_helper.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitial());
  static HomeCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  void changeNavBar(int index) {
    currentIndex = index;
    emit(HomeChangeNavBarState());
  }

  /* -------------------------------------------------------------------------- */
  List<Widget> screens = [
    HomeScreen(),
    CartScreen(),
    OrdersScreen(),
    WalletScrenn(),
    ProfileScreen(),
  ];
/* -------------------------------------------------------------------------- */
/*                           get data for home screen                          */
/* -------------------------------------------------------------------------- */

  Future<void> getTwoFunctions() async {
    Future.wait([
      getHomeData(),
      getCategories(),
    ]);
  }

  HomeModel? homeModel;
  Future<void> getHomeData() async {
    emit(ShopLoadingHomeDataState());
    DioHelper.getData(
      path: HOME,
      token: token,
    ).then((value) {
      homeModel = HomeModel.fromJson(value.data);
      // print(homeModel!.data!.products![0].image);
      // print(homeModel!.status);
      if (homeModel != null) {
        emit(ShopSuccessHomeDataState());
      }
    }).catchError((error) {
      print(error.toString());
      emit(ShopErrorHomeDataState());
    });
  }

/* -------------------------------------------------------------------------- */
/*                             get Categories data                            */
/* -------------------------------------------------------------------------- */
  CategoriesModel? categoryModel;
  Future<void> getCategories({bool isLoading = true}) async {
    if (isLoading) {
      emit(CategoriesLoadingDataState());
    }
    DioHelper.getData(
      path: CATEGORIES,
      token: token,
    ).then((value) {
      categoryModel = CategoriesModel.fromJson(value.data);
      if (categoryModel != null) {
        log('Category: ${categoryModel?.data}');
        emit(CategoriesSuccessDataState());
        debugPrint('length of category  ${categoryModel?.data?.data.length}');
      } else {
        debugPrint('Error: The returned data from the API is null');
      }
    }).catchError((error) {
      debugPrint('category catchError Ephraim ${error.toString()}');
      emit(CategoriesErrorDataState());
    });
  }
}
