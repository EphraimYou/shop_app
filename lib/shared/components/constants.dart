import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

String? token = '';

List<Map<String, dynamic>> bannersContent = [
  {
    'image': 'assets/images/0_0_(8)_Medium.jpeg',
    'title': '25% Special Summer',
    'subTitle': 'Summer collections with special offers are here',
  },
  {
    'image': 'assets/images/0_0_(12)_Medium.jpeg',
    'title': '40% Mens shoes',
    'subTitle': 'Best offer for fathers day',
  },
  {
    'image': 'assets/images/0_0_(10)_Medium.jpeg',
    'title': '30% Girls',
    'subTitle': 'Top girls will get discount on any',
  },
];
/* -------------------------------------------------------------------------- */
List<Map<String, dynamic>> categoriesIcon = [
  {
    'title': 'order',
    'Icon': Icons.document_scanner_rounded,
  },
  {
    'title': 'Clothes',
    'Icon': Icons.local_mall,
  },
  {
    'title': 'Shoes',
    'Icon': FontAwesomeIcons.shoePrints,
  },
  {
    'title': 'Kitchen',
    'Icon': FontAwesomeIcons.utensils,
  },
  {
    'title': 'electronics',
    'Icon': FontAwesomeIcons.bolt,
  },
  {
    'title': 'food',
    'Icon': FontAwesomeIcons.bowlFood,
  },
];

/* -------------------------------------------------------------------------- */
List<Map<String, dynamic>> profileItems = [
  {
    'title': 'Edit Profile',
    'Icon': Icons.person_pin_outlined,
  },
  {
    'title': 'Customer Chat Support',
    'Icon': FontAwesomeIcons.solidCommentDots,
  },
  {
    'title': 'Addresses',
    'Icon': Icons.add_location,
  },
  {
    'title': 'Payment Methods',
    'Icon': Icons.account_balance_wallet_outlined,
  },
  {
    'title': 'Shopping Methods',
    'Icon': Icons.location_on,
  },
  {'title': 'Notification Setting', 'Icon': Icons.notifications},
  {
    'title': 'Security',
    'Icon': Icons.security,
  },
  {
    'title': 'Language',
    'Icon': Icons.language,
  },
  {
    'title': 'Privacy Police',
    'Icon': Icons.lock,
  },
  {
    'title': 'Help Center',
    'Icon': Icons.help_center_outlined,
  },
  {
    'title': 'Invent Friends',
    'Icon': Icons.people,
  },
];

List<Map<String, dynamic>> contactUs = [
  {
    'title': 'General Support Tips',
    'content': 'How do I import assets into my FlutterFlow project?\n\n'
        'Check our documentation on assets to learn about importing and managing assets in FlutterFlow.\n\n'
        'How can I add custom code to my project?\n\n'
        'Learn about adding custom code in our Custom Code documentation.\n\n'
        'What to do when my build fails?\n\n'
        'For build issues, visit our troubleshooting guide for detailed steps to resolve common problems.\n',
  },
  {
    'title': 'Refund policy',
    'heder': 'Frequently Asked Questions',
    'content': 'How do I start using FlutterFlow?\n\n'
        'Getting started with FlutterFlow is easy. You can follow our Getting Started Guide to create your first project.\n\n'
        'Where can I learn more about FlutterFlow features?\n\n'
        'Our blog and YouTube channel are great resources for learning about what you can do with FlutterFlow.\n\n'
        'Can I get support from the community?\n\n'
        'Yes, the FlutterFlow community is a great place to get help and share your knowledge with others.\n\n'
        'We offer a variety of templates for different use cases. Check out our marketplace to browse our selection.\n\n'
        'How can I troubleshoot common issues?\n\n'
        'Our Intercom articles cover a range of troubleshooting topics to help you resolve common issues.\n',
  },
  {
    'title': 'Starting to buy',
    'content': 'How do I import assets into my FlutterFlow project?\n\n'
        'Check our documentation on assets to learn about importing and managing assets in FlutterFlow.\n\n'
        'How can I add custom code to my project?\n\n'
        'Learn about adding custom code in our Custom Code documentation.\n\n'
        'What to do when my build fails?\n\n'
        'For build issues, visit our troubleshooting guide for detailed steps to resolve common problems.\n',
  },
  {
    'title': 'How to get help',
    'content': 'How do I import assets into my FlutterFlow project?\n\n'
        'Check our documentation on assets to learn about importing and managing assets in FlutterFlow.\n\n'
        'How can I add custom code to my project?\n\n'
        'Learn about adding custom code in our Custom Code documentation.\n\n'
        'What to do when my build fails?\n\n'
        'For build issues, visit our troubleshooting guide for detailed steps to resolve common problems.\n\n'
        'Where can I find FlutterFlow tutorials?\n\n'
        'For step-by-step tutorials, visit our YouTube channel where we regularly upload educational content.\n',
  },
  {
    'title': 'Which post service?',
    'content': 'Where can I find FlutterFlow tutorials?\n\n'
        'For step-by-step tutorials, visit our YouTube channel where we regularly upload educational content.\n',
  },
];
/* -------------------------------------------------------------------------- */
List<Map<String, dynamic>> privacyContents = [
  {
    'title': 'Privacy Policy',
    'content': 'Effective date: November 3, 2023\n\n'
        'At BuilderKing, accessible from our app, one of our main priorities is the privacy of our visitors. This Privacy Policy document contains types of information that is collected and recorded by BuilderKing and how we use it.\n\n'
        'How can I add custom code to my project?\n\n'
        'If you have additional questions or require more information about our Privacy Policy, do not hesitate to contact us.\n\n'
        'This Privacy Policy applies only to our online activities and is valid for visitors to our app with regards to the Information that they shared and/or collect in Bulliderring. This policy is not applicable to any information collected offline or via channels other than this app\n\n'
  },
  {
    'title': 'Consent',
    'content':
        'By using our app, you hereby consent to our Privacy Policy and agree to its tams.\n\n'
            'Information we collect.'
  },
  {
    'title': 'Information we collect',
    'content': 'The personal information that you are asked to provide, and the reasons why you are asked to provide it will be made dear to you at the point we ask you to provide your personal information.\n\n'
        'If you contact us directly, we may receive additional Information about you such as your name, email address, phone number, the contents of the message.\n\n'
        'andiron attachments you may send us, and any other Information you may choose to provide.\n\n'
        'How we use your information.\n\n'
  },
  {
    'title': 'How we use your information',
    'content':
        'We use the information we collect in various ways, Including fox.\n'
            '\t\t* Provide, operate, and maintain our app.\n'
            '\t\t* Improve, personate, and expand our app.\n'
            '\t\t* Understand and analyze how you use our app.\n'
            '\t\t* Develop new products, services, features, and functionality.\n'
  },
  {
    'title': 'Contact us',
    'content':
        'For any questions or conses regarding your privacy, you may contact us using the following details.\n\n'
            'BuilderKing Support\n\n'
            'Email support@builderkingapp.com '
  },
];
/* -------------------------------------------------------------------------- */
List<Map<String, dynamic>> transactions = [
  {
    'price': '50',
    'time': '2:25pm',
    'date': 'Jan 24, 2025',
  },
  {
    'price': '100',
    'time': '5:13pm',
    'date': 'Feb 24, 2025',
  },
  {
    'price': '25',
    'time': '3:20pm',
    'date': 'Mar 22, 2025',
  },
  {
    'price': '200',
    'time': '8:30am',
    'date': 'Oct 1, 2025',
  },
  {
    'price': '150',
    'time': '10:50pm',
    'date': 'May 3, 2025',
  },
  {
    'price': '180',
    'time': '12:05pm',
    'date': 'Jun 3, 2025',
  },
  {
    'price': '70',
    'time': '11:25pm',
    'date': 'Jul 26, 2025',
  },
  {
    'price': '55',
    'time': '7:34pm',
    'date': 'Aug 18, 2025',
  },
];
