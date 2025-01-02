import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shoping_application/layout/cubit/home_cubit.dart';
import 'package:shoping_application/module/favorite/favorite_screen.dart';
import 'package:shoping_application/module/notification/notification_screen.dart';
import 'package:shoping_application/module/search/search_screen.dart';
import 'package:shoping_application/shared/components/components.dart';
import 'package:shoping_application/shared/components/constants.dart';
import 'package:shoping_application/shared/network/style/colors.dart';

class HomeScereen extends StatelessWidget {
  const HomeScereen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()
        ..getHomeData()
        ..getCategories(),
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          HomeCubit cubit = HomeCubit.get(context);
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.grey[200],
                        backgroundImage:
                            AssetImage('assets/images/user-default.png'),
                        radius: 24,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Welcome',
                              style: TextStyle(
                                color: secondaryColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              'Ephraim youssef',
                              style: TextStyle(
                                color: primaryColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            navigator(
                                context: context, widget: NotificationScreen());
                          },
                          icon: Stack(
                            alignment: Alignment.topRight,
                            children: [
                              Icon(
                                Icons.notifications_none,
                                color: primaryColor,
                                size: 24,
                              ),
                              Container(
                                width: 9,
                                height: 9,
                                decoration: BoxDecoration(
                                    color: Color(0xFFEE8B60),
                                    shape: BoxShape.circle),
                              )
                            ],
                          )),
                      IconButton(
                          onPressed: () {
                            navigator(
                                context: context, widget: FavoriteScreen());
                          },
                          icon: Icon(
                            Icons.favorite_border,
                            size: 24,
                            color: primaryColor,
                          )),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: ListTile(
                      onTap: () {
                        navigator(context: context, widget: SearchScreen());
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      leading: Icon(
                        Icons.search,
                        size: 20,
                        color: secondaryColor,
                      ),
                      tileColor: textForm,
                      title: Text(
                        'Search',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: secondaryColor),
                      ),
                      trailing: Icon(Icons.filter_list),
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        'Special Offers',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: primaryColor),
                      ),
                      Spacer(),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            'See All',
                            style: TextStyle(
                              color: primaryColor,
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                          )),
                    ],
                  ),
                  Container(
                    height: 170,
                    width: double.infinity,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ConditionalBuilder(
                      condition: state is! ShopLoadingHomeDataState,
                      builder: (context) => carousalSliderLocal(
                        list: bannersContent,
                        onPageChanged: (index, reason) => {
                          cubit.changeNavBar(index),
                        },
                        currentIndex: cubit.currentIndex,
                      ),
                      fallback: (context) => Center(
                        child: Image(
                          image: AssetImage('assets/images/loading_image.gif'),
                        ),
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        customProductsIcon(
                            function: () {},
                            icon: Icons.document_scanner_rounded,
                            title: 'See All'),
                        customProductsIcon(
                          function: () {},
                          icon: Icons.local_mall,
                          title: 'Clothes',
                        ),
                        customProductsIcon(
                          function: () {},
                          icon: FontAwesomeIcons.shoePrints,
                          title: 'Shoes',
                        ),
                        customProductsIcon(
                          function: () {},
                          icon: FontAwesomeIcons.utensils,
                          title: 'Kitchen',
                        ),
                        customProductsIcon(
                          function: () {},
                          icon: FontAwesomeIcons.utensils,
                          title: 'Kitchen',
                        ),
                        customProductsIcon(
                          function: () {},
                          icon: FontAwesomeIcons.utensils,
                          title: 'Kitchen',
                        ),
                        customProductsIcon(
                          function: () {},
                          icon: FontAwesomeIcons.utensils,
                          title: 'Kitchen',
                        ),
                      ],
                    ),
                  ),
                  GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 3,
                      mainAxisSpacing: 0,
                      childAspectRatio: 1 / 1.74,
                    ),
                    itemCount: state is ShopLoadingHomeDataState
                        ? 0
                        : cubit.homeModel!.data!.products!.length,
                    itemBuilder: (context, index) => customProduct(
                      cubit.homeModel!.data!.products![index],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
