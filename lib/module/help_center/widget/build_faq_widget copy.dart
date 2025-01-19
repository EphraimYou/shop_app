import 'package:flutter/material.dart';
import 'package:shoping_application/shared/components/constants.dart';
import 'package:shoping_application/shared/network/style/colors.dart';

class BuildFaqWidget extends StatelessWidget {
  const BuildFaqWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView.separated(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) => buildItem(contactUs[index]),
          separatorBuilder: (context, index) => SizedBox(height: 20),
          itemCount: contactUs.length,
        ),
      ),
    );
  }

  Widget buildItem(Map<String, dynamic> contents) => Container(
        padding: EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: ExpansionTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          childrenPadding: EdgeInsets.all(20),
          title: Text(
            contents['title'],
            style: TextStyle(
              color: primaryColor,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          backgroundColor: Colors.white,
          children: [
            if (contents['heder'] != null)
              Container(
                padding: EdgeInsetsDirectional.only(bottom: 20),
                child: Text(
                  contents['heder'],
                  style: TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 30,
                  ),
                ),
              ),
            Text(
              contents['content'],
              style: TextStyle(
                color: primaryColor,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              // textAlign: TextAlign.center,
            ),
          ],
        ),
      );
}
