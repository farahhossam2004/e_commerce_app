import 'package:e_commerce_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoriesRow extends StatelessWidget {
  const CategoriesRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 80.w,
          height: 40.h,
          padding: const EdgeInsets.only(
            left: 4,
          ),
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            color: const Color(0xFF2D3B51),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.r),
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 32.w,
                height: 32.h,
                // padding: const EdgeInsets.all(4),
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
                child: const Icon(
                  Icons.category,
                  color: AppColors.buttonColor,
                  size: 20,
                ),
              ),
              SizedBox(width: 8.w),
              Text(
                'All',
                style: GoogleFonts.plusJakartaSans(
                  color: Colors.white,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  height: 1.29.h,
                ),
              )
            ],
          ),
        ),
        Container(
          width: 114.w,
          height: 40.h,
          padding: const EdgeInsets.only(left: 4),
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 1, color: Color(0xFFF4F4F4)),
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          child: Row(
            children: [
              SizedBox(
                width: 24.w,
                height: 24.h,
                child: const Text(
                  '💻',
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                width: 8.w,
              ),
              Text(
                'Laptops',
                style: GoogleFonts.plusJakartaSans(
                  color: AppColors.textColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  height: 1.29.h,
                ),
              )
            ],
          ),
        ),
        Container(
          width: 130.w,
          height: 40.h,
          padding: const EdgeInsets.only(left: 4),
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 1, color: Color(0xFFF4F4F4)),
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          child: Row(
            children: [
              SizedBox(
                width: 24.w,
                height: 24.h,
                child: const Text(
                  '🎧',
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                width: 8.w,
              ),
              Text(
                'Accessories',
                style: GoogleFonts.plusJakartaSans(
                  color: AppColors.textColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  height: 1.29.h,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
