import 'package:flutter/material.dart';
import 'package:shoping_application/module/language/widget/lang_widget.dart';
import 'package:shoping_application/shared/components/components.dart';
import 'package:shoping_application/shared/network/style/colors.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

int currentIndex = 0;

class _LanguageScreenState extends State<LanguageScreen> {
  void _toggleSelection(index) {
    setState(() {
      currentIndex = currentIndex == index ? null : index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context: context, title: 'Language'),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 15.0),
              child: Text(
                'Change Language',
                style: TextStyle(
                  color: primaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  bool isSelected = currentIndex == index;
                  return LangWidget(
                    function: () => _toggleSelection(index),
                    isSelected: isSelected,
                    index: index,
                  );
                },
                separatorBuilder: (context, index) => SizedBox(height: 10),
                itemCount: 4,
              ),
            )
          ],
        ),
      ),
    );
  }
}
