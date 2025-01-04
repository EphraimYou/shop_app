import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoping_application/layout/cubit/home_cubit.dart';
import 'package:shoping_application/model/home_model.dart';
import 'package:shoping_application/shared/components/components.dart';

class BuildCategoriesWidget extends StatelessWidget {
  final HomeModel? homeModel;
  const BuildCategoriesWidget({
    super.key, this.homeModel,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 3,
        mainAxisSpacing: 0,
        childAspectRatio: 1 / 1.74,
      ),
      itemCount: homeModel?.data?.products?.length ?? 0,
      itemBuilder: (context, index) => customProduct(
        homeModel!.data!.products![index],
      ),
    );
  }
}
