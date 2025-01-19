import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shoping_application/layout/cubit/home_cubit.dart';
import 'package:shoping_application/module/product_details/widget/product_description_widget.dart';
import 'package:shoping_application/shared/network/style/colors.dart';

// ignore: must_be_immutable
class ColorQuantityWidget extends StatelessWidget {
  ColorQuantityWidget({super.key});

  List<Color> colors = [
    Colors.deepOrange,
    Color(0XFFB62221),
    Color(0XFF418C3F),
    Colors.black,
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          primaryText('Color'),
          SizedBox(
            height: 50,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                bool isSelected = HomeCubit.get(context).selectIndex == index;
                return color(
                  function: () {
                    print(HomeCubit.get(context).selectIndex);
                    HomeCubit.get(context).toggleSelection(index);
                  },
                  color: colors[index],
                  isSelected: isSelected,
                );
              },
              separatorBuilder: (context, index) => SizedBox(width: 10),
              itemCount: colors.length,
            ),
          ),
          quantity(context),
        ],
      ),
    );
  }

/* ------------------------------ color widget ------------------------------ */
  Widget color({
    required Color color,
    required bool isSelected,
    required VoidCallback function,
  }) =>
      GestureDetector(
        onTap: function,
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: primaryColor, width: 1),
              shape: BoxShape.circle),
          padding: EdgeInsets.all(3),
          child: Stack(
            alignment: Alignment.center,
            children: [
              CircleAvatar(radius: 13, backgroundColor: color),
              if (isSelected)
                Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 15,
                ),
            ],
          ),
        ),
      );
/* ----------------------------- quantity widget ---------------------------- */

  Widget quantity(BuildContext context) => Row(
        children: [
          primaryText('Quantity'),
          Spacer(),
          Container(
            height: 50,
            width: 130,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () => HomeCubit.get(context).counter <= 1
                      ? null
                      : HomeCubit.get(context).decrementCounter(),
                  disabledColor: secondaryColor,
                  icon: Icon(
                    FontAwesomeIcons.minus,
                    color: primaryColor,
                    size: 20,
                  ),
                ),
                Text(
                  '${HomeCubit.get(context).counter}',
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                IconButton(
                  onPressed: () => HomeCubit.get(context).incrementCounter(),
                  disabledColor: secondaryColor,
                  icon: Icon(
                    Icons.add,
                    color: primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      );
/* -------------------------------------------------------------------------- */
}
