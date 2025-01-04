import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoping_application/layout/shop_layout_screen.dart';
import 'package:shoping_application/shared/components/toast.dart';
import 'package:shoping_application/shared/network/local/cache_helper.dart';

import '../../shared/components/components.dart';
import '../../shared/network/style/colors.dart';
import '../signup/signup_screen.dart';
import 'cubit/register_cubit.dart';
import 'forgetpass_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isSelectd = true;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => RegisterCubit(),
        child: BlocConsumer<RegisterCubit, RegisterStates>(
          listener: (context, state) {
            if (state is ShopLoginSuccessState) {
              if (state.loginModel.status!) {
                showMessage(
                  message: state.loginModel.message.toString(),
                  state: ToastStates.success,
                  context: context,
                );
                CacheHelper.saveData(
                  key: 'token',
                  value: state.loginModel.data!.token,
                ).then((onValue) {
                  print(state.loginModel.data!.token);
                  navigatorAndFinish(
                      // ignore: use_build_context_synchronously
                      context: context,
                      widget: ShopLayoutScreen());
                });
              } else {
                showMessage(
                    message: state.loginModel.message.toString(),
                    state: ToastStates.error,
                    context: context);
              }
            }
          },
          builder: (context, state) {
            RegisterCubit cubit = RegisterCubit.get(context);
            return Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                backgroundColor: Colors.white,
                leading: backIconButton(context: context),
              ),
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      customMainText(data: 'Login'),
                      Text(
                        'Use demo account to have a better vision, it\'s pre filled.',
                        style: TextStyle(
                            color: secondaryColor, fontSize: 18, fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      customTextFormField(
                        controller: emailController,
                        prefixIcon: Icons.email,
                        validator: (value) {
                          if (value.toString().isEmpty) {
                            return 'Please enter your email address';
                          }
                          return null;
                        },
                        hintText: 'demo@email.com',
                        autofocus: true,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      customTextFormField(
                          controller: passwordController,
                          prefixIcon: Icons.lock,
                          validator: (value) {
                            if (value.toString().isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                          hintText: '********',
                          obscureText: cubit.password,
                          suffixIcon: cubit.password ? Icons.visibility_off : Icons.visibility,
                          onTapSuffixIcon: () {
                            cubit.changeObsecure();
                          }),
                      CheckboxListTile(
                        value: cubit.remeber,
                        onChanged: (value) {
                          cubit.ChangeRememberMy();
                        },
                        activeColor: Color(0xff4B39EF),
                        contentPadding: EdgeInsets.all(0),
                        controlAffinity: ListTileControlAffinity.leading,
                        selected: isSelectd,
                        title: Text(
                          'Remember me',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: primaryColor,
                          ),
                        ),
                      ),
                      ConditionalBuilder(
                        condition: state is! ShopLoginLoadingState,
                        builder: (context) => defaultButton(
                            onTap: () {
                              if (formKey.currentState!.validate()) {
                                cubit.userLogin(
                                  email: emailController.text,
                                  password: passwordController.text,
                                );
                              }
                            },
                            title: 'Sign in',
                            icon: Icons.login),
                        fallback: (context) => Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                          alignment: Alignment.center,
                          child: TextButton(
                            onPressed: () {
                              navigator(context: context, widget: ForgetpassScreen());
                            },
                            child: Text(
                              'Forgot the password?',
                              style: TextStyle(
                                  color: primaryColor, fontSize: 14, fontWeight: FontWeight.w400),
                            ),
                          )),
                      divide('or continue with'),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          customIconButton(onTap: () {}, icon: Icons.apple),
                          customIconButton(onTap: () {}, icon: Icons.g_mobiledata, iconSize: 50),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Don’t have an account?',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w400, color: primaryColor),
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
              ),
            );
          },
        ));
  }
}
