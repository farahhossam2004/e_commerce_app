import 'package:e_commerce_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SocialMediaLoginWidget extends StatelessWidget {
  final String iconPath;
  final String text;
  const SocialMediaLoginWidget({super.key, required this.iconPath, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      width: double.infinity,
      height: 56.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(34.r),
        border: Border.all(color: AppColors.bordetTextInputColor),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(
            iconPath,
            height: 24.h,
            width: 24.h,
          ),
          SizedBox(
            width: 12.w,
          ),
          Text(
            text,
            textAlign: TextAlign.center,
            style: GoogleFonts.plusJakartaSans(
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                height: 1.50,
                color: AppColors.textColor),
          ),
          SizedBox(
            width: 12.w,
          ),
          Container(
            height: 24.h,
            width: 24.w,
          )
        ],
      ),
    );
  }
}
