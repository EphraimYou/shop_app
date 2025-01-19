import 'package:flutter/material.dart';
import 'package:shoping_application/layout/cubit/home_cubit.dart';
import 'package:shoping_application/module/product_details/widget/product_description_widget.dart';
import 'package:shoping_application/shared/components/components.dart';
import 'package:shoping_application/shared/network/style/colors.dart';

class BottomNavBarWidget extends StatelessWidget {
  const BottomNavBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.white,
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.grey,
              width: 2,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                SizedBox(height: 3),
                text('Total price'),
                Text(
                  // ignore: unnecessary_cast
                  '${((HomeCubit.get(context).homeModel?.data?.products?[1].price ?? 0) as double) * (HomeCubit.get(context).counter ?? 1)}\$',
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            Spacer(),
            defaultButton(
              onTap: () {},
              title: 'Add To Cart',
              icon: Icons.shopping_bag_rounded,
              width: 160,
              borderRadius: 100,
              height: 45,
            ),
          ],
        ),
      ),
    );
  }
}
