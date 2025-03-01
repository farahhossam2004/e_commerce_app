import 'package:e_commerce_app/core/constants/app_colors.dart';
import 'package:e_commerce_app/core/widgets/custom_button.dart';
import 'package:e_commerce_app/features/auth/presentation/widgets/otp_container_number.dart';
import 'package:e_commerce_app/features/auth/presentation/widgets/register_success_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: Padding(
            padding: EdgeInsets.only(left: 20.w, top: 8.h),
            child: Container(
              height: 60.h,
              width: 72.w,
              decoration: ShapeDecoration(
                  shape: CircleBorder(
                side: BorderSide(
                    width: 1.w, color: AppColors.bordetTextInputColor),
              )),
              child: Icon(
                Icons.arrow_back,
                size: 20.sp,
              ),
            ),
          ),
          backgroundColor: AppColors.backgroundColor,
          centerTitle: true,
          title: Text(
            'OTP',
            style: GoogleFonts.plusJakartaSans(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                height: 1.44.h,
                color: AppColors.textColor),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Row(),
              Image.asset('assets/images/OTP.png'),
              SizedBox(
                height: 24.h,
              ),
              Text(
                'Verification code',
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
                'We have sent the code verification to you',
                style: GoogleFonts.plusJakartaSans(
                  color: AppColors.secondryTextColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  height: 1.43.h,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'WhatsApp Number ',
                    style: GoogleFonts.plusJakartaSans(
                      color: AppColors.secondryTextColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      height: 1.43.h,
                    ),
                  ),
                  Text(
                    ' +62812 788 6XXXX',
                    style: GoogleFonts.plusJakartaSans(
                      color: AppColors.textColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                      height: 1.43.h,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 32.h,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OTPContainerNumber(
                    text: '3',
                  ),
                  OTPContainerNumber(
                    text: '2',
                  ),
                  OTPContainerNumber(
                    text: '1',
                  ),
                  OTPContainerNumber(
                    text: '3',
                  ),
                ],
              ),
              SizedBox(
                height: 24.h,
              ),
              Text(
                'Recent code in 32s',
                style: GoogleFonts.plusJakartaSans(
                  color: AppColors.textColor,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  height: 1.50.h,
                ),
              ),
              SizedBox(
                height: 71.h,
              ),
              CustomButton(
                  label: 'Continue',
                  onPressed: () {
                    showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        builder: (context) => const RegisterSuccessModal());
                  })
            ],
          ),
        ));
  }
}
