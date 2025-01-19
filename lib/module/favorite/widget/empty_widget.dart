import 'package:flutter/material.dart';
import 'package:shoping_application/shared/components/components.dart';
import 'package:shoping_application/shared/network/style/colors.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: backIconButton(context: context),
        titleSpacing: 0,
        title: Text(
          'My Wishlist',
          style: TextStyle(
            color: primaryColor,
            fontWeight: FontWeight.w400,
            fontSize: 16,
          ),
        ),
      ),
      body: Center(
        child: Text(
          'Your wishlist is empty',
          style: TextStyle(
            color: primaryColor,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
