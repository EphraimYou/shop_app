import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../login/cubit/register_cubit.dart';
import '../login/login_screen.dart';
import '../../shared/components/components.dart';
import '../../shared/network/style/colors.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  TextEditingController passwordControler = TextEditingController();
  TextEditingController rePasswordControler = TextEditingController();
  TextEditingController emailControler = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => RegisterCubit(),
        child: BlocConsumer<RegisterCubit, RegisterStates>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            RegisterCubit cubit = BlocProvider.of(context);
            return Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                backgroundColor: Colors.white,
                leading: backIconButton(context: context),
              ),
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    customMainText(data: 'Signup'),
                    Text(
                      'Create new account',
                      style: TextStyle(
                        color: secondaryColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    customTextFormField(
                      autofocus: true,
                      controller: emailControler,
                      prefixIcon: Icons.email,
                      validator: (value) {
                        if (value.toString().isEmpty) {
                          return 'email must be nto epmty';
                        }
                        return null;
                      },
                      hintText: 'Emaill',
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    customTextFormField(
                        controller: passwordControler,
                        prefixIcon: Icons.lock,
                        validator: (value) {
                          if (value.toString().isEmpty) {
                            return 'password must be nto epmty';
                          }
                          if (passwordControler != rePasswordControler) {
                            return 'password not matching';
                          }
                          return null;
                        },
                        hintText: 'password',
                        obscureText: cubit.password,
                        onTapSuffixIcon: () {
                          cubit.changeObsecure();
                        },
                        suffixIcon: cubit.password
                            ? Icons.visibility_off
                            : Icons.visibility),
                    SizedBox(
                      height: 15,
                    ),
                    customTextFormField(
                        controller: rePasswordControler,
                        prefixIcon: Icons.lock,
                        validator: (value) {
                          if (value.toString().isEmpty) {
                            return 'pasword must be nto epmty';
                          }
                          if (passwordControler != rePasswordControler) {
                            return 'password not matching';
                          }
                          return null;
                        },
                        hintText: 'Retry password',
                        obscureText: cubit.rePassword,
                        onTapSuffixIcon: () {
                          cubit.changeReObsecure();
                        },
                        suffixIcon: cubit.rePassword
                            ? Icons.visibility_off
                            : Icons.visibility),
                    SizedBox(
                      height: 30,
                    ),
                    defaultButton(
                      onTap: () {},
                      title: 'Signup',
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.only(top: 24, bottom: 15),
                      child: divide('Or signup with'),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        customIconButton(
                            onTap: () {},
                            icon: Icons.g_mobiledata,
                            iconSize: 50),
                        customIconButton(
                          onTap: () {},
                          icon: Icons.apple,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Have an account?',
                          style: TextStyle(
                              color: secondaryColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                        TextButton(
                            onPressed: () {
                              navigator(
                                  context: context, widget: LoginScreen());
                            },
                            child: Text(
                              'Login',
                              style: TextStyle(color: primaryColor),
                            )),
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        ));
  }
}
