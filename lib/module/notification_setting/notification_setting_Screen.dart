import 'package:flutter/material.dart';
import 'package:shoping_application/shared/components/components.dart';

class NotificationSettingScreen extends StatelessWidget {
  const NotificationSettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context: context, title: 'Notification Setting'),
      body: Center(
        child: Text('notification setting'),
      ),
    );
  }
}
