import 'package:flutter/material.dart';
import 'package:shoping_application/layout/cubit/home_cubit.dart';
import 'package:shoping_application/model/favorite_model.dart';
import 'package:shoping_application/shared/network/style/colors.dart';

class FavoriteItemWidget extends StatelessWidget {
  final FavoriteModel model;
  final int index;

  const FavoriteItemWidget({
    super.key,
    required this.model,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                Container(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Image(
                    image: NetworkImage(model
                            .data?.data[index].product?.image ??
                        'https://t3.ftcdn.net/jpg/06/16/17/80/240_F_616178017_7vQYivYyYvKmzUxBOiG4mJ5nUNyjGyD4.jpg'),
                    width: double.infinity,
                    height: 180,
                    // fit: BoxFit.cover,
                  ),
                ),
                if (model.data?.data[index].product?.discount != 0)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image(
                      image: AssetImage('assets/images/discount.png'),
                      width: 40,
                      height: 40,
                      fit: BoxFit.cover,
                    ),
                  ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Text(
                model.data?.data[index].product?.name.toString() ?? 'null',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: primaryColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3.0),
              child: Row(
                children: [
                  Text(
                    '\$ ${model.data?.data[index].product?.price?.round()} ',
                    style: TextStyle(
                      color: primaryColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 14.5,
                    ),
                  ),
                  if (model.data?.data[index].product?.discount != 0)
                    Expanded(
                      child: Text(
                        '\$${model.data?.data[index].product?.oldPrice?.round() ?? 0}',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                          color: secondaryColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  Spacer(),
                  IconButton(
                    padding: EdgeInsets.all(0),
                    onPressed: () {
                      print('id ====>  ${model.data?.data[index].product?.id}');
                      // HomeCubit.get(context).change
                      //model.data?.data[index].product?.id as int, context);
                    },
                    //! Error when click to remove item from favorite
                    //! return null
                    icon: HomeCubit.get(context).favorites[
                                model.data?.data[index].product?.id] ??
                            true
                        ? Icon(Icons.favorite)
                        : Icon(Icons.favorite_border),
                    color: primaryColor,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
