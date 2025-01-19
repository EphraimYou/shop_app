import 'package:flutter/material.dart';
import 'package:shoping_application/module/shopping_method/widget/build_widgt.dart';
import 'package:shoping_application/shared/components/components.dart';
import 'package:shoping_application/shared/network/style/colors.dart';

// ignore: must_be_immutable
class ShoppingMethodScreen extends StatefulWidget {
  ShoppingMethodScreen({super.key});

  @override
  State<ShoppingMethodScreen> createState() => _ShoppingMethodScreenState();
}

class _ShoppingMethodScreenState extends State<ShoppingMethodScreen> {
  int? currentIndex;

  List<String> titles = [
    'Local Post',
    'Country Post',
    'International',
  ];

  void toggleSelection(int index) {
    setState(() {
      currentIndex = currentIndex == index ? null : index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: appBar(
          context: context,
          title: 'Shopping Methods',
          backgroundColor: backgroundColor),
      body: ListView.builder(
        itemCount: titles.length,
        itemBuilder: (context, index) {
          bool isSelected = currentIndex == index;
          return buildWidget(
            onTap: () => toggleSelection(index),
            json: titles,
            index: index,
            isSelected: isSelected,
          );
        },
      ),
    );
  }
}
