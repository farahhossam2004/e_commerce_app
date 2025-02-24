
import 'package:e_commerce_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationTile extends StatelessWidget {
  final String iconPath;
  final String title;
  final String subTitle;
  const NotificationTile({
    super.key,
    required this.iconPath,
    required this.title,
    required this.subTitle
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      leading: Container(
        width: 48.w,
        height: 48.h,
        decoration: const ShapeDecoration(
          color: AppColors.notficationIconContainerColor,
          shape: OvalBorder(),
        ),
        child: Image.asset(iconPath),
      ),
      title: Text(
        title,
        style: GoogleFonts.plusJakartaSans(
            color: AppColors.textColor,
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            height: 1.50.h),
      ),
      subtitle: Text(
        subTitle,
        style: GoogleFonts.plusJakartaSans(
          color: AppColors.secondryTextColor,
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          height: 1.43.h,
        ),
      ),
    );
  }
}
