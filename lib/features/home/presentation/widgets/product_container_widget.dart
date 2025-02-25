import 'package:e_commerce_app/core/constants/app_colors.dart';
import 'package:e_commerce_app/features/home/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductContainerWidget extends StatelessWidget {
  final ProductModel product;
  const ProductContainerWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 159,
      height: 225.h,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16.r)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
              height: 110.h,
              width: 220.w,
              child: Image.network(
                product.image!,
                fit: BoxFit.fitHeight,
              )),
          SizedBox(
            height: 10.h,
          ),
          Text(
            product.title!,
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
            '\$ ${product.price!.toString()}',
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
          Container(
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
        ],
      ),
    );
  }
}
