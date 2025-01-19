import 'package:flutter/material.dart';
import 'package:shoping_application/layout/cubit/home_cubit.dart';
import 'package:shoping_application/shared/components/components.dart';
import 'package:shoping_application/shared/network/style/colors.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:date_format/date_format.dart';

// ignore: must_be_immutable
class TextFormWidget extends StatelessWidget {
  TextFormWidget({super.key});

  final nameController = TextEditingController();
  final timeController = TextEditingController();
  final dateController = TextEditingController();
  final addressController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final List<String> items = [
    'Male',
    'Female',
    'Other',
  ];
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    HomeCubit cubit = HomeCubit.get(context);

    emailController.text = cubit.profile?.data?.email ?? 'null@hot.mail';
    phoneController.text = cubit.profile?.data?.phone ?? '0120000000000';
    nameController.text = cubit.profile?.data?.name ?? 'null';
    // timeController.text = TimeOfDay.now() as String;
    // dateController.text = DateTime.now() as String;
    addressController.text = 'Cairo';
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.always,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40.0),
        child: Column(
          children: [
            customTextFormField(
              controller: nameController,
              hintText: 'User Name',
              prefixIcon: Icons.person,
              validator: (value) {
                if (value.toString().isEmpty) {
                  return 'Username must be not empty';
                }
                return null;
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'available',
                    style: TextStyle(
                      color: secondaryColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            customTextFormField(
              controller: emailController,
              hintText: 'Email',
              prefixIcon: Icons.email_outlined,
              validator: (value) {
                if (value.toString().isEmpty) {
                  return 'email must be not empty';
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            customTextFormField(
              controller: dateController,
              hintText: 'Set Date',
              prefixIcon: Icons.date_range_outlined,
              suffixIcon: Icons.edit_calendar_outlined,
              onTapSuffixIcon: () {
                showDatePicker(
                  context: context,
                  firstDate: DateTime.now(),
                  lastDate: DateTime.parse("2025-04-15"),
                ).then((value) {
                  dateController.text =
                      formatDate(value!, [yyyy, '-', mm, '-', dd]);
                });
              },
              validator: (value) {
                if (value.toString().isEmpty) {
                  return 'date must be not empty';
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            customTextFormField(
              controller: timeController,
              hintText: 'Set Time',
              suffixIcon: Icons.access_time,
              prefixIcon: Icons.edit_attributes_outlined,
              onTapSuffixIcon: () {
                showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                ).then((value) {
                  timeController.text =
                      // ignore: use_build_context_synchronously
                      value?.format(context).toString() ?? '00:00';
                });
              },
              validator: (value) {
                if (value.toString().isEmpty) {
                  return 'time must be not empty';
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            customTextFormField(
              controller: addressController,
              hintText: 'Address',
              prefixIcon: Icons.location_on,
              validator: (value) {
                if (value.toString().isEmpty) {
                  return 'Address must be not empty';
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            customTextFormField(
              controller: phoneController,
              hintText: 'Phone',
              prefixIcon: Icons.phone,
              validator: (value) {
                if (value.toString().isEmpty) {
                  return 'phone must be not empty';
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            Center(
              child: DropdownButtonHideUnderline(
                child: DropdownButton2<String>(
                  isExpanded: true,
                  hint: Text(
                    'Select Gender',
                    style: TextStyle(
                        fontSize: 14,
                        color: secondaryColor,
                        fontWeight: FontWeight.w400),
                  ),
                  items: items
                      .map((String item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ))
                      .toList(),
                  value: selectedValue,
                  onChanged: (value) {
                    HomeCubit.get(context).changeDropDown(value!);
                  },
                  buttonStyleData: ButtonStyleData(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    height: 45,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: textForm,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  menuItemStyleData: const MenuItemStyleData(
                    height: 40,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            defaultButton(
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    cubit.updateProfile(
                      name: nameController.text,
                      email: emailController.text,
                      phone: phoneController.text,
                    );
                  }
                },
                title: 'Update')
          ],
        ),
      ),
    );
  }
}
