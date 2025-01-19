import 'package:flutter/material.dart';
import 'package:shoping_application/model/categories_model.dart';
import 'package:shoping_application/shared/network/style/colors.dart';

class BuildCategoryItemWidget extends StatelessWidget {
  final CategoriesModel categoriesModel;
  final VoidCallback? function;
  const BuildCategoryItemWidget({
    super.key,
    this.function,
    required this.categoriesModel,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: categoriesModel.data?.data.length ?? 0,
        separatorBuilder: (context, index) => SizedBox(
          height: 10,
        ),
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: ListTile(
            onTap: function,
            // splashColor: Colors.white,
            tileColor: textForm,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)),
            title: Text(
              categoriesModel.data?.data[index].name ?? 'null',
              style: TextStyle(
                color: primaryColor,
                fontWeight: FontWeight.w700,
                fontSize: 22,
              ),
            ),
            contentPadding: EdgeInsets.all(7),
            trailing: Icon(Icons.arrow_forward_ios),
            leading: Container(
              width: 65,
              height: 65,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(
                    categoriesModel.data?.data[index].image ?? 'null',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
