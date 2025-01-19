import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoping_application/layout/shop_layout_screen.dart';
import 'package:shoping_application/shared/components/constants.dart';
import 'package:shoping_application/shared/components/toast.dart';
import 'package:shoping_application/shared/network/local/cache_helper.dart';
import '../login/cubit/register_cubit.dart';
import '../login/login_screen.dart';
import '../../shared/components/components.dart';
import '../../shared/network/style/colors.dart';

// ignore: must_be_immutable
class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => RegisterCubit(),
        child: BlocConsumer<RegisterCubit, RegisterStates>(
          listener: (context, state) {
            if (state is RegisterSuccessState) {
              if (state.registerModel.status!) {
                showMessage(
                  message: state.registerModel.message.toString(),
                  state: ToastStates.success,
                  context: context,
                );
                CacheHelper.saveData(
                  key: 'token',
                  value: state.registerModel.data?.token,
                ).then((onValue) {
                  //! tack care must be save toke again because toke is kil
                  token = state.registerModel.data?.token;
                  navigatorAndFinish(
                      // ignore: use_build_context_synchronously
                      context: context,
                      widget: ShopLayoutScreen());
                });
              } else {
                showMessage(
                  message: state.registerModel.message.toString(),
                  state: ToastStates.error,
                  context: context,
                );
              }
            }
          },
          builder: (context, state) {
            RegisterCubit cubit = BlocProvider.of(context);

            return Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                backgroundColor: Colors.white,
                leading: backIconButton(context: context),
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Form(
                    autovalidateMode: AutovalidateMode.always,
                    key: formKey,
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
                          controller: nameController,
                          prefixIcon: Icons.person,
                          validator: (value) {
                            if (value.toString().isEmpty) {
                              return 'name must be nto empty';
                            }
                            return null;
                          },
                          hintText: 'Full Name',
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        customTextFormField(
                          controller: phoneController,
                          prefixIcon: Icons.phone_android,
                          validator: (value) {
                            if (value.toString().isEmpty) {
                              return 'phone must be nto empty';
                            }
                            return null;
                          },
                          hintText: 'Phone',
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        customTextFormField(
                          autofocus: true,
                          controller: emailController,
                          prefixIcon: Icons.email,
                          validator: (value) {
                            if (value.toString().isEmpty) {
                              return 'email must be nto empty';
                            }
                            return null;
                          },
                          hintText: 'Email',
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        customTextFormField(
                            controller: passwordController,
                            prefixIcon: Icons.lock,
                            validator: (value) {
                              if (value.toString().isEmpty) {
                                return 'password must be nto empty';
                              }
                              // if (passwordController != rePasswordController) {
                              //   return 'password not matching';
                              // }
                              return null;
                            },
                            hintText: 'password',
                            obscureText: cubit.password,
                            onTapSuffixIcon: () {
                              cubit.changeObscure();
                            },
                            suffixIcon: cubit.password
                                ? Icons.visibility_off
                                : Icons.visibility),
                        SizedBox(
                          height: 15,
                        ),
                        customTextFormField(
                            controller: confirmPasswordController,
                            prefixIcon: Icons.lock,
                            validator: (value) {
                              if (value.toString().isEmpty) {
                                return 'password must be nto empty';
                              }
                              if (passwordController.text !=
                                  confirmPasswordController.text) {
                                return 'password not matching';
                              }
                              return null;
                            },
                            hintText: 'Retry password',
                            obscureText: cubit.rePassword,
                            onTapSuffixIcon: () {
                              cubit.changeReObscure();
                            },
                            suffixIcon: cubit.rePassword
                                ? Icons.visibility_off
                                : Icons.visibility),
                        SizedBox(
                          height: 30,
                        ),
                        ConditionalBuilder(
                          condition: state is! RegisterLoadingState,
                          builder: (context) => defaultButton(
                            onTap: () {
                              if (formKey.currentState!.validate()) {
                                cubit.userRegister(
                                  email: emailController.text,
                                  phone: phoneController.text,
                                  name: nameController.text,
                                  password: passwordController.text,
                                );
                              }
                            },
                            title: 'Signup',
                          ),
                          fallback: (context) => Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.only(
                              top: 24, bottom: 15),
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
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ));
  }
}
