import 'package:flutter/material.dart';
import 'package:shoping_application/layout/cubit/home_cubit.dart';
import 'package:shoping_application/shared/network/style/colors.dart';

Widget productDescriptionWidget({
  required BuildContext context,
  required int index,
}) =>
    Padding(
      padding: const EdgeInsetsDirectional.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            HomeCubit.get(context).homeModel?.data?.products?[index].name ??
                'null',
            style: TextStyle(
              color: primaryColor,
              fontSize: 32,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 5),
          Row(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(5, 3, 5, 3),
                decoration: BoxDecoration(
                    color: backgroundColor,
                    borderRadius: BorderRadius.circular(3)),
                child: Text(
                  '675 sold',
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Icon(
                  Icons.star_border,
                  color: secondaryColor,
                  size: 20,
                ),
              ),
              text('4.5'),
              SizedBox(width: 10),
              text('( 554 review )'),
            ],
          ),
          Divider(),
          SizedBox(height: 10),
          primaryText('Description'),
          SizedBox(height: 5),
          text(HomeCubit.get(context)
                  .homeModel
                  ?.data
                  ?.products?[index]
                  .description ??
              'null'),
        ],
      ),
    );

/* -------------------------------------------------------------------------- */
Widget text(String text) => Text(
      text,
      style: TextStyle(
        color: secondaryColor,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
    );
Widget primaryText(String text) => Text(
      text,
      style: TextStyle(
        color: primaryColor,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
    );
