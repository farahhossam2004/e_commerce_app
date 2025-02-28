import 'package:e_commerce_app/core/constants/app_colors.dart';
import 'package:e_commerce_app/features/home/data/models/product_model.dart';
import 'package:e_commerce_app/features/home/presentation/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class ProductContainerWidget extends StatelessWidget {
  final List<ProductModel> products;
  final ProductModel product;
  bool isNewArrival;
  ProductContainerWidget(
      {super.key,
      required this.product,
      required this.products,
      this.isNewArrival = true});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductDetailsScreen(
                    products: products, product: product)));
      },
      child: Container(
        width: 140,
        height: 225.h,
        decoration: BoxDecoration(boxShadow: const [
          BoxShadow(
            color: AppColors.productBoxShadowColor,
            blurRadius: 32,
            offset: Offset(0, 20),
            spreadRadius: -8,
          )
        ], color: Colors.white, borderRadius: BorderRadius.circular(16.r)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
                height: 110.h,
                width: 220.w,
                child: Image.network(
                  product.image ?? "https://via.placeholder.com/150",
                  fit: BoxFit.contain,
                )),
            SizedBox(
              height: 10.h,
            ),
            Text(
              product.title ?? "No Title Available",
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.plusJakartaSans(
                  color: AppColors.textColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  height: 1.2.h),
            ),
            SizedBox(
              height: 4.h,
            ),
            Text(
              '\$ ${product.price!.toString() ?? "0.00"}',
              textAlign: TextAlign.center,
              style: GoogleFonts.plusJakartaSans(
                color: AppColors.priceTextColor,
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                height: 1.24.h,
              ),
            ),
            SizedBox(
              height: 9.h,
            ),
            isNewArrival
                ? Container(
                    width: 84.w,
                    height: 21.h,
                    padding: EdgeInsets.symmetric(vertical: 4.h),
                    decoration: ShapeDecoration(
                        color: AppColors.labelContainerColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.r))),
                    child: Text(
                      'NEW ARRIVAL',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.plusJakartaSans(
                        color: Colors.white,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  )
                : SizedBox(
                    height: 21.h,
                  )
          ],
        ),
      ),
    );
  }
}
