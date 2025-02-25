import 'package:e_commerce_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountSettingsTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool isLogout;
  // final VoidCallback onTap;
  final isNotification;
  const AccountSettingsTile(
      {super.key,
      required this.icon,
      required this.title,
      this.isLogout = false,
      this.isNotification = false});

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
        child: Icon(
          icon,
          color: isLogout ? Colors.red : AppColors.textColor,
        ),
      ),
      title: Text(
        title,
        style: GoogleFonts.plusJakartaSans(
          fontSize: 16.sp,
          color: isLogout ? Colors.red : AppColors.textColor,
          fontWeight: FontWeight.w600,
          height: 1.50.h,
        ),
      ),
      trailing: isLogout
          ? null
          : const Icon(
              Icons.arrow_forward_ios_rounded,
              color: AppColors.textColor,
            ),
    );
  }
}
