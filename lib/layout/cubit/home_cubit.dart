import 'package:flutter/foundation.dart';
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
    HomeScereen(),
    CartScreen(),
    OrdersScreen(),
    WalletScrenn(),
    ProfileScreen(),
  ];
/* -------------------------------------------------------------------------- */
/*                           get data for home screen                          */
/* -------------------------------------------------------------------------- */
  HomeModel? homeModel;
  void getHomeData() {
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
  void getCategories() {
    emit(CategoriesLoadingDataState());
    DioHelper.getData(
      path: CATEGORIES,
      token: token,
    ).then((value) {
      categoryModel = CategoriesModel.fromJson(value.data);
      if (categoryModel != null) {
        print(categoryModel!.data!.data[0].name);
        emit(CategoriesSuccessDataState());
        print('length of category  ${categoryModel!.data!.data.length}');
      } else {
        print('Error: The returned data from the API is null');
      }
    }).catchError((error) {
      print('category catchError Ephraim ${error.toString()}');
      emit(CategoriesErrorDataState());
    });
  }
}
