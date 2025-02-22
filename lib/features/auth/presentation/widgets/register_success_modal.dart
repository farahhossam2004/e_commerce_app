import 'package:e_commerce_app/core/constants/app_colors.dart';
import 'package:e_commerce_app/core/widgets/custom_button.dart';
import 'package:e_commerce_app/features/home/presentation/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterSuccessModal extends StatelessWidget {
  const RegisterSuccessModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 517.h,
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 4.h,
              width: 66.67.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(11.r),
                  color: AppColors.bordetTextInputColor),
            ),
            SizedBox(
              height: 24.h,
            ),
            Image.asset('assets/images/success.png'),
            // SizedBox(
            //   height: 24.h,
            // ),
            Text(
              'Congratulations!',
              style: GoogleFonts.plusJakartaSans(
                color: AppColors.textColor,
                fontSize: 24.sp,
                fontWeight: FontWeight.w600,
                height: 1.25.h,
              ),
            ),
            SizedBox(
              height: 12.h,
            ),
            Text(
              'Your account is ready to use. You will be redirected to the Homepage in a few seconds.',
              textAlign: TextAlign.center,
              style: GoogleFonts.plusJakartaSans(
                color: AppColors.secondryTextColor,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                height: 1.43.h,
              ),
            ),
            SizedBox(
              height: 24.h,
            ),
            CustomButton(
                label: 'Continue',
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                })
          ],
        ),
      ),
    );
  }
}
