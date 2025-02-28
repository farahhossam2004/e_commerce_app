import 'package:e_commerce_app/core/constants/app_colors.dart';
import 'package:e_commerce_app/core/database/local_database/local_db_helper.dart';
import 'package:e_commerce_app/features/home/data/models/product_model.dart';
import 'package:flutter/material.dart';

class FavIcon extends StatefulWidget {
  final ProductModel product;
  const FavIcon({
    super.key,
    required this.product,
  });

  @override
  State<FavIcon> createState() => _FavIconState();
}

class _FavIconState extends State<FavIcon> {
  bool isFav = false;

  @override
  void initState() {
    super.initState();
    _loadWishlistStatus(); // Load wishlist status when the widget initializes
  }

  Future<void> _loadWishlistStatus() async {
    bool result = await SQLHelper.isInWishlist(widget.product.id.toString());
    if (mounted) { // Check if widget is still in the tree before updating UI
      setState(() {
        isFav = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: isFav
          ? const Icon(
              Icons.favorite_rounded,
              color: Colors.red,
            )
          : const Icon(
              Icons.favorite_border_outlined,
              color: AppColors.textColor,
            ),
      onPressed: () async {
        if (!isFav) {
          try {
            await SQLHelper.addToWishList(
                widget.product.id.toString(),
                widget.product.title!,
                widget.product.description!,
                widget.product.image!,
                widget.product.price!.toDouble());
            isFav = true;
            setState(() {});
          } catch (e) {
            print(e);
          }
        } else {
          try {
            await SQLHelper.deleteFromWishlist(widget.product.id.toString());
            isFav = false;
            setState(() {});
          } catch (e) {
            print(e);
          }
        }
      },
    );
  }
}
