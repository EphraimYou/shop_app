import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoping_application/layout/cubit/home_cubit.dart';
import 'package:shoping_application/module/product_details/widget/bottom_nav_bar_widget.dart';
import 'package:shoping_application/module/product_details/widget/carousal_slider.dart';
import 'package:shoping_application/module/product_details/widget/color_quantity_Widget.dart';
import 'package:shoping_application/module/product_details/widget/product_description_widget.dart';

class ProductDetails extends StatelessWidget {
  final int index;
  const ProductDetails({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => HomeCubit()..getHomeData(),
        child: BlocConsumer<HomeCubit, HomeStates>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            HomeCubit cubit = HomeCubit.get(context);
            return Scaffold(
              backgroundColor: Colors.white,
              bottomNavigationBar: BottomNavBarWidget(
                index: index,
              ),
              body: ConditionalBuilder(
                condition: cubit.homeModel != null,
                builder: (context) => SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 350,
                        child: CarousalSlider(
                          productIndex: index,
                          currentIndex: cubit.currentIndex,
                          onPageChanged: (index, reason) {
                            cubit.changeNavBar(index);
                          },
                        ),
                      ),
                      productDescriptionWidget(context: context, index: index),
                      ColorQuantityWidget(),
                      // Divider(),
                      // BottomWidget(),
                    ],
                  ),
                ),
                fallback: (context) =>
                    Center(child: CircularProgressIndicator()),
              ),
            );
          },
        ),
      ),
    );
  }
}
