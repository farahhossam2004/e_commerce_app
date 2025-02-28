import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/core/database/local_database/local_db_helper.dart';
import 'package:e_commerce_app/features/cart/data/models/product_cart_model.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  List<ProductCartModel> cartProducts = [];
  CartCubit() : super(CartInitial());

  Future<void> getCartProducts() async {
    emit(CartLoading());

    try {
      await SQLHelper.get().then((value) {
        cartProducts =
            value.map((product) => ProductCartModel.fromJson(product)).toList();

        emit(CartLoaded());
      });
    } catch (error) {
      print(error.toString());
      emit(CartError(error.toString()));
    }
  }

  Future<void> deleteProductFromCart(String id, int index) async {
    emit(CartLoading());
    try {
      await SQLHelper.delete(id);
      cartProducts.removeAt(index);
      emit(CartLoaded());
    } catch (error) {
      emit(CartError(error.toString()));
    }
  }

  Future<void> incrementProductQuantity(String id, int index) async {
    // emit(CartLoading());
    try {
      cartProducts[index].quantity = cartProducts[index].quantity! + 1;

      await SQLHelper.update(
        id,
        cartProducts[index].title!,
        cartProducts[index].description!,
        cartProducts[index].image!,
        cartProducts[index].quantity!,
        cartProducts[index].price!.toDouble(),
      );
      // print('Updated product');
      emit(CartLoaded());
    } catch (error) {
      emit(CartError(error.toString()));
    }
  }

  Future<void> decrementProductQuantity(String id, int index) async {
    // emit(CartLoading());
    try {
      if (cartProducts[index].quantity! > 1) {
        cartProducts[index].quantity = cartProducts[index].quantity! - 1;

        await SQLHelper.update(
          id,
          cartProducts[index].title!,
          cartProducts[index].description!,
          cartProducts[index].image!,
          cartProducts[index].quantity!,
          cartProducts[index].price!.toDouble(),
        );

        emit(CartLoaded());
      }
    } catch (error) {
      emit(CartError(error.toString()));
    }
  }
}
