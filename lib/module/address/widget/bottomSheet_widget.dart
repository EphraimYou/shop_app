import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shoping_application/module/address/cubit/address_cubit.dart';
import 'package:shoping_application/shared/components/components.dart';
import 'package:shoping_application/shared/network/style/colors.dart';

class BottomSheetWidget extends StatelessWidget {
  const BottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final cityController = TextEditingController();
    final regionController = TextEditingController();
    final detailsController = TextEditingController();

    final notesController = TextEditingController();
    final latitudeController = TextEditingController();
    final longitudeController = TextEditingController();

    notesController.text = 'notes';
    latitudeController.text = '3.255888888888';
    longitudeController.text = '3.255888888888';

    final formKey = GlobalKey<FormState>();

    return BlocProvider(
      create: (context) => AddressCubit(),
      child: BlocConsumer<AddressCubit, AddressState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Container(
            padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 20),
            height: 440,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: Form(
              autovalidateMode: AutovalidateMode.always,
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Spacer(),
                      Text(
                        'Add New Address',
                        style: TextStyle(
                            color: primaryColor,
                            fontSize: 24,
                            fontWeight: FontWeight.w500),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            true
                                ? FontAwesomeIcons.chevronDown
                                : FontAwesomeIcons.chevronUp,
                            size: 17,
                            color: primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Divider(),
                  subText('Address Name'),
                  SizedBox(height: 5),
                  customTextFormField(
                    controller: nameController,
                    hintText: 'Address Name',
                    validator: (value) {
                      if (value.toString().isEmpty) {
                        return 'please enter address name';
                      }
                      return null;
                    },
                    autofocus: true,
                  ),
                  SizedBox(height: 5),
                  subText('Address Details'),
                  SizedBox(height: 10),
                  customTextFormField(
                    controller: cityController,
                    hintText: 'Address City',
                    validator: (value) {
                      if (value.toString().isEmpty) {
                        return 'please enter address city';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  customTextFormField(
                    controller: regionController,
                    hintText: 'Address Region',
                    validator: (value) {
                      if (value.toString().isEmpty) {
                        return 'please enter address region';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  customTextFormField(
                    controller: detailsController,
                    hintText: 'Address Details',
                    validator: (value) {
                      if (value.toString().isEmpty) {
                        return 'please enter address details';
                      }
                      return null;
                    },
                  ),
                  Spacer(),
                  ConditionalBuilder(
                    condition: state is PostAddressLoadingState,
                    builder: (context) =>
                        Center(child: CircularProgressIndicator()),
                    fallback: (context) => defaultButton(
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          AddressCubit.get(context).postAddressData(
                            addressName: nameController.text,
                            addressCity: cityController.text,
                            addressRegion: regionController.text,
                            addressDetails: detailsController.text,
                            addressLatitude: latitudeController.text,
                            addressLongitude: longitudeController.text,
                            addressNotes: notesController.text,
                          );
                        }
                      },
                      title: 'Add',
                      icon: Icons.add_location,
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

/* --------------------------------- widget --------------------------------- */
  Widget subText(String text) => Text(
        text,
        style: TextStyle(
          color: primaryColor,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      );
/* -------------------------------------------------------------------------- */
}
