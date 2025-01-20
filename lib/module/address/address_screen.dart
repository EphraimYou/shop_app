import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoping_application/module/address/cubit/address_cubit.dart';
import 'package:shoping_application/module/address/widget/bottomSheet_widget.dart';
import 'package:shoping_application/module/address/widget/build_address_widget.dart';
import 'package:shoping_application/shared/components/components.dart';
import 'package:shoping_application/shared/network/style/colors.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddressCubit()..getAddresses(),
      child: BlocConsumer<AddressCubit, AddressState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          AddressCubit cubit = AddressCubit.get(context);
          return Scaffold(
            backgroundColor: backgroundColor,
            appBar: appBar(
              context: context,
              title: 'Address',
              backgroundColor: backgroundColor,
            ),
            body: ConditionalBuilder(
              condition: cubit.addressModel != null,
              builder: (context) => Column(
                children: [
                  BuildAddressWidget(
                    model: cubit.addressModel!,
                  ),
                  Spacer(),
                  defaultButton(
                    onTap: () {
                      showBottomSheet(
                        context: context,
                        builder: (context) => BottomSheetWidget(),
                      );
                    },
                    title: 'Add New Address',
                    icon: Icons.add_location,
                  )
                ],
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
