import 'package:e_commerce_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class TimeContainer extends StatelessWidget {
  final String timeText;
  const TimeContainer({super.key, required this.timeText});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24.w,
      height: 24.h,
      padding: const EdgeInsets.all(3),
      decoration: ShapeDecoration(
        color: AppColors.secondryBorderColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
      child: Text(
        textAlign: TextAlign.center,
        timeText,
        style: GoogleFonts.plusJakartaSans(
          color: AppColors.textColor,
          fontSize: 12.sp,
          fontWeight: FontWeight.w700,
          height: 1.50.h,
        ),
      ),
    );
  }
}
