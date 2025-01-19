import 'package:flutter/material.dart';
import 'package:shoping_application/shared/components/constants.dart';
import 'package:shoping_application/shared/network/style/colors.dart';

class TransactionWidget extends StatelessWidget {
  const TransactionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      separatorBuilder: (context, index) => SizedBox(height: 20),
      itemCount: transactions.length,
      itemBuilder: (context, index) => buildItem(index),
    );
  }

  Widget buildItem(int index) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              blurRadius: 5,
              color: Color(0X0f000000),
              offset: Offset(0, 0),
            )
          ],
        ),
        child: ListTile(
          // tileColor: Colors.amber,
          title: Row(
            children: [
              Icon(
                Icons.arrow_downward_sharp,
                color: Color(0XFF39d2c0),
              ),
              SizedBox(width: 5),
              Text(
                '${transactions[index]['price']} \$',
                style: TextStyle(
                  color: Color(0XFF39d2c0),
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                ),
              )
            ],
          ),
          subtitle: Text(
            '${transactions[index]['date']} | ${transactions[index]['time']}',
            style: TextStyle(
              color: secondaryColor,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
          leading: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: primaryColor,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.shopping_bag_rounded,
              color: Color(0XFF39d2c0),
            ),
          ),
        ),
      );
}
