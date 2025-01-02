import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shoping_application/model/login_model.dart';
import 'package:shoping_application/shared/network/end_points.dart';
import '../../../shared/network/remote/dio/dio_helper.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitial());
  //* take instaince
  static RegisterCubit get(context) => BlocProvider.of(context);

  bool password = true;
  bool rePassword = true;
  bool remeber = false;
  LoginModel? loginModel;
/* -------------------------------------------------------------------------- */

  void changeObsecure() {
    password = !password;
    emit(ChangeObscureTextState());
  }

/* -------------------------------------------------------------------------- */
  void changeReObsecure() {
    rePassword = !rePassword;
    emit(ChangeObscureTextState());
  }

/* -------------------------------------------------------------------------- */
  void ChangeRememberMy() {
    remeber = !remeber;
    emit(ChangeRememberMyState());
  }

/* -------------------------------------------------------------------------- */
/*                                  POST DATA                                 */
/* -------------------------------------------------------------------------- */
  void userLogin({
    required String email,
    required String password,
  }) {
    emit(ShopLoginLoadingState());
    DioHelper.postData(
      url: LOGIN,
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
}
