import 'package:flutter/material.dart';
import 'package:shoping_application/module/payment_method/widget/build_item_widget.dart';
import 'package:shoping_application/shared/components/components.dart';
import 'package:shoping_application/shared/network/style/colors.dart';

class PaymentMethodScreen extends StatefulWidget {
  const PaymentMethodScreen({super.key});

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  int? selectedIndex;
  List<Map<String, dynamic>> items = [
    {
      'image': Icons.account_balance_wallet_outlined,
      'title': 'E-Wallet',
    },
    {
      'image': 'assets/images/Frame_(4).png',
      'title': 'PayPal',
    },
    {
      'image': 'assets/images/Frame_(5).png',
      'title': 'Google Play',
    },
    {
      'image': 'assets/images/Frame_(6).png',
      'title': 'Apple Pay',
    },
  ];

  void toggleSelection(int index) {
    setState(() {
      selectedIndex = selectedIndex == index ? null : index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: appBar(
          context: context,
          title: 'Payment Methods',
          backgroundColor: backgroundColor),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          bool isSelected = selectedIndex == index;
          return buildItemWidget(
            onTap: () => toggleSelection(index),
            json: items[index],
            isSelected: isSelected,
          );
        },
      ),
    );
  }
}
