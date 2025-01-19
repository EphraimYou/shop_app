import 'package:flutter/material.dart';
import 'package:shoping_application/module/address/address_screen.dart';
import 'package:shoping_application/module/customer_support/customer_support.dart';
import 'package:shoping_application/module/edit_profile/edit_profile.dart';
import 'package:shoping_application/module/help_center/help_Center_screen.dart';
import 'package:shoping_application/module/language/language_screen.dart';
import 'package:shoping_application/module/notification_setting/notification_setting_Screen.dart';
import 'package:shoping_application/module/payment_method/payment_method_screen.dart';
import 'package:shoping_application/module/privacy_police/privacy_police_screen.dart';
import 'package:shoping_application/module/security/security_Screen.dart';
import 'package:shoping_application/module/shopping_method/shopping_method_screen.dart';
import 'package:shoping_application/shared/components/components.dart';
import 'package:shoping_application/shared/components/constants.dart';
import 'package:shoping_application/shared/network/style/colors.dart';

// ignore: must_be_immutable
class ItemWidget extends StatelessWidget {
  ItemWidget({super.key});

  List<Widget> profilesScreens = [
    EditProfile(),
    CustomerSupport(),
    AddressScreen(),
    PaymentMethodScreen(),
    ShoppingMethodScreen(),
    NotificationSettingScreen(),
    SecurityScreen(),
    LanguageScreen(),
    PrivacyPoliceScreen(),
    HelpCenterScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => SizedBox(
        height: 8,
      ),
      itemBuilder: (context, index) =>
          profileItem(profileItems[index], context, index),
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 10,
    );
  }

  Widget profileItem(Map<String, dynamic> data, context, int index) => ListTile(
        onTap: () {
          navigator(context: context, widget: profilesScreens[index]);
        },
        trailing: Icon(
          Icons.arrow_forward_ios_rounded,
          color: secondaryColor,
          size: 20,
        ),
        leading: Icon(
          data['Icon'],
          color: secondaryColor,
        ),
        title: Text(
          data['title'],
          style: TextStyle(
            color: primaryColor,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      );
}
