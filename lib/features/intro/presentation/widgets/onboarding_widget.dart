import 'package:e_commerce_app/core/constants/app_colors.dart';
import 'package:e_commerce_app/features/intro/logic/cubit/onboarding_progress_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingWidget extends StatelessWidget {
  final String imgPath;
  final String title;
  final String description;
  final VoidCallback onPressed;
  final int index;
  const OnboardingWidget({
    super.key,
    required this.imgPath,
    required this.title,
    required this.description,
    required this.onPressed,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnboardingProgressCubit(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 38.w),
        child: BlocConsumer<OnboardingProgressCubit, OnboardingProgressState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            context.read<OnboardingProgressCubit>().inceasreProgress(index);
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(imgPath),
                SizedBox(
                  height: 40.h,
                ),
                Text(
                  title,
                  style: GoogleFonts.plusJakartaSans(
                      color: AppColors.textColor,
                      fontSize: 28.sp,
                      fontWeight: FontWeight.w600,
                      height: 1.21.h),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 16.h,
                ),
                Text(
                  description,
                  style: GoogleFonts.plusJakartaSans(
                      color: AppColors.secondryTextColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      height: 1.43.h),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 32.h,
                ),
                GestureDetector(
                  onTap: () {
                    onPressed();
                  },
                  child: Stack(alignment: Alignment.center, children: [
                    TweenAnimationBuilder(
                      tween: Tween<double>(
                          begin: 0.1,
                          end:
                              context.read<OnboardingProgressCubit>().progress),
                      duration: const Duration(milliseconds: 500),
                      builder: (context, value, child) {
                        return SizedBox(
                          width: 94.w,
                          height: 94.h,
                          child: CircularProgressIndicator(
                              value:
                                  value, // Controls how much of the border is drawn
                              strokeWidth: 2.w,
                              backgroundColor:
                                  const Color(0xFF2D3B51).withAlpha(8),
                              valueColor: const AlwaysStoppedAnimation<Color>(
                                  AppColors.textColor)),
                        );
                      },
                    ),
                    Positioned(
                      child: Container(
                        width: 62.w,
                        height: 62.h,
                        decoration: ShapeDecoration(
                          color: AppColors.buttonColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(84),
                          ),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.arrow_forward_outlined,
                            color: AppColors.backgroundColor,
                          ),
                        ),
                      ),
                    ),
                  ]),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
