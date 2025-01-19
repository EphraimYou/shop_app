import 'package:flutter/material.dart';
import 'package:shoping_application/shared/components/components.dart';

class CustomerSupport extends StatelessWidget {
  const CustomerSupport({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context: context, title: 'Customer Support'),
      body: Center(
        child: Text('Customer support'),
      ),
    );
  }
}
