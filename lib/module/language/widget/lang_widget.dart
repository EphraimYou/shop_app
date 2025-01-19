import 'package:flutter/material.dart';
import 'package:shoping_application/shared/network/style/colors.dart';

// ignore: must_be_immutable
class LangWidget extends StatelessWidget {
  final bool isSelected;
  final int index;
  final void Function() function;
  LangWidget(
      {super.key,
      required this.function,
      required this.isSelected,
      required this.index});

  List<String> titles = [
    'English (US)',
    'Spanish (ES)',
    'French (RF)',
    'Arabic (AR)',
  ];
  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: isSelected
          ? Icon(
              Icons.check_box_outlined,
              color: Colors.lightBlue,
            )
          : Icon(
              Icons.crop_square,
              color: Color(0xFFF8DBCE),
            ),
      onTap: function,
      tileColor: backgroundColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      title: Text(
        titles[index],
        style: TextStyle(
            color: primaryColor, fontSize: 20, fontWeight: FontWeight.w600),
      ),
    );
  }
}
