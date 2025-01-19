import 'package:flutter/material.dart';
import 'package:shoping_application/shared/network/style/colors.dart';

Widget buildWidget({
  required void Function() onTap,
  required List<String> json,
  required int index,
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
                json.elementAt(index),
                style: TextStyle(
                  color: primaryColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              leading: Image(
                image: AssetImage('assets/images/Capture.PNG'),
                fit: BoxFit.cover,
                height: 60,
                width: 60,
              )),
        ],
      ),
    );
