import 'package:flutter/material.dart';
import 'package:shoping_application/shared/components/components.dart';

class SecurityScreen extends StatelessWidget {
  const SecurityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context: context, title: 'Security'),
      body: Center(
        child: Text('security screen'),
      ),
    );
  }
}
