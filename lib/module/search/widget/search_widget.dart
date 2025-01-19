import 'package:flutter/material.dart';
import 'package:shoping_application/shared/network/style/colors.dart';

Widget searchWidget({
  required TextEditingController controller,
  required onChange,
  required bool showSuffixIcon,
}) {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: TextFormField(
      style: TextStyle(
        color: primaryColor,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      autofocus: true,
      controller: controller,
      onChanged: onChange,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.search),
        suffixIcon: showSuffixIcon
            ? IconButton(
                onPressed: () {
                  controller.text = '';
                },
                icon: Icon(
                  Icons.close,
                  color: primaryColor,
                ),
              )
            : null,
        fillColor: textForm,
        filled: true,
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: error, width: .5),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: primaryColor,
            width: .5,
          ),
        ),
      ),
    ),
  );
}
