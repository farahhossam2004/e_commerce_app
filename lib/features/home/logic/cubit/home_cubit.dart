import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/core/network/dio_helper.dart';
import 'package:e_commerce_app/core/network/endpoints.dart';
import 'package:e_commerce_app/features/home/data/models/product_model.dart';
import 'package:e_commerce_app/features/home/data/models/user_model.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  UserModel? userData;
  List<ProductModel> products = [];

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

  void getProducts() {
    emit(HomeProductsLoading());
    DioHelper.getData(url: Endpoints.productsEndPoint).then((value) {
      if (value.statusCode == 200 && value.data != null) {
        products =
            (value.data as List).map((e) => ProductModel.fromJson(e)).toList();
        print(products.length);
        emit(HomeProductsLoaded());
      } else {
        emit(HomeProductsError('Error'));
      }
    }).catchError((error) {
      emit(HomeProductsError(error.toString()));
    });
  }
}
