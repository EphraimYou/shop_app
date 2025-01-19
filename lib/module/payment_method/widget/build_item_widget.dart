import 'package:flutter/material.dart';
import 'package:shoping_application/shared/network/style/colors.dart';

Widget buildItemWidget({
  required void Function() onTap,
  required Map<String, dynamic> json,
  required bool isSelected,
}) =>
    Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          ListTile(
            trailing: isSelected
                ? Icon(
                    Icons.check_box_outlined,
                    color: Colors.lightBlue,
                  )
                : Icon(
                    Icons.crop_square,
                    color: Color(0xFFF8DBCE),
                  ),
            onTap: onTap,
            tileColor: Colors.white,
            contentPadding: EdgeInsets.all(10),
            shape: BeveledRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            title: Text(
              json['title'],
              style: TextStyle(
                color: primaryColor,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            leading: json['image'] is String
                ? Image(
                    image: AssetImage(json['image']),
                    height: 40,
                    width: 40,
                  )
                : Icon(
                    Icons.account_balance_wallet_outlined,
                    color: primaryColor,
                    size: 30,
                  ),
          ),
        ],
      ),
    );
