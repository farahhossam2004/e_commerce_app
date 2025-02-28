import 'package:e_commerce_app/core/constants/app_colors.dart';
import 'package:e_commerce_app/core/database/local_database/local_db_helper.dart';
import 'package:e_commerce_app/features/home/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CheckoutButton extends StatefulWidget {
  final ProductModel product;
  const CheckoutButton({super.key, required this.product});

  @override
  State<CheckoutButton> createState() => _CheckoutButtonState();
}

class _CheckoutButtonState extends State<CheckoutButton> {
  bool isAdded = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (!isAdded) {
          try {
            await SQLHelper.add(
                widget.product.id.toString(),
                widget.product.title!,
                widget.product.description!,
                widget.product.image!,
                1,
                widget.product.price!.toDouble());
            isAdded = true;
            setState(() {});
            print('product added to cart');
          } catch (error) {
            print(error);
          }
        }
      },
      child: Container(
        width: 56.w,
        height: 56.h,
        // padding: const EdgeInsets.all(16),
        decoration: ShapeDecoration(
          color: isAdded ? AppColors.buttonColor : Colors.white,
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 1, color: Color(0xFFEAEAEA)),
            borderRadius: BorderRadius.circular(34.r),
          ),
        ),
        child: Center(
          child: isAdded
              ? const Icon(
                  Icons.add_task_rounded,
                  color: Colors.white,
                )
              : const Icon(
                  Icons.shopping_bag_outlined,
                  color: AppColors.textColor,
                ),
        ),
      ),
    );
  }
}
