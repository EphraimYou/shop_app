import 'package:flutter/material.dart';
import 'login_screen.dart';
import '../signup/signup_screen.dart';
import '../../shared/components/components.dart';
import '../../shared/network/style/colors.dart';

class LoginMethod extends StatelessWidget {
  const LoginMethod({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(
          child: Image(
            image: AssetImage('assets/images/0_1_(7).jpeg'),
            fit: BoxFit.cover,
            width: double.infinity,
          ),
        ),
        Expanded(
            child: Container(
          decoration: BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(
              blurRadius: 100,
              color: Colors.white,
              spreadRadius: 70,
              // offset: Offset.fromDirection(200)
            )
          ]),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(24.0, 0, 24, 24),
            child: Column(
              children: [
                signWith(
                    title: 'Signin with Google',
                    leading: Image(
                      image: AssetImage('assets/images/Frame_(5).png'),
                      height: 24,
                      width: 24,
                    ),
                    onTapp: () {}),
                SizedBox(
                  height: 10,
                ),
                signWith(
                    title: 'signin with Apple',
                    leading: Icon(
                      Icons.apple,
                      size: 24,
                    ),
                    onTapp: () {}),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24.0),
                  child: divide('or'),
                ),
                defaultButton(
                    onTap: () {
                      navigator(context: context, widget: LoginScreen());
                    },
                    icon: Icons.email_outlined,
                    title: 'sign in with email'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account?',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: primaryColor),
                    ),
                    TextButton(
                        onPressed: () {
                          navigator(context: context, widget: SignupScreen());
                        },
                        child: Text(
                          'Sign up',
                          style: TextStyle(
                            color: primaryColor,
                          ),
                        ))
                  ],
                )
              ],
            ),
          ),
        ))
      ],
    ));
  }
}
