import 'package:e_commerce_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class OTPContainerNumber extends StatelessWidget {
  final String text;
  const OTPContainerNumber({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 75.w,
      height: 72.h,
      padding: EdgeInsets.all(16),
      decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
              side:
                  BorderSide(width: 1.w, color: AppColors.bordetTextInputColor),
              borderRadius: BorderRadius.circular(12.r))),
      child: Center(
        child: Text(
          text,
          style: GoogleFonts.plusJakartaSans(
              color: AppColors.textColor,
              fontSize: 32.sp,
              fontWeight: FontWeight.w400,
              height: 1.25.h),
        ),
      ),
    );
  }
}