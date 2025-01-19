import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shoping_application/model/login_model.dart';
import 'package:shoping_application/shared/network/end_points.dart';
import '../../../shared/network/remote/dio/dio_helper.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitial());
  //* take instance
  static RegisterCubit get(context) => BlocProvider.of(context);

  bool password = true;
  bool rePassword = true;
  bool remember = false;
  LoginModel? loginModel;
/* -------------------------------------------------------------------------- */

  void changeObscure() {
    password = !password;
    emit(ChangeObscureTextState());
  }

/* -------------------------------------------------------------------------- */
  void changeReObscure() {
    rePassword = !rePassword;
    emit(ChangeObscureTextState());
  }

/* -------------------------------------------------------------------------- */
  // ignore: non_constant_identifier_names
  void ChangeRememberMy() {
    remember = !remember;
    emit(ChangeRememberMyState());
  }

/* -------------------------------------------------------------------------- */
/*                                  POST login data.                                 */
/* -------------------------------------------------------------------------- */
  void userLogin({
    required String email,
    required String password,
  }) {
    emit(ShopLoginLoadingState());
    DioHelper.postData(
      path: LOGIN,
      data: {
        'email': email,
        'password': password,
      },
      lang: 'en',
    ).then((value) {
      loginModel = LoginModel.fromJson(value.data);
      emit(ShopLoginSuccessState(loginModel!));
    }).catchError((error) {
      emit(ShopLoginErrorState(error: error));
    });
  }

  /* -------------------------------------------------------------------------- */
  /*                           POST registration data                           */
  /* -------------------------------------------------------------------------- */
  LoginModel? registerModel;
  void userRegister({
    required String phone,
    required String name,
    required String email,
    required String password,
  }) {
    emit(RegisterLoadingState());
    DioHelper.postData(
      path: REGISTER,
      data: {
        'name': name,
        'phone': phone,
        'email': email,
        'password': password,
      },
      lang: 'en',
    ).then((value) {
      registerModel = LoginModel.fromJson(value.data);
      emit(RegisterSuccessState(registerModel: registerModel!));
    }).catchError((error) {
      emit(RegisterErrorState());
    });
  }
}
