import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/core/network/dio_helper.dart';
import 'package:e_commerce_app/core/network/endpoints.dart';
import 'package:e_commerce_app/features/home/data/models/user_model.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  UserModel? userData;

  void getCurrentUserData() {
    emit(HomeUserLoading());
    DioHelper.getData(url: Endpoints.currentUserDataEndpoint).then((value) {
      if (value.statusCode == 200 && value.data != null) {
        userData = UserModel.fromJson(value.data);
        print(userData!.name);
        emit(HomeUserLoaded());
      } else {
        emit(HomeUserError('Error'));
      }
    }).catchError((error) {
      emit(HomeUserError(error.toString()));
    });
  }
}
