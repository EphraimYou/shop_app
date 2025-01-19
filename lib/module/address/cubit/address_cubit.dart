import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shoping_application/model/address_model.dart';
import 'package:shoping_application/shared/components/constants.dart';
import 'package:shoping_application/shared/network/end_points.dart';
import 'package:shoping_application/shared/network/remote/dio/dio_helper.dart';

part 'address_state.dart';

class AddressCubit extends Cubit<AddressState> {
  AddressCubit() : super(AddressInitial());

  static AddressCubit get(context) => BlocProvider.of(context);

  int? selectIndex;

  //assign selectIndex;
  void toggleSelection(int index) {
    selectIndex = selectIndex == index ? null : index;
    emit(ChangeCheckBoxState());
  }

/* -------------------------------------------------------------------------- */
/*                           get address information                          */
/* -------------------------------------------------------------------------- */
  AddressModel? addressModel;
  void getAddresses() {
    emit(GetAddressLoadingState());

    DioHelper.getData(
      path: ADDRESS,
      token: token,
    ).then((value) {
      addressModel = AddressModel.fromJson(value.data);
      if (addressModel != null) {
        print('your current city is ==>>> ${addressModel?.data?.data[0].city}');
        emit(GetAddressSuccessState());
      }
    }).catchError((error) {
      emit(GetAddressErrorState());
    });
  }

/* -------------------------------------------------------------------------- */
/*                           get address information                          */
/* -------------------------------------------------------------------------- */
  AddressModel? updateAddressModel;
  void postAddressData({
    required String addressName,
    required String addressCity,
    required String addressRegion,
    required String addressNotes,
    required String addressDetails,
    required String addressLatitude,
    required String addressLongitude,
  }) {
    emit(PostAddressLoadingState());
    DioHelper.postData(
      path: ADDRESS,
      data: {
        'name': addressName,
        'city': addressCity,
        'region': addressRegion,
        'notes': addressNotes,
        'details': addressDetails,
        'latitude': addressLatitude,
        'longitude': addressLongitude,
      },
    ).then((value) {
      if (updateAddressModel?.status == true) {
        getAddresses();
        emit(PostAddressSuccessState());
      }
    }).catchError((error) {
      emit(PostAddressErrorState());
    });
  }
}
