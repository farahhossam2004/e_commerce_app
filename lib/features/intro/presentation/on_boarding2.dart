import 'package:e_commerce_app/core/constants/app_colors.dart';
import 'package:e_commerce_app/features/auth/presentation/login.dart';
import 'package:e_commerce_app/features/intro/presentation/onboarding3.dart';
import 'package:e_commerce_app/features/intro/presentation/widgets/onboarding_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class OnBoarding2 extends StatelessWidget {
  const OnBoarding2({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        actions: [
          TextButton(
            child: Text(
              'Skip',
              style: GoogleFonts.plusJakartaSans(
                  fontSize: 14.sp,
                  color: AppColors.textColor,
                  fontWeight: FontWeight.w500,
                  height: 1.43.h),
            ),
            onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>const LoginPage()));
            },
          )
        ],
      ),
      body: OnboardingWidget(
        index: 2,
        onPressed: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Onboarding3()));
        },
        imgPath: 'assets/images/onboarding2.svg',
        title: 'Get those shopping bags filled',
        description:
            'Add any item you want to your cart or save it on your wishlist, so you don\'t miss it in your future purchase.',
      ),
    );
  }
}
