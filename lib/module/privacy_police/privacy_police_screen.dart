import 'package:flutter/material.dart';
import 'package:shoping_application/module/privacy_police/widget/build_text_widget.dart';
import 'package:shoping_application/shared/components/components.dart';

class PrivacyPoliceScreen extends StatelessWidget {
  const PrivacyPoliceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context: context, title: 'Privacy Polices'),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: BuildTextWidget(),
      ),
    );
  }
}
