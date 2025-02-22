import 'package:e_commerce_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductContainerWidget extends StatelessWidget {
  const ProductContainerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 159,
      height: 225.h,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16.r)),
      child: Column(
        children: [
          Image.asset('assets/images/product 1.png'),
          Text(
            'Macbook Pro 15” \n2019 - Intel core i7',
            textAlign: TextAlign.center,
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
            '\$1240',
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
