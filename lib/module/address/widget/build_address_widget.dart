import 'package:flutter/material.dart';
import 'package:shoping_application/model/address_model.dart';
import 'package:shoping_application/module/address/cubit/address_cubit.dart';
import 'package:shoping_application/shared/network/style/colors.dart';

class BuildAddressWidget extends StatelessWidget {
  final AddressModel model;
  const BuildAddressWidget({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: model.data?.data.length,
        itemBuilder: (context, index) {
          bool isSelected = AddressCubit.get(context).selectIndex == index;
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListTile(
              trailing: isSelected
                  ? Icon(
                      Icons.check_box_outlined,
                      color: Colors.lightBlue,
                    )
                  : Icon(
                      Icons.crop_square,
                      color: Color(0xFFF8DBCE),
                    ),
              onTap: () {
                AddressCubit.get(context).toggleSelection(index);
              },
              tileColor: Colors.white,
              contentPadding: EdgeInsets.all(10),
              shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              title: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    model.data?.data[index].name.toString().toUpperCase() ??
                        'null',
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  if (isSelected)
                    Padding(
                      padding: const EdgeInsetsDirectional.only(start: 15.0),
                      child: Container(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 3, 10, 3),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: backgroundColor,
                        ),
                        child: Text(
                          'Default',
                          style: TextStyle(
                              color: primaryColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                ],
              ),
              textColor: Colors.white,
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${model.data?.data[index].city ?? 'null'},  ${model.data?.data[index].region ?? 'null'}',
                    style: TextStyle(
                        color: secondaryColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    model.data?.data[index].details ?? 'null',
                    style: TextStyle(
                        color: secondaryColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              leading: Stack(
                alignment: Alignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: backgroundColor,
                    radius: 25,
                  ),
                  CircleAvatar(
                    backgroundColor: primaryColor,
                    radius: 17,
                  ),
                  Icon(
                    Icons.location_on_outlined,
                    color: backgroundColor,
                    size: 22,
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
