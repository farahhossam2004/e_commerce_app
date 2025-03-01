import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/core/network/dio_helper.dart';
import 'package:e_commerce_app/core/network/endpoints.dart';
import 'package:e_commerce_app/features/home/data/models/product_model.dart';
import 'package:meta/meta.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  List<ProductModel> products = [];
  List<ProductModel> searchedProducts = [];
  List<ProductModel> filteredProducts = [];
  SearchCubit() : super(SearchInitial());

  void getProducts({String? searchQuery}) async {
    emit(SearchLoading());
    try {
      final response = await DioHelper.getData(url: Endpoints.productsEndPoint);
      if (response.statusCode == 200 && response.data != null) {
        products = (response.data as List)
            .map((e) => ProductModel.fromJson(e))
            .toList();
        if (searchQuery != null && searchQuery.isNotEmpty) {
          searchProducts(searchQuery);
        } else {
          emit(SearchLoaded(searchedProducts: products));
        }
      } else {
        emit(SearchError("Failed"));
      }
    } catch (error) {
      print(error.toString());
      emit(SearchError(error.toString()));
    }
  }

  void searchProducts(String query) {
    emit(SearchLoading());

    searchedProducts = products
        .where((product) =>
            product.title!.toLowerCase().contains(query.toLowerCase()))
        .toList();
    emit(SearchLoaded(searchedProducts: searchedProducts));
  }

  void filterProductsByPrice(double minPrice, double maxPrice) {
    emit(SearchLoading());

    filteredProducts = searchedProducts.where((product) {
      return product.price! >= minPrice && product.price! <= maxPrice;
    }).toList();

    emit(SearchLoaded(searchedProducts: filteredProducts));
  }
}
