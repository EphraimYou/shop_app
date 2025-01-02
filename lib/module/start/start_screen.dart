import 'package:flutter/material.dart';
import '../../shared/network/style/colors.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/0_1_(8).jpeg'),
                fit: BoxFit.cover)),
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Spacer(),
              Text(
                'Welcome.',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: textForm,
                  fontSize: 48,
                ),
              ),
              Text(
                'The best e-commerce app of the century for your daily needs!',
                style: TextStyle(
                    color: subtextColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w300),
              )
            ],
          ),
        ),
      ),
    );
  }
}
