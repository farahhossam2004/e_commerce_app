import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/core/network/dio_helper.dart';
import 'package:e_commerce_app/core/network/endpoints.dart';
import 'package:e_commerce_app/features/home/data/models/product_model.dart';
import 'package:meta/meta.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  List<ProductModel> products = [];
  List<ProductModel> searchedProducts = [];
  SearchCubit() : super(SearchInitial());

  void searchProducts(String query) {
    if (query.isEmpty) {
      emit(SearchEmpty());
      return;
    }

    emit(SearchLoading());

    DioHelper.getData(url: Endpoints.productsEndPoint).then((value) {
      if (value.statusCode == 200 && value.data != null) {
        products =
            (value.data as List).map((e) => ProductModel.fromJson(e)).toList();
      }
    }).catchError((error) {
      print(error.toString());
    });

    searchedProducts = products
        .where((product) =>
            product.title!.toLowerCase().contains(query.toLowerCase()))
        .toList();
    emit(SearchLoaded(searchedProducts: searchedProducts));
  }
}
