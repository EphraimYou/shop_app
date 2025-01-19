import 'package:flutter/material.dart';
import 'package:shoping_application/shared/components/constants.dart';
import 'package:shoping_application/shared/network/style/colors.dart';

class BuildTextWidget extends StatelessWidget {
  const BuildTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: privacyContents.length,
      itemBuilder: (context, index) => buildItem(privacyContents[index]),
    );
  }

  Widget buildItem(Map<String, dynamic> items) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Text(
              items['title']!,
              style: TextStyle(
                color: primaryColor,
                fontSize: 25,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          Text(
            items['content']!,
            style: TextStyle(
              color: primaryColor,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      );
}
