import 'package:flutter/material.dart';
import 'package:shoping_application/shared/components/components.dart';
import 'package:shoping_application/shared/components/constants.dart';

class BuildCategoryWidget extends StatelessWidget {
  //final CategoriesModel? categoryModel;
  const BuildCategoryWidget({
    super.key,
    //this.categoryModel,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 125,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) =>
            customProductsIcon(category: categoriesIcon[index]),
        separatorBuilder: (context, index) => SizedBox(width: 10),
        itemCount: categoriesIcon.length,
      ),
    );
  }
}
