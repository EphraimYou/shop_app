import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoping_application/layout/cubit/home_cubit.dart';
import 'package:shoping_application/module/profile/widget/item_widget.dart';
import 'package:shoping_application/module/profile/widget/user_data_widget.dart';
import 'package:shoping_application/shared/components/components.dart';
import 'package:shoping_application/shared/network/local/cache_helper.dart';
import 'package:shoping_application/shared/network/style/colors.dart';

import '../login/login_method.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = false;
    return BlocProvider(
      create: (context) => HomeCubit()..getProfile(),
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return SafeArea(
            child: Scaffold(
                backgroundColor: Colors.white,
                body: ConditionalBuilder(
                  condition: HomeCubit.get(context).profile != null,
                  builder: (context) => SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Column(
                        children: [
                          UserDataWidget(
                            model: HomeCubit.get(context).profile!,
                          ),
                          Divider(),
                          ItemWidget(),
                          ListTile(
                            leading: Icon(
                              Icons.visibility,
                              color: secondaryColor,
                            ),
                            trailing: Switch(
                                value: isDark,
                                onChanged: (value) {
                                  isDark = true;
                                }),
                            title: Text(
                              'Dark Mode',
                              style: TextStyle(
                                  color: primaryColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          ListTile(
                            onTap: () {
                              CacheHelper.removeDate(key: 'token')
                                  .then((onValue) {
                                navigatorAndFinish(
                                    // ignore: use_build_context_synchronously
                                    context: context,
                                    widget: LoginMethod());
                              });
                            },
                            leading: Icon(
                              Icons.logout,
                              color: error,
                            ),
                            title: Text(
                              'Logout',
                              style: TextStyle(
                                color: error,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                              'Evira Version 1.0.01 Build 25',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: secondaryColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  fallback: (context) => Center(
                    child: CircularProgressIndicator(),
                  ),
                )),
          );
        },
      ),
    );
  }
}
