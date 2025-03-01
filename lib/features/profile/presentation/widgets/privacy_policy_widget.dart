import 'package:e_commerce_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class privacyPolicyWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  const privacyPolicyWidget({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.plusJakartaSans(
            color: AppColors.textColor,
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            height: 1.44.h,
          ),
        ),
        SizedBox(
          height: 12.h,
        ),
        Text(
          subtitle,
          style: GoogleFonts.plusJakartaSans(
            color: AppColors.secondryTextColor,
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            height: 1.43.h,
          ),
        ),
      ],
    );
  }
}
