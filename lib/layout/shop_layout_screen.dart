import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoping_application/layout/cubit/home_cubit.dart';

class ShopLayoutScreen extends StatelessWidget {
  const ShopLayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => HomeCubit(),
        child: BlocConsumer<HomeCubit, HomeStates>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            HomeCubit cubit = HomeCubit.get(context);
            return SafeArea(
              child: Scaffold(
                backgroundColor: Colors.white,
                bottomNavigationBar: BottomNavigationBar(
                  onTap: (index) {
                    cubit.changeNavBar(index);
                  },
                  currentIndex: cubit.currentIndex,
                  items: [
                    BottomNavigationBarItem(
                        icon: Icon(Icons.home), label: 'Home'),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.shopping_cart), label: 'Cart'),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.document_scanner_outlined),
                        label: 'Order'),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.account_balance_wallet_outlined),
                        label: 'Wallet'),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.people_alt_rounded), label: 'Profile'),
                  ],
                ),
                body: cubit.screens.elementAt(cubit.currentIndex),
              ),
            );
          },
        ));
  }
}
