import 'package:e_commerce_app/core/constants/app_colors.dart';
import 'package:e_commerce_app/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgetPasswordModalSheet extends StatelessWidget {
  const ForgetPasswordModalSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 334.h,
      width: double.infinity,
      decoration: BoxDecoration(
          color: AppColors.backgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24.r),
            topRight: Radius.circular(24.r),
          )),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                height: 4.h,
                width: 66.67.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(11.r),
                    color: AppColors.bordetTextInputColor),
              ),
            ),
            SizedBox(
              height: 18.h,
            ),
            Text(
              'Forget password',
              style: GoogleFonts.plusJakartaSans(
                  fontWeight: FontWeight.w600,
                  fontSize: 24.sp,
                  height: 1.25.h,
                  color: AppColors.textColor),
            ),
            SizedBox(
              height: 12.h,
            ),
            Text(
              'Select which contact details should we use to reset your password',
              style: GoogleFonts.plusJakartaSans(
                  color: AppColors.secondryTextColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
                  height: 1.43.h),
            ),
            SizedBox(
              height: 24.h,
            ),
            Container(
              height: 76.h,
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(color: AppColors.bordetTextInputColor)),
              child: Row(
                children: [
                  SvgPicture.asset('assets/images/email_icon.svg'),
                  SizedBox(
                    width: 16.w,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Send via Email',
                        style: GoogleFonts.plusJakartaSans(
                          color: AppColors.secondryTextColor,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          height: 1.67.h,
                        ),
                      ),
                      Text(
                        'bryan.adam83@gmail.com',
                        style: GoogleFonts.plusJakartaSans(
                          color: AppColors.textColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          height: 1.43.h,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 24.h,
            ),
            CustomButton(label: 'Continue', onPressed: () {})
          ],
        ),
      ),
    );
  }
}
