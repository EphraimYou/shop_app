import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoping_application/layout/cubit/home_cubit.dart';
import 'package:shoping_application/module/favorite/widget/empty_widget.dart';
import 'package:shoping_application/module/favorite/widget/favorite_item_widget.dart';
import 'package:shoping_application/shared/components/components.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getFavoriteData(),
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          HomeCubit cubit = HomeCubit.get(context);

          return Scaffold(
            backgroundColor: Colors.white,
            appBar: appBar(context: context, title: 'My Wishlist'),
            body: ConditionalBuilder(
              condition: cubit.favoriteModel?.data?.total == 0,
              builder: (context) => EmptyWidget(),
              fallback: (context) => ConditionalBuilder(
                condition: cubit.favoriteModel != null,
                builder: (context) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Expanded(
                        child: GridView.builder(
                          scrollDirection: Axis.vertical,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 3,
                            mainAxisSpacing: 0,
                            childAspectRatio: 1 / 1.74,
                          ),
                          itemCount: cubit.favoriteModel?.data?.total ?? 0,
                          itemBuilder: (context, index) => FavoriteItemWidget(
                            model: cubit.favoriteModel!,
                            index: index,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                fallback: (context) => Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
