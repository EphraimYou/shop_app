import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../shared/components/components.dart';
import '../../shared/network/style/colors.dart';

class ForgetpassScreen extends StatelessWidget {
  ForgetpassScreen({super.key});

  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: backIconButton(context: context),
        title: Text(
          'Forget password',
          style: TextStyle(
            color: primaryColor,
            fontWeight: FontWeight.w400,
            fontSize: 16,
          ),
        ),
        titleSpacing: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Spacer(),
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: primaryColor,
              ),
              alignment: Alignment.center,
              child: FaIcon(
                FontAwesomeIcons.key,
                size: 20,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'Select which contact details should we use to reset your password',
              style: TextStyle(
                color: primaryColor,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: customTextFormField(
                  controller: emailController,
                  prefixIcon: Icons.email_outlined,
                  validator: (value) {
                    if (value.toString().isEmpty) {
                      return 'email must be not empty';
                    }
                  },
                  hintText: 'Email'),
            ),
            defaultButton(onTap: () {}, title: 'Continue')
          ],
        ),
      ),
    );
  }
}
