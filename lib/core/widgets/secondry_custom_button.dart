import 'package:e_commerce_app/core/constants/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SecondryCustomButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const SecondryCustomButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 56.h,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30.r),
          border: Border.all(color: AppColors.buttonColor, width: 0.2)),
      child: CupertinoButton(
        onPressed: onPressed,
        child: Text(
          label,
          style: GoogleFonts.plusJakartaSans(
            color: AppColors.buttonColor,
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
