import 'package:flutter/material.dart';
import 'package:shoping_application/shared/network/style/colors.dart';

// ignore: must_be_immutable
class BuildContactUsWidget extends StatelessWidget {
  BuildContactUsWidget({super.key});

  List<Map<String, dynamic>> data = [
    {
      'icon': Icons.headset_mic_rounded,
      'title': 'Customer Service',
    },
    {
      'icon': Icons.email_outlined,
      'title': 'Support',
    },
    {
      'icon': Icons.phone,
      'title': 'Contact Us',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ListView.separated(
        itemBuilder: (context, index) => itemBuilder(data[index]),
        separatorBuilder: (context, index) => SizedBox(
          height: 20,
        ),
        itemCount: data.length,
      ),
    );
  }

  Widget itemBuilder(Map<String, dynamic> json) => ListTile(
        onTap: () {},
        tileColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        title: Text(
          json['title'],
          style: TextStyle(
            color: primaryColor,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: Icon(json['icon']),
      );
}
