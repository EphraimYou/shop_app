import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoping_application/layout/cubit/home_cubit.dart';
import 'package:shoping_application/module/edit_profile/widget/text_form_widget.dart';
import 'package:shoping_application/module/edit_profile/widget/upload_image_widget.dart';
import 'package:shoping_application/shared/components/components.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getProfile(),
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Scaffold(
            appBar: appBar(context: context, title: 'Edit Profile'),
            body: ConditionalBuilder(
              condition: HomeCubit.get(context).profile != null,
              builder: (context) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      if (state is UpdateUserLoadingState)
                        SizedBox(
                          height: 10,
                          child: LinearProgressIndicator(),
                        ),
                      UploadImageWidget(),
                      TextFormWidget(),
                    ],
                  ),
                ),
              ),
              fallback: (context) => Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        },
      ),
    );
  }
}
