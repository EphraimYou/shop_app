import 'package:flutter/material.dart';
import 'package:shoping_application/model/search_model.dart';
import 'package:shoping_application/shared/network/style/colors.dart';

// ignore: must_be_immutable
class ProductWidget extends StatelessWidget {
  SearchModel model;
  ProductWidget({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 10),
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: model.data?.total,
        itemBuilder: (context, index) => Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 145,
              width: 110,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: NetworkImage(model.data?.data[index].image ??
                        'https://www.mountaingoatsoftware.com/uploads/blog/2016-09-06-what-is-a-product-quote.png'),
                    // fit: BoxFit.cover,
                  )),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      model.data?.data[index].name ?? 'null',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: primaryColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      model.data?.data[index].description ?? 'null',
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: secondaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          '${model.data?.data[index].price}\$',
                          style: TextStyle(
                            color: primaryColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Spacer(),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              model.data!.data[index].inFavorites!
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: primaryColor,
                            ))
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
