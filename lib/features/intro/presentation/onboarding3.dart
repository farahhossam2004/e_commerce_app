import 'package:e_commerce_app/core/constants/app_colors.dart';
import 'package:e_commerce_app/features/auth/presentation/login.dart';
import 'package:e_commerce_app/features/intro/presentation/widgets/onboarding_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Onboarding3 extends StatelessWidget {
  const Onboarding3({super.key});

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
        index: 3,
        onPressed: () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const LoginPage()));
        },
        imgPath: 'assets/images/onboarding3.svg',
        title: 'Fast & Secure payment',
        description:
            'There are many payment options available to speed up and simplify your payment process.',
      ),
    );
  }
}
