import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoping_application/layout/shop_layout_screen.dart';
import 'package:shoping_application/module/on_boarding/on_boarding_screen.dart';
import 'package:shoping_application/module/product_details/product_details.dart';
import 'package:shoping_application/shared/components/constants.dart';
import 'package:shoping_application/shared/network/local/cache_helper.dart';
import 'package:shoping_application/shared/network/remote/dio/dio_helper.dart';
import 'package:shoping_application/shared/bloc_observer.dart';

import 'shared/network/style/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.inti();
  /* -------------------------------------------------------------------------- */
  await CacheHelper.init();
  bool? onboarding = CacheHelper.getData(key: 'onboarding');
  token = CacheHelper.getData(key: 'token');
  // print(token);
  /* -------------------------------------------------------------------------- */
  Widget widget;
  if (onboarding != null) {
    widget = ShopLayoutScreen();
  } else {
    widget = OnBoardingScreen();
  }
  /* -------------------------------------------------------------------------- */
  runApp(MyApp(widget));
}

class MyApp extends StatelessWidget {
  final Widget startWidget;

  const MyApp(this.startWidget, {super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: lightTheme,
      darkTheme: darkTheme,
      debugShowCheckedModeBanner: false,
      home: ShopLayoutScreen(),
      // home: ProductDetails(),
    );
  }
}
