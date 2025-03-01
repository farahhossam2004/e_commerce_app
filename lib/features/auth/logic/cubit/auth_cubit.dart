import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/core/database/cache/cache_helper.dart';
import 'package:e_commerce_app/core/network/dio_helper.dart';
import 'package:e_commerce_app/core/network/endpoints.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  void login(String userName, String password) {
    emit(AuthLoginLoading());
    Map<String, String> data = {'username': "mor_2314", 'password': "83r5^_"};
    DioHelper.postData(url: Endpoints.loginEndPoint, data: data).then((value) {
      if (value.statusCode == 200) {
        CacheHelper.saveData(key: "token", value: value.data['token']);
        emit(AuthLoginSuccess());
      } else {
        emit(AuthLoginFailure("Login failed "));
      }
    }).onError((error, stackTrace) {
      emit(AuthLoginFailure("Login failed , please try again ${error}"));
    });
  }

  void register(String username, String password) {
    emit(AuthRegisterLoading());
    Map<String, String> data = {
      'username': username,
      'password': password,
    };
    DioHelper.postData(url: Endpoints.signUpEndPoint, data: data).then((value) {
      if (value.statusCode == 200) {
        emit(AuthRegisterSuccess());
      } else {
        emit(AuthRegisterFailure("Registration failed"));
      }
    }).onError((error, stackTrace) {
      emit(AuthRegisterFailure("registeration failed"));
    });
  }
}
