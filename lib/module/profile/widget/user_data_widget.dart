import 'package:flutter/material.dart';
import 'package:shoping_application/model/login_model.dart';
import 'package:shoping_application/shared/network/style/colors.dart';

// ignore: must_be_immutable
class UserDataWidget extends StatelessWidget {
  LoginModel model;

  UserDataWidget({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  'https://img.freepik.com/premium-vector/pharaoh-head-egyptian-mythology_9645-2809.jpg?w=360'),
              // fit: BoxFit.cover,
            ),
            shape: BoxShape.circle,
            border: Border.all(color: primaryColor, width: .2),
          ),
        ),
        Text(
          model.data?.name ?? 'null',
          style: TextStyle(
              color: primaryColor, fontSize: 24, fontWeight: FontWeight.w500),
        ),
        Text(
          '+20 ${model.data?.phone}',
          style: TextStyle(
              color: secondaryColor, fontSize: 14, fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
