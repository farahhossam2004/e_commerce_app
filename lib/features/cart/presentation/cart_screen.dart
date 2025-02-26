import 'package:e_commerce_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 20.w),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 44.w,
                height: 44.h,
                decoration: ShapeDecoration(
                  shape: CircleBorder(
                    side: BorderSide(color: Color(0xFFEAEAEA), width: 1.w),
                  ),
                ),
                child: const Icon(
                  Icons.arrow_back,
                  color: AppColors.textColor,
                  size: 20,
                ),
              ),
              Text(
                'Cart',
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  height: 1.44.h,
                ),
              ),
              Container(
                width: 44.w,
              )
            ],
          ),
          SizedBox(
            height: 44.h,
          ),
          Container(
            width: 201,
            height: 201,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(),
            child: Image.asset('assets/images/cart.png'),
          ),
          SizedBox(
            height: 24.h,
          ),
          Text(
            'Your cart is an empty!',
            style: GoogleFonts.plusJakartaSans(
              color: AppColors.textColor,
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
              height: 1.40.h,
            ),
          ),
          SizedBox(
            height: 12.h,
          ),
          Text('Looks like you haven\'t added anything to your cart yet',
              textAlign: TextAlign.center,
              style: GoogleFonts.plusJakartaSans(
                color: AppColors.secondryTextColor,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                height: 1.43.h,
              ))
        ],
      ),
    );
  }
}
