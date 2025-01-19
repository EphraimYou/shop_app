import 'package:flutter/material.dart';
import 'package:shoping_application/module/help_center/widget/build_contact_us_widget.dart';
import 'package:shoping_application/module/help_center/widget/build_faq_widget%20copy.dart';
import 'package:shoping_application/shared/components/components.dart';
import 'package:shoping_application/shared/network/style/colors.dart';

class HelpCenterScreen extends StatelessWidget {
  const HelpCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Color(0XFFF1F4F8),
        appBar: appBar(
            context: context,
            title: 'Help Center',
            backgroundColor: backgroundColor),
        body: TabBarView(
          children: [
            BuildFaqWidget(),
            BuildContactUsWidget(),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget tabBarViewFunction() => TabBar(
        // indicator:,
        labelColor: primaryColor,
        labelPadding: EdgeInsetsDirectional.only(end: 100),
        indicatorColor: primaryColor,
        unselectedLabelColor: secondaryColor,
        splashFactory: NoSplash.splashFactory,
        labelStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        onTap: (value) {
          print(value);
        },
        tabs: [
          Tab(child: Text('FAQ')),
          Tab(child: Text('Contact Us')),
        ],
      );
}
