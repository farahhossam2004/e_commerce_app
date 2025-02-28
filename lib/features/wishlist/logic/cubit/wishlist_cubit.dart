import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/core/database/local_database/local_db_helper.dart';
import 'package:e_commerce_app/features/cart/data/models/product_cart_model.dart';
import 'package:e_commerce_app/features/home/data/models/product_model.dart';
import 'package:meta/meta.dart';

part 'wishlist_state.dart';

class WishlistCubit extends Cubit<WishlistState> {
  List<ProductModel> products = [];
  WishlistCubit() : super(WishlistInitial());

  Future<void> getProductsWishlist() async {
    emit(WishListLoading());
    try {
      await SQLHelper.getWishList().then((value) =>
          {products = value.map((p) => ProductModel.fromJson(p)).toList()});
      emit(WishListLoaded());
    } catch (e) {
      print(e.toString());
      emit(WishlistError(message: e.toString()));
    }
  }

  void refreshWishlist() {
    emit(WishlistUpdated()); 
    getProductsWishlist();  
  }
}
